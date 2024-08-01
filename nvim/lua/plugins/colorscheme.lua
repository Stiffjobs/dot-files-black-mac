function ColorMyPencils(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)
end

return {
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  { "rebelot/kanagawa.nvim", lazy = false },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    config = function()
      require("gruvbox").setup({
        --   terminal_colors = false, -- add neovim terminal colors
        --   undercurl = true,
        --   underline = false,
        --   bold = true,
        --   italic = {
        --     strings = false,
        --     emphasis = false,
        --     comments = false,
        --     operators = false,
        --     folds = false,
        --   },
        --   strikethrough = true,
        --   invert_selection = false,
        --   invert_signs = false,
        --   invert_tabline = false,
        --   invert_intend_guides = false,
        --   inverse = false, -- invert background for search, diffs, statuslines and errors
        --   contrast = "hard", -- can be "hard", "soft" or empty string
        --   dim_inactive = false,
        --   transparent_mode = true,
        -- })
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {},
    config = function()
      require("tokyonight").setup({
        -- transparent = true,
        -- styles = {
        --   sidebars = "transparent",
        --   floats = "transparent",
        -- },
        on_highlights = function(hl, colors)
          hl.LineNr = {
            fg = colors.yellow,
          }
          hl.CursorLineNr = {
            fg = colors.yellow,
          }
        end,
      })

      vim.cmd("colorscheme tokyonight")
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        disable_background = true,
        styles = {
          transparency = true,
        },
      })
      vim.cmd("colorscheme rose-pine")
      ColorMyPencils()
    end,
  },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  -- },
  {
    "EdenEast/nightfox.nvim",
  },
  {
    "0xstepit/flow.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("flow").setup({
        transparent = true, -- Set transparent background.
        fluo_color = "pink", --  Fluo color: pink, yellow, orange, or green.
        mode = "normal", -- Intensity of the palette: normal, bright, desaturate, or dark. Notice that dark is ugly!
        aggressive_spell = false, -- Display colors for spell check.
      })

      vim.cmd("colorscheme flow")
    end,
  },
}
