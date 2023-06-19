vim.g.tmux_navigator_no_mappings = 1

vim.keymap.set('n', '<C-h>', ':<C-U>TmuxNavigateLeft<CR>', { silent = false })
vim.keymap.set('n', '<C-n>', ':<C-U>TmuxNavigateRight<CR>', { silent = false })
vim.keymap.set('n', '<C-t>', ':<C-U>TmuxNavigateDown<CR>', { silent = false })
vim.keymap.set('n', '<C-c>', ':<C-U>TmuxNavigateUp<CR>', { silent = false })

vim.g.tmux_navigator_save_on_switch = 1
vim.g.tmux_navigator_disable_when_zoomed = 1
