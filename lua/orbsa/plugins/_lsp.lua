-- Neovim 0.11+ built-in LSP configuration
local capabilities = require('blink.cmp').get_lsp_capabilities()

-- Rust 
-- run Fly config on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.rs",
  callback = function()
    vim.cmd.RustLsp { "flyCheck", "run" }
  end,
})

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
        checkOnSave = false, 
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
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- HTML
vim.lsp.config('html', {
  capabilities = capabilities,
})

-- CSS
vim.lsp.config('cssls', {
  capabilities = capabilities,
})

-- Lua (for Neovim config)
vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

-- Nix
vim.lsp.config('nil_ls', {
  capabilities = capabilities,
})

vim.lsp.enable({ 'html', 'cssls', 'lua_ls', 'nil_ls' })

-- RZLS
require'rzls'.setup {
  capabilities = capabilities
} 
-- Roslyn
vim.lsp.config('roslyn', {
  cmd = {
    'roslyn-ls',
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
  capabilities = capabilities,
  handlers = require 'rzls.roslyn_handlers',
})

vim.lsp.enable('roslyn')
