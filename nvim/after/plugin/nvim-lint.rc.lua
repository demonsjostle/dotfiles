local status, lint = pcall(require, "lint")
if not status then
	return
end

lint.linters_by_ft = {
	markdown = { "vale" },
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	json = { "jsonlint" },
	dockerfile = { "hadolint" },
	python = { "pylint" },
	cpp = { "cpplint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		-- Check if LSP has diagnostics for the current buffer
		local has_lsp_diagnostics = not vim.tbl_isempty(vim.diagnostic.get(0))

		-- If no LSP diagnostics are found, run nvim-lint as a fallback
		if not has_lsp_diagnostics then
			lint.try_lint()
		end
	end,
})
