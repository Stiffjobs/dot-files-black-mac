return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    local opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        cpp = { "clang-format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        ruby = { "rubocop" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        go = { "gofmt" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
      },
      formatters = {
        prettier = {
          -- prepend_args = { "--single-quote", "--use-tabs", "--arrow-parens avoid" },
        },
      },
    }
    return opts
  end,
}
