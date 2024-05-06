local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local transform_mod = require('telescope.actions.mt').transform_mod

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
-- find among sibling files
vim.keymap.set('n', '<leader>.', function() builtin.find_files({ cwd = vim.fn.expand('%:p:h') }) end)

vim.keymap.set('n', '<leader>c', builtin.git_bcommits, {})

--transform_mod({
  --open_all_from_qflist = function(prompt_bufnr)
    --vim.cmd [[silent cfdo e %]]
  --end
--})

require('telescope').setup({
   defaults = {
      mappings = {
         i = {
            -- ctrl+q "smart" send to qflist
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
            --['œ'] = actions.smart_send_to_qflist + actions.open_all_from_qflist,
         },
         n = {
            -- ctrl+q "smart" send to qflist
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
            --['œ'] = actions.smart_send_to_qflist + actions.open_all_from_qflist,
         },
      },
   },
})
