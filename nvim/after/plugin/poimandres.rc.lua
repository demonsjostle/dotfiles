local status, poimandres = pcall(require, "poimandres")
if (not status) then return end




poimandres.setup {


}


-- enable scheme
vim.cmd('colorscheme poimandres')
