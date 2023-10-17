require('rose-pine').setup({
   variant = 'auto', -- 'auto', 'main', 'moon', 'dawn'
   dark_variant = 'moon' -- choose from same
})
vim.opt.background = 'dark'
vim.cmd.colorscheme('rose-pine')

vim.keymap.set('n', '<C-S-Up>', function() vim.opt.background = 'light' end)
vim.keymap.set('n', '<C-S-Down>', function() vim.opt.background = 'dark' end)
