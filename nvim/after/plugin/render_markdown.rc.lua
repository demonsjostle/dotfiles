local status, render_markdown = pcall(require, "render-markdown")
if (not status) then return end

render_markdown.setup({
  completions = { lsp = { enabled = true } },
})
