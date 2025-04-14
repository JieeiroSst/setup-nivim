local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
    {
      "fatih/vim-go",  -- Essential Go tools (run :GoInstallBinaries after install)
      ft = "go",
      config = function()
        vim.g.go_fmt_command = "goimports" -- Auto-format + fix imports
      end,
    },
    {
      "neovim/nvim-lspconfig",  -- LSP setup (already in LazyVim)
      opts = {
        servers = {
          gopls = {},  -- Go LSP (install via Mason)
        },
      },
    },
    {
      "mfussenegger/nvim-dap",  -- Debugging (DAP)
      dependencies = {
        "leoluz/nvim-dap-go",  -- Go debugger
        config = function()
          require("dap-go").setup()
        end,
      },
    },
    {
      "ray-x/go.nvim",  -- Advanced Go features (optional)
      dependencies = { "ray-x/guihua.lua" },
      config = function()
        require("go").setup()
      end,
      event = { "CmdlineEnter" },
      ft = { "go", "gomod" },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = { "go", "gomod" },
      },
    },
    {
    "nvim-tree/nvim-web-devicons",
    lazy = true,  -- Load only when needed
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },
  -- File explorer with icons (Nvim-Tree)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-web-devicons" },
    opts = {
      view = {
        width = 30,
      },
      renderer = {
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "▶",
              arrow_open = "▼",
            },
          },
        },
      },
    },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
    },
  },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
