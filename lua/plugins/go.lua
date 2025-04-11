return {
    {
      "ray-x/go.nvim",
      dependencies = {
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
      },
      config = function()
        require("go").setup()
      end,
      ft = { "go", "gomod" },
      build = ':lua require("go.install").update_all_sync()',
    },
    
    -- Ensure Treesitter has Go parser
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        if type(opts.ensure_installed) == "table" then
          vim.list_extend(opts.ensure_installed, { "go", "gomod", "gowork", "gosum" })
        end
      end,
    },
    
    -- Make sure lspconfig configures gopls
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          gopls = {
            settings = {
              gopls = {
                analyses = {
                  unusedparams = true,
                  shadow = true,
                },
                staticcheck = true,
                gofumpt = true,
              },
            },
          },
        },
      },
    },
    
    -- Add Go to null-ls if you want additional formatters/linters
    {
      "nvimtools/none-ls.nvim",
      optional = true,
      opts = function(_, opts)
        if type(opts.sources) == "table" then
          local nls = require("null-ls")
          vim.list_extend(opts.sources, {
            nls.builtins.code_actions.gomodifytags,
            nls.builtins.code_actions.impl,
            nls.builtins.formatting.gofumpt,
            nls.builtins.formatting.goimports_reviser,
          })
        end
      end,
    },
  }