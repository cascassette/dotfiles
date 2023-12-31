local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

vim.keymap.set('n', '<leader>f', builtin.find_files)
vim.keymap.set('n', '<leader>g', builtin.git_files)
vim.keymap.set('n', '<leader>/', builtin.live_grep)
vim.keymap.set('n', '<leader>b', builtin.buffers)
vim.keymap.set('n', '<leader>m', builtin.jumplist)
vim.keymap.set('n', '<leader>w', builtin.marks)
vim.keymap.set('n', '<leader>r', function() builtin.oldfiles({ only_cwd = true }) end)    -- think r for "recent"
vim.keymap.set('n', '<leader>R', builtin.oldfiles)                                        -- think r for "recent"
-- non-live grep, think s for search
vim.keymap.set('n', '<leader>s', function()
	builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)
-- search for word under cursor
vim.keymap.set('n', '°', builtin.grep_string)
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>c', builtin.git_bcommits, {})

require('telescope').setup({
   defaults = {
      mappings = {
         i = {
            -- ctrl+q sends all
            ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
            -- alt+q sends selected
            ['œ'] = actions.send_selected_to_qflist + actions.open_qflist,
            -- ctrl+j/k goes forward and back in history
            ['<C-k>'] = actions.cycle_history_prev,
            ['<C-j>'] = actions.cycle_history_next,
         },
         n = {
            -- ctrl+q sends all
            ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
            -- alt+q sends selected
            ['œ'] = actions.send_selected_to_qflist + actions.open_qflist,
            -- ctrl+j/k goes forward and back in history
            ['<C-k>'] = actions.cycle_history_prev,
            ['<C-j>'] = actions.cycle_history_next,
         },
      },
   },
})
