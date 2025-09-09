--vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

--vim.api.nvim_add_user_command('Browse', '!open <q-args>', { nargs = 1 })
-- Not sure why I need this??
--vim.cmd('command! -nargs=1 Browse silent exe \'!open \' . "<args>"')

vim.keymap.set('n', '<leader>z', ':Git difftool<CR>')
