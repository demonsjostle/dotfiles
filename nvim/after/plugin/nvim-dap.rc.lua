local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>db', '<Cmd>DapToggleBreakpoint<CR>', opts)
vim.keymap.set('n', '<leader>dr', '<Cmd>DapContinue<CR>', opts)
