local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end
local status3, dap = pcall(require, "mason-nvim-dap")
if (not status3) then return end
local status4, null_ls = pcall(require, "mason-null-ls")
if (not status4) then return end



mason.setup {}

lspconfig.setup {
  ensure_installed = {
    "cssls",
    "lua_ls",
    "pyright",
    "ts_ls",
    "clangd",
    "jsonls",
    "tailwindcss"
  },
  automatic_installation = true
}


dap.setup {
  ensure_installed = {
    'codelldb',
    'debugpy'
  },
  automatic_installation = true,
  handlers = {
    function(config)
      require('mason-nvim-dap').default_setup(config)
    end,
  }

}

null_ls.setup {
  ensure_installed = {
    "clang-format",
    "autopep8",
    "prettierd",
    "eslint_d",
    'php-cs-fixer',
    -- "pylint"
  },
  automatic_installation = true
}
