-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Go keybindings
-- Go keybindings
vim.keymap.set("n", "<leader>gr", "<cmd>GoRun<cr>", { desc = "Go Run" })
vim.keymap.set("n", "<leader>gt", "<cmd>GoTest<cr>", { desc = "Go Test" })
vim.keymap.set("n", "<leader>gd", "<cmd>GoDebug<cr>", { desc = "Go Debug" })
vim.keymap.set("n", "<leader>gi", "<cmd>GoImport<cr>", { desc = "Go Import" })
