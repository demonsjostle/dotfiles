local status, ts_at = pcall(require, 'nvim-ts-autotag')
if (not status) then return end

ts_at.setup({})
