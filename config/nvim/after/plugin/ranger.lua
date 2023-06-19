require('ranger-nvim').setup({ replace_netrw = false })

vim.keymap.set('n', '´', function() require('ranger-nvim').open(true) end)

-- from old vim-ranger config
--vim.g.ranger_map_keys = 0
--vim.g.ranger_replace_netrw = 1

--" Use shift+alt+e to find a file using ranger
--vim.keymap.set('n', '´', ':RangerCurrentFile<CR>')
