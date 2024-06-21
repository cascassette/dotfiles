--vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

--vim.api.nvim_add_user_command('Browse', '!open <q-args>', { nargs = 1 })
vim.cmd('command! -nargs=1 Browse silent exe \'!open \' . "<args>"')
