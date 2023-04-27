local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- List of servers to install
local servers = { "html", "cssls", "tsserver", "clangd" }

require("mason-lspconfig").setup {
  ensure_installed = servers,
}

-- This will setup lsp for servers you listed above
-- And servers you install through mason UI
-- So defining servers in the list above is optional
require("mason-lspconfig").setup_handlers {
  -- Default setup for all servers, unless a custom one is defined below
  function(server_name)
    lspconfig[server_name].setup {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        -- Add your other things here
        -- Example being format on save or something
      end,
      capabilities = capabilities,
    }
  end,
  -- custom setup for a server goes after the function above
  -- Example, override lua_ls
  ["lua_ls"] = function()
    lspconfig["lua_ls"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
              [vim.fn.stdpath "data" .. "/lazy/extensions/nvchad_types"] = true,
              [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      },
    }
  end,
  ["jdtls"] = function()
    lspconfig["jdtls"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        java = {
          signatureHelp = { enabled = true },
          contentProvider = { preferred = "fernflower" },
          sources = {
            organizeImports = {
              starThreshold = 9999,
              staticStarThreshold = 9999,
            },
          },
          configuration = {
            runtimes = {
              {
                name = "Java",
                path = "/usr/bin/java",
              },
            },
          },
        },
      },
    }
  end,
  -- ["clangd"] = function()
  --   lspconfig["clangd"].setup {
  --     on_attach = on_attach,
  --     capabilities = capabilities,
  --     cmd = {
  --       "clangd",
  --       "--background-index",
  --       -- "--clang-tidy",
  --       -- "--completion-style=bundled",
  --       -- "--header-insertion=never",
  --       "-std=c++17",
  --     },
  --     -- filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp", "cu", "cuh" },
  --     -- init_options = {
  --     --   clangdFileStatus = true,
  --     --   usePlaceholders = true,
  --     --   completeUnimported = true,
  --     --   semanticHighlighting = true,
  --     -- },
  --   }
  -- end,
  -- Example: disable auto configuring an LSP
  -- ["clangd"] = function() end,
}
