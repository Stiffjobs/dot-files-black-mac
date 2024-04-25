-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
vim.api.nvim_set_keymap("n", "<leader>fm", "<cmd>Telescope lsp_document_symbols<CR>", { noremap = true, silent = true })
map("i", "jj", "<Esc>")
map("n", "<C-.>", vim.lsp.buf.code_action)
-- map("n", "<C-h>", [[<cmd>lua require('tmux').move_left()<cr>]])
-- map("n", "<C-j>", [[<cmd>lua require('tmux').move_down()<cr>]])
-- map("n", "<C-k>", [[<cmd>lua require('tmux').move_up()<cr>]])
-- map("n", "<C-l>", [[<cmd>lua require('tmux').move_right()<cr>]])

map("n", "<C-h>", require("smart-splits").move_cursor_left)
map("n", "<C-j>", require("smart-splits").move_cursor_down)
map("n", "<C-k>", require("smart-splits").move_cursor_up)
map("n", "<C-l>", require("smart-splits").move_cursor_right)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<Tab>", "<Nop>")
map("i", "<Tab>", "<Tab>")
vim.keymap.set("i", "<S-Tab>", "<S-Tab>")
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left({ at_edge = "wrap" }))
-- vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
-- vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
-- vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
-- vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
