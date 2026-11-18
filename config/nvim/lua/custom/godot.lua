-- godot_fzf.lua
-- Defines the global OpenGodotFzf() so `:ww` can call it.
--
-- What it does:
--   1. Saves the current buffer
--   2. Finds the Godot project root (folder containing project.godot)
--   3. Opens fzf with:  "▶ Run project"  first, then every .tscn ordered by
--      how close it is (in the folder tree) to the file you have open
--   4. Enter on an item -> runs the project / that scene with Godot
--
-- Requires: folke/snacks.nvim with the picker enabled (opts = { picker = { enabled = true } }).
-- Godot binary: set `vim.g.godot_bin = "/path/to/godot"` if "godot" isn't in PATH.

local RUN_PROJECT = "▶ Run project"

local function split(path)
  local parts = {}
  for p in path:gmatch("[^/]+") do
    parts[#parts + 1] = p
  end
  return parts
end

-- Number of folder steps needed to go from dir A to dir B (up, then down)
local function dir_distance(a, b)
  local common = 0
  for i = 1, math.min(#a, #b) do
    if a[i] ~= b[i] then break end
    common = i
  end
  return (#a - common) + (#b - common)
end

local function find_root(start_dir)
  local found = vim.fs.find("project.godot", { upward = true, path = start_dir })[1]
  return found and vim.fs.dirname(found) or nil
end

local function collect_scenes(root)
  local scenes = {}
  for name, type in vim.fs.dir(root, {
    depth = math.huge,
    skip = function(dir)
      -- don't descend into these
      return not (dir:match("^%.godot") or dir:match("^%.git") or dir:match("/%.godot"))
    end,
  }) do
    if type == "file" and name:match("%.tscn$") then
      scenes[#scenes + 1] = name -- relative to root
    end
  end
  return scenes
end

local function sorted_scenes(root, current_file)
  local rel_file = current_file:sub(#root + 2)
  local cur_dir = split(vim.fs.dirname(rel_file) == "." and "" or vim.fs.dirname(rel_file))
  local cur_base = vim.fn.fnamemodify(rel_file, ":t:r")

  local scored = {}
  for _, scene in ipairs(collect_scenes(root)) do
    local sdir = vim.fs.dirname(scene)
    local dist = dir_distance(cur_dir, split(sdir == "." and "" or sdir))
    -- same name as the current script/shader (player.gd -> player.tscn) goes first
    if vim.fn.fnamemodify(scene, ":t:r") == cur_base then
      dist = -1
    end
    scored[#scored + 1] = { path = scene, dist = dist }
  end

  table.sort(scored, function(a, b)
    if a.dist ~= b.dist then return a.dist < b.dist end
    return a.path < b.path
  end)

  local result = {}
  for _, s in ipairs(scored) do
    result[#result + 1] = s.path
  end
  return result
end

local function run_godot(root, scene)
  local bin = vim.g.godot_bin or "godot"
  local cmd = { bin, "--path", root }
  if scene then
    table.insert(cmd, "res://" .. scene)
  end
  vim.fn.jobstart(cmd, { detach = true, cwd = root })
  vim.notify(scene and ("Godot: running " .. scene) or "Godot: running project")
end

function OpenGodot()
  -- save current file (silent so :ww doesn't error on unnamed/readonly buffers)
  if vim.bo.modifiable and vim.bo.modified and vim.api.nvim_buf_get_name(0) ~= "" then
    vim.cmd("silent! write")
  end

  local current = vim.fs.normalize(vim.api.nvim_buf_get_name(0))
  local root = find_root(vim.fs.dirname(current))
  if not root then
    vim.notify("project.godot not found", vim.log.levels.ERROR)
    return
  end

  local items = { RUN_PROJECT }
  vim.list_extend(items, sorted_scenes(root, current))

  local ok, snacks = pcall(require, "snacks")
  if not ok or not snacks.picker then
    vim.notify("snacks.nvim picker not available", vim.log.levels.ERROR)
    return
  end

  local picker_items = {}
  for _, text in ipairs(items) do
    picker_items[#picker_items + 1] = {
      text = text,
      scene = text ~= RUN_PROJECT and text or nil,
    }
  end

  snacks.picker.pick({
    title = "Godot",
    items = picker_items,
    format = "text",
    layout = { preset = "select" },
    -- default sort puts shorter text first on ties; keep our order instead
    sort = { fields = { "score:desc", "idx" } },
    confirm = function(picker, item)
      picker:close()
      if item then
        run_godot(root, item.scene)
      end
    end,
  })
end
