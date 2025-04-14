local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local function fs_stat(path)
  -- Use vim.uv.fs_stat if available (Neovim 0.10+), fall back to alternatives
  if vim.uv and vim.uv.fs_stat then
    return vim.uv.fs_stat(path)
  elseif vim.loop and vim.loop.fs_stat then
    return vim.loop.fs_stat(path)
  else
    return vim.fn.isdirectory(path) == 1
  end
end

if not fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup LazyVim and plugins
require("lazy").setup({
  -- Import LazyVim
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },
  
  -- Gruvbox theme
  { "ellisonleao/gruvbox.nvim" },
  
  -- Go development
  { "fatih/vim-go" },
  { "ray-x/go.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" } },
  
  -- Debugging
  { "mfussenegger/nvim-dap" },
  
  -- File explorer with icons
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false,
        },
      })
    end,
  },
  
  -- Tree-sitter for syntax highlighting and code analysis
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "go", "lua", "vim", "vimdoc", "javascript", "typescript", "python" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
        },
      })
    end,
  },
})

-- Configure Go.nvim
require("go").setup()
