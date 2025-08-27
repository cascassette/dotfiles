require('dart').setup({
  marklist = { 'h', 't', 'n', 's' },
  buflist = { 'g', 'c', 'r', 'l' },
  tabline = {
    always_show = true,
    icons = true,
  },
  picker = {
    path_format = ':p:.',
  },
  mappings = {
    mark = "''",
    jump = "'",
    pick = "'p",
    next = '<S-l>',
    prev = '<S-h>',
    unmark_all = '',
  },
})
