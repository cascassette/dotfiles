local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

vim.keymap.set('n', '<leader>f', builtin.find_files)
vim.keymap.set('n', '<leader>g', builtin.git_files)
vim.keymap.set('n', '<leader>/', function() builtin.live_grep({ additional_args = { "-." } }) end)    -- `-.` arg to rg means include hidden files
vim.keymap.set('n', '<leader>b', builtin.buffers)
vim.keymap.set('n', '<leader>h', function() builtin.jumplist({ cwd_only = true }) end)
vim.keymap.set('n', '<leader>H', builtin.jumplist)
vim.keymap.set('n', '<leader>m', function() builtin.marks({ cwd_only = true }) end)
vim.keymap.set('n', '<leader>r', function() builtin.oldfiles({ only_cwd = true }) end)    -- think r for "recent"
vim.keymap.set('n', '<leader>R', builtin.oldfiles)                                        -- think r for "recent"
-- non-live grep, think s for search
vim.keymap.set('n', '<leader>s', function()
	builtin.grep_string({ search = vim.fn.input('Grep > '), additional_args = { "-." } })
end)
-- search for word under cursor
vim.keymap.set('n', '°', builtin.grep_string)
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- find among sibling files
vim.keymap.set('n', '<leader>.', function() builtin.find_files({ cwd = vim.fn.expand('%:p:h') }) end)

vim.keymap.set('n', '<leader>c', builtin.git_bcommits, {})

local function single_or_multi_select(prompt_bufnr)
  local current_picker = action_state.get_current_picker(prompt_bufnr)
  local has_multi_selection = (next(current_picker:get_multi_selection()) ~= nil)

  if has_multi_selection then
    actions.close(prompt_bufnr)
    local multi = current_picker:get_multi_selection()
    for _, entry in pairs(multi) do
      local filename = entry.filename or entry.value
      local lnum = entry.lnum or 1
      local lcol = entry.col or 1
      if filename then
        vim.cmd(string.format('edit +%d %s', lnum, filename))
        vim.cmd(string.format('normal! %dG%d|', lnum, lcol))
      end
    end
  else
    -- if not multi selection, open single file
    actions.select_default(prompt_bufnr)
  end
end

require('telescope').setup({
   defaults = {
      mappings = {
         i = {
            -- ctrl+q "smart" send to qflist
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
            ['<C-k>'] = actions.cycle_history_prev,
            ['<C-j>'] = actions.cycle_history_next,
            ['<CR>'] = single_or_multi_select,
         },
         n = {
            -- ctrl+q "smart" send to qflist
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
            ['<C-k>'] = actions.cycle_history_prev,
            ['<C-j>'] = actions.cycle_history_next,
            ['<CR>'] = single_or_multi_select,
         },
      },
   },
   extensions = {
      fzf = {},
   },
})

require('telescope').load_extension('fzf')
