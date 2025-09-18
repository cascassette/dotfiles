require('nvim-treesitter').setup({
  ensure_installed = { "c", "cpp", "typescript", "rust", "markdown", "markdown_inline" },
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "tmux" },

    additional_vim_regex_highlighting = false,
  },
  autotag = {
     enable = false,
  },
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 1000

-- not working rn
-- this came from https://stackoverflow.com/questions/77220511/neovim-fold-code-with-foldmethod-syntax-or-foldmethod-expr-depending-on-tre
--[[
vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function()
    if require("nvim-treesitter.parsers").has_parser() then
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    else
      vim.opt.foldmethod = "syntax"
    end
  end,
})
]]
