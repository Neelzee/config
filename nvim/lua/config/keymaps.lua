-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Delete arrow key mappings
vim.keymap.set({ "n", "i", "v" }, "<Up>", function() end)
vim.keymap.set({ "n", "i", "v" }, "<Down>", function() end)
vim.keymap.set({ "n", "i", "v" }, "<Left>", function() end)
vim.keymap.set({ "n", "i", "v" }, "<Right>", function() end)
