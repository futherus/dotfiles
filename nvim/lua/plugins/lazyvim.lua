return {
-- For non-git repos.
--  {
--    "mhinz/vim-signify"
--  },
--  {
--    "lewis6991/gitsigns.nvim",
--    enabled = false
--  },
  {
    "nmac427/guess-indent.nvim",
    config = function()
      require('guess-indent').setup {}
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    config = function()
      require('tokyonight').setup({
        style = "moon",
        on_colors = function(colors)
          -- colors.diff.text = colors.git.change
          -- colors.diff.delete = colors.git.delete
          -- colors.diff.add = colors.git.add
        end,
        on_highlights = function(highlights, colors)
          highlights.DiffChange.bg = colors.magenta
          highlights.DiffChange.fg = colors.black

          highlights.DiffText.bold = true
          highlights.DiffText.bg = colors.red
          highlights.DiffText.fg = colors.black

          highlights.DiffAdd.bg = colors.green1
          highlights.DiffAdd.fg = colors.black

          highlights.DiffDelete.bg = colors.red
          highlights.DiffDelete.fg = colors.black
        end
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
--          ["<C-e>"] = cmp.mapping.abort(),
--          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-e>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = defaults.sorting,
      }
    end
  },
}
