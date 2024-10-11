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
	},
	automatic_installation = true,
})

dap.setup({
	ensure_installed = {
		"codelldb",
		"debugpy",
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
	},
	automatic_installation = true,
})

formatter.setup({
	ensure_installed = {
		"stylua",
		"prettierd",
		"autopep8",
	},
	automatic_installation = true,
})
