local lspconfig = require'lspconfig'
lspconfig.ts_ls.setup{
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    typescript = {
      inlayHints = {
        -- You can set this to 'all' or 'literals' to enable more hints
        includeInlayParameterNameHints = "literal", -- 'none' | 'literals' | 'all'
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
}

vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {
  },
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      -- you can also put keymaps in here
    end,
    default_settings = {
      -- rust-analyzer language server configuration
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
            "web",
            "node_modules",
            "target",
            "venv",
            ".venv",
          },
        }
      },
    },
  },
}
-- lspconfig.rust_analyzer.setup {
  -- settings = {
    -- ['rust-analyzer'] = {
    --   cargo = {
    --     loadOutDirsFromCheck = true,
    --     features = "all"
    --   },
    --   files = {
    --     excludeDirs = {
    --       ".direnv",
    --       ".git",
    --       ".github",
    --       ".gitlab",
    --       "bin",
    --       "web/node_modules",
    --       "node_modules",
    --       "target",
    --       "venv",
    --       ".venv",
    --     },
    --   }
    -- },
  -- },
-- }

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
  config = {
    cmd = {
      -- "Microsoft.codeAnalysis.LanguageServer",
      "roslyn-ls",
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
      '--stdio',
    },
    settings = {
      ["csharp|inlay_hints"] = {
          csharp_enable_inlay_hints_for_implicit_object_creation = true,
          csharp_enable_inlay_hints_for_implicit_variable_types = true,
          csharp_enable_inlay_hints_for_lambda_parameter_types = true,
          csharp_enable_inlay_hints_for_types = true,
          dotnet_enable_inlay_hints_for_indexer_parameters = true,
          dotnet_enable_inlay_hints_for_literal_parameters = true,
          dotnet_enable_inlay_hints_for_object_creation_parameters = true,
          dotnet_enable_inlay_hints_for_other_parameters = true,
          dotnet_enable_inlay_hints_for_parameters = true,
          dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
          dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
          dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
      },
      ["csharp|code_lens"] = {
          dotnet_enable_references_code_lens = true,
      },
    },
    on_attach = function(client)
    end,
    capabilities = capabilities,
    handlers = require 'rzls.roslyn_handlers',
  },
}
