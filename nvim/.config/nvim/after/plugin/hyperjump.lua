local Path = require "plenary.path"

local function buf_in_cwd(bufname, cwd)
  if cwd:sub(-1) ~= Path.path.sep then
    cwd = cwd .. Path.path.sep
  end
  local bufname_prefix = bufname:sub(1, #cwd)
  return bufname_prefix == cwd
end

local hyperjump = function()
  local jumplist = vim.fn.getjumplist()[1]
  local curbuf = jumplist[1].bufnr
  local jumpno = 1
  local cwd = vim.loop.cwd()
  for i, row in ipairs(jumplist) do
    if row.bufnr ~= curbuf and buf_in_cwd(vim.api.nvim_buf_get_name(row.bufnr), cwd) then
      jumpno = i
      break
    end
  end
  vim.print(jumplist[jumpno])
  vim.cmd('execute "normal! ' .. jumpno .. '\\<C-o>"')
end

vim.keymap.set('n', '<Leader><C-o>', hyperjump, { desc = "Hyperjump back" })
