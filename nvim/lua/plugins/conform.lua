return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    return {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        cpp = { "clang-format" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        ruby = { "rubocop" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        go = { "gofmt" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        graphql = { "prettierd" },
        zig = { "zigfmt" },
        rust = { "rustfmt" },
      },
      formatters = {
        prettierd = {
          prepend_args = { "--single-quote", "--use-tabs" },
        },
      },
    }
  end,
}
