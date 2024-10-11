local status, lint = pcall(require, "lint")
if not status then
	return
end

lint.linters_by_ft = {
	markdown = { "vale" },
	javascript = { "eslint_d" },
	dockerfile = { "hadolint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		-- try_lint without arguments runs the linters defined in `linters_by_ft`
		-- for the current filetype
		lint.try_lint()
	end,
})
