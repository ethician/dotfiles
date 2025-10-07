-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

-- tabs operations
vim.keymap.set("n", "<A-Left>", ":tabprevious<CR>", opts)
vim.keymap.set("n", "<A-Right>", ":tabnext<CR>", opts)
vim.keymap.set("i", "<A-Left>", "<ESC>:tabprevious<CR>", opts)
vim.keymap.set("i", "<A-Right>", "<ESC>:tabnext<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":tabmove -1<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":tabmove +1<CR>", opts)
vim.keymap.set("i", "<C-Left>", "<ESC>:tabmove -1<CR>", opts)
vim.keymap.set("i", "<C-Right>", "<ESC>:tabmove +1<CR>", opts)

-- screen movement
vim.keymap.set("n", "<A-Up>", "<C-y>", opts)
vim.keymap.set("n", "<A-Down>", "<C-e>", opts)
vim.keymap.set("i", "<A-Up>", "<ESC><C-y>a", opts)
vim.keymap.set("i", "<A-Down>", "<ESC><C-e>a", opts)
