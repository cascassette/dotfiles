require('mini.statusline').setup({})

-- don't display file size
require('mini.statusline').section_fileinfo = function(args)
  return string.format('%s %s[%s]', vim.bo.filetype, vim.bo.fileencoding or vim.bo.encoding, vim.bo.fileformat)
end
