require('gitsigns').setup({
  current_line_blame = true,
  current_line_blame_opts = {
    ignore_whitespace = true,
  },
})

vim.keymap.set('n', '<leader><BS>', ':Gitsigns reset_hunk<CR>')
