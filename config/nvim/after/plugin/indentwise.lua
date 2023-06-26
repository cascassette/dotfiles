vim.g.indentwise_equal_indent_skips_contiguous = 1
vim.g.indentwise_skip_blanks = 1
vim.g.indentwise_blanks_have_null_indentation = 0
vim.g.indentwise_treat_whitespace_as_blank = 0
vim.g.indentwise_suppress_keymaps = 1
vim.g.indentwise_preserve_col_pos = 0
vim.api.nvim_set_keymap('', '{', '<Plug>(IndentWisePreviousEqualIndent)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '}', '<Plug>(IndentWiseNextEqualIndent)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '(', '<Plug>(IndentWisePreviousLesserIndent)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', ')', '<Plug>(IndentWiseNextLesserIndent)', { noremap = true, silent = true })
