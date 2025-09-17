local statusline = require('mini.statusline')

statusline.setup({})

-- display simple location (line, col)
statusline.section_location = function(_)
  return '%l│%2v'
end

-- don't display file size
statusline.section_fileinfo = function(_)
  return string.format('%s %s[%s]', vim.bo.filetype, vim.bo.fileencoding or vim.bo.encoding, vim.bo.fileformat)
end


statusline.section_mode = function(_)
  local CTRL_S = vim.api.nvim_replace_termcodes('<C-S>', true, true, true)
  local CTRL_V = vim.api.nvim_replace_termcodes('<C-V>', true, true, true)
  local modes = {
    ['n']    = { long = 'Normal',   short = 'N',   hl = 'MiniStatuslineModeNormal' },
    ['v']    = { long = 'Visual',   short = 'V',   hl = 'MiniStatuslineModeVisual' },
    ['V']    = { long = 'V-Line',   short = 'V-L', hl = 'MiniStatuslineModeVisual' },
    [CTRL_V] = { long = 'V-Block',  short = 'V-B', hl = 'MiniStatuslineModeVisual' },
    ['s']    = { long = 'Select',   short = 'S',   hl = 'MiniStatuslineModeVisual' },
    ['S']    = { long = 'S-Line',   short = 'S-L', hl = 'MiniStatuslineModeVisual' },
    [CTRL_S] = { long = 'S-Block',  short = 'S-B', hl = 'MiniStatuslineModeVisual' },
    ['i']    = { long = 'Insert',   short = 'I',   hl = 'MiniStatuslineModeInsert' },
    ['R']    = { long = 'Replace',  short = 'R',   hl = 'MiniStatuslineModeReplace' },
    ['c']    = { long = 'Command',  short = 'C',   hl = 'MiniStatuslineModeCommand' },
    ['r']    = { long = 'Prompt',   short = 'P',   hl = 'MiniStatuslineModeOther' },
    ['!']    = { long = 'Shell',    short = 'Sh',  hl = 'MiniStatuslineModeOther' },
    ['t']    = { long = 'Terminal', short = 'T',   hl = 'MiniStatuslineModeOther' },
  }

  local mode_info = modes[vim.fn.mode()]

  return mode_info.short, mode_info.hl
end
