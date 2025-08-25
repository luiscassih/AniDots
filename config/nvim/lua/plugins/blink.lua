local function get_lsp_completion_context(completion)
  local ok, source_name = pcall(
    function() return vim.lsp.get_client_by_id(completion.client_id).name end
  )
  if not ok then return nil end

  if source_name == "ts_ls" then
    return completion.detail
  elseif source_name == "pyright" and completion.labelDetails ~= nil then
    return completion.labelDetails.description
  elseif source_name == "texlab" then
    return completion.detail
  elseif source_name == "clangd" then
    local doc = completion.documentation
    if doc == nil then return end

    local import_str = doc.value
    import_str = import_str:gsub("[\n]+", "")

    local str
    str = import_str:match("<(.-)>")
    if str then return "<" .. str .. ">" end

    str = import_str:match("[\"'](.-)[\"']")
    if str then return '"' .. str .. '"' end

    return nil
  end
end

return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    -- keymap = { preset = 'default' },
    keymap = {
      preset = 'default',
      ['<C-h>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide' },
      ['<CR>'] = { 'accept', 'fallback' },

      ['<C-,>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-.>'] = { 'scroll_documentation_down', 'fallback' },

      ['<C-u>'] = { 'snippet_forward', 'fallback' },
      ['<C-d>'] = { 'snippet_backward', 'fallback' },
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
        },
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
      -- menu = {
      --   border = "rounded",
      -- },
      menu = {
        min_width = 34,
        max_height = 10,
        draw = {
          treesitter = { "lsp" },
          align_to = "cursor",
          padding = 1,
          gap = 3,
          columns = {
            { "kind_icon", gap = 1, "label" },
            { "label_description" },
          },
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx) return ctx.kind_icon end,
              highlight = function(ctx) return "BlinkCmpKind" .. ctx.kind end,
            },
            label = {
              width = {
                fill = true,
                max = 60,
              },
              text = function(ctx) return ctx.label .. ctx.label_detail end,
              highlight = function(ctx)
                local highlights = {
                  {
                    0,
                    #ctx.label,
                    group = ctx.deprecated and "BlinkCmpLabelDeprecated"
                      or "BlinkCmpLabel",
                  },
                }
                if ctx.label_detail then
                  table.insert(highlights, {
                    #ctx.label,
                    #ctx.label + #ctx.label_detail,
                    group = "BlinkCmpLabelDetail",
                  })
                end

                for _, idx in ipairs(ctx.label_matched_indices) do
                  table.insert(
                    highlights,
                    { idx, idx + 1, group = "BlinkCmpLabelMatch" }
                  )
                end

                return highlights
              end,
            },
            label_description = {
              text = function(ctx) return get_lsp_completion_context(ctx.item) end,
              highlight = "BlinkCmpLabelDescription",
            },
          },
        },
      },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" },

    signature =  { enabled = true },
  },
  opts_extend = { "sources.default" }
}
