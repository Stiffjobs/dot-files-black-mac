return {
  "smart-splits-nvim/smart-splits.nvim",
  version = "^2",
  lazy = false,
  dependencies = {
    "smart-splits-nvim/backend-ghostty",
  },
  config = function()
    require("smart-splits").setup({})
    -- Detects the owning Ghostty or cmux app; skips tmux/SSH sessions.
    require("ghostty-smart-splits").setup()
  end,
}
