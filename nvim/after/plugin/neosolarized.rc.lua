local status, n = pcall(require, "NeoSolarized")
if (not status) then return end

n.setup({
  style = "light",
  comment_italics = true,
  transparent = true,
})
