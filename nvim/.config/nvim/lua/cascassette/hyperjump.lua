local hyperjump = function()
  local jumplist = vim.fn.getjumplist()[1]
  local curbuf = jumplist[1].bufnr
  local jumpno = 1
  for i, v in ipairs(jumplist) do
    if v.bufnr ~= curbuf then
      jumpno = i
      break
    end
  end
  vim.cmd('execute "normal! ' .. jumpno .. '\\<C-o>"')
end

vim.keymap.set('n', '<C-O>', hyperjump, { desc = "Hyperjump back" })
