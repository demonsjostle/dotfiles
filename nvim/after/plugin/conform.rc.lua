local status, conform = pcall(require, "conform")
if not status then
  return
end

conform.setup({
  formatters_by_ft = {
    javascript = { "prettierd" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
