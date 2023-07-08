vim.g.BufKillCreateMappings = 0

vim.g.mapleader = ','

-- swap j/k keys with +/-
vim.keymap.set('n', 'j', '+')
vim.keymap.set('n', 'k', '-')
vim.keymap.set('n', '+', 'j')
vim.keymap.set('n', '-', 'k')

-- scroll with arrow keys
vim.keymap.set('n', '<Up>', '<C-y>')
vim.keymap.set('n', '<Down>', '<C-e>')
vim.keymap.set('n', '<Left>', '10zh')
vim.keymap.set('n', '<Right>', '10zl')

-- cycle windows
vim.keymap.set('n', '<Tab>', '<C-w>w')

-- cycle buffers
vim.keymap.set('n', 'H', vim.cmd.bprev)
vim.keymap.set('n', 'L', vim.cmd.bnext)

vim.keymap.set('n', '<Space>', vim.cmd.write)

--vim.keymap.set('n', '<leader>ev', vim.cmd.edit, '~/.config/nvim/init.lua')
--nnoremap <leader>ev :e $MYVIMRC<CR>
--nnoremap <leader>sv :source $MYVIMRC<CR>
--nnoremap <leader>. :cd %:p:h<CR>

-- disable mouse moving of the cursor
vim.keymap.set('', '<LeftMouse>', '<nop>')
vim.keymap.set('i', '<LeftMouse>', '<nop>')

-- move selected lines around
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- don't lose old yank buffer because pasting over selection
vim.keymap.set('x', 'p', "\"_dP")

-- split with s vertically and - horizontally
vim.keymap.set('n', '<C-w>s', vim.cmd.vsplit)
vim.keymap.set('n', '<C-w>-', vim.cmd.split)

-- turn off hlsearch when pressing esc again in normal mode
vim.keymap.set('n', '<Esc>', function() vim.opt.hlsearch = false end)

-- use shift-alt-a/u for :cnext and :cprev
vim.keymap.set('n', 'Å', vim.cmd.cp)
vim.keymap.set('n', '¨', vim.cmd.cn)

-- use shift-alt-j/k for next and previous diagnostic
vim.keymap.set('n', '', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'Ô', vim.diagnostic.goto_next)

vim.keymap.set('n', '<leader>*', function() vim.opt.hlsearch = true end)

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
