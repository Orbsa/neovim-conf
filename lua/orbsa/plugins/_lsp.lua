local lspconfig = require'lspconfig'
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        loadOutDirsFromCheck = true,
        features = "all"
      },
      files = {
        excludeDirs = {
          ".direnv",
          ".git",
          ".github",
          ".gitlab",
          "bin",
          "web/node_modules",
          "node_modules",
          "target",
          "venv",
          ".venv",
        },
      }
    },
  },
}

local lspdefaults = lspconfig.util.default_config
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require('copilot_cmp').setup()
require'lspconfig'.html.setup{}
require'lspconfig'.cssls.setup{}
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Add completion capabilities to default LSP capabilities.
lspdefaults.capabilities = vim.tbl_deep_extend("force", lspdefaults.capabilities, capabilities)

-- RZLS
require'rzls'.setup {
  capabilities = capabilities
} 
-- Roslyn
require'roslyn'.setup {
  args = {
    '--stdio',
    '--logLevel=Information',
    '--extensionLogDirectory=' .. vim.fs.dirname(vim.lsp.get_log_path()),
    '--razorSourceGenerator=' .. vim.fs.joinpath(
      vim.fn.stdpath 'data' --[[@as string]],
      'mason',
      'packages',
      'roslyn',
      'libexec',
      'Microsoft.CodeAnalysis.Razor.Compiler.dll'
    ),
    '--razorDesignTimePath=' .. vim.fs.joinpath(
      vim.fn.stdpath 'data' --[[@as string]],
      'mason',
      'packages',
      'rzls',
      'libexec',
      'Targets',
      'Microsoft.NET.Sdk.Razor.DesignTime.targets'
    ),
  },
  config = {
    on_attach = function(client)
    end,
    capabilities = capabilities,
    handlers = require 'rzls.roslyn_handlers',
  },
}
