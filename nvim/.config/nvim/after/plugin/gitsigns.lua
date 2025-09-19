require('gitsigns').setup({
  current_line_blame = true,
  current_line_blame_opts = {
    ignore_whitespace = true,
  },
})

-- use shift-alt-j/k for next and previous hunk (git change)
vim.keymap.set('n', 'Ô', '<cmd>Gitsigns next_hunk<CR>', { desc = "Next hunk" })
vim.keymap.set('n', '', '<cmd>Gitsigns prev_hunk<CR>', { desc = "Previous hunk" })
-- use ,Backspace to reset current hunk (set of changed lines)
vim.keymap.set('n', '<leader><BS>', '<cmd>Gitsigns reset_hunk<CR>')
