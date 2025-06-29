local status, avante = pcall(require, "avante")
if (not status) then return end

avante.setup({
  provider = "openai",
  endpoint = "https://api.openai.com/v1",
  model = "gpt-4o-mini",
})
