local status, mason = pcall(require, "mason")
if not status then
  return
end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
  return
end
local status3, dap = pcall(require, "mason-nvim-dap")
if not status3 then
  return
end
local status4, lint = pcall(require, "mason-nvim-lint")
if not status4 then
  return
end
local status5, formatter = pcall(require, "mason-conform")
if not status5 then
  return
end

mason.setup({})

lspconfig.setup({
  ensure_installed = {
    "cssls",
    "lua_ls",
    "pyright",
    "ts_ls",
    "clangd",
    "jsonls",
    "tailwindcss",
    "gopls",
    "graphql",
  },
  automatic_installation = true,
})

dap.setup({
  ensure_installed = {
    "codelldb",
    "debugpy",
    "delve",
  },
  automatic_installation = true,
  handlers = {
    function(config)
      require("mason-nvim-dap").default_setup(config)
    end,
  },
})

lint.setup({
  ensure_installed = {
    "vale",
    "eslint_d",
    "hadolint",
    "pylint",
    "cpplint",
    "jsonlint",
    "golangcilint",
  },
  automatic_installation = true,
  quiet_mode = false,
  ignore_install = {}
})

formatter.setup({
  ensure_installed = {
    "prettierd",
  },
  automatic_installation = true,
})
