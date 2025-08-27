require('dart').setup({
  marklist = { 'h', 't', 'n', 's' },
  buflist = { 'g', 'c', 'r', 'l' },
  tabline = {
    always_show = true,
    icons = true,
    order = function(config)
      local order = {}
      for i, key in ipairs(vim.list_extend(vim.deepcopy(config.marklist), config.buflist)) do
        order[key] = i
      end
      return order
    end,
  },
  picker = {
    --path_format = ':p:.',
    path_format = ':t',
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
