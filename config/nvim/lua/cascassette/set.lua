vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.startofline = true

vim.opt.showcmd = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true
vim.opt.shiftround = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.splitright = true

vim.opt.cursorline = true
vim.opt.cursorcolumn = false

-- make /g default behaviour in :s command
vim.opt.gdefault = true

vim.opt.scrolloff = 2

vim.opt.termguicolors = true

vim.opt.signcolumn = 'yes'

vim.opt.directory='/Users/casper.ravenhorst/tmp/nvimscrap/swap//'
vim.opt.backupdir='/Users/casper.ravenhorst/tmp/nvimscrap/backup//'
vim.opt.undodir='/Users/casper.ravenhorst/tmp/nvimscrap/undo//'
-- keep undo history per file
vim.opt.undofile = true

vim.opt.clipboard = 'unnamed'

vim.opt.listchars = 'tab:»-,trail:·,eol:¬,nbsp:_'

-- Highlight git merge conflict markers
--match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

--" Project-wide search for word under cursor
--" Use alt-* for project wide search for current word
--nnoremap ° :Ack! <C-R><C-W><CR>
--" Use alt-* for project wide search for current selection
--vnoremap ° "zy:Ack! <C-R>z<CR>
--" Use * in visual mode to search for the selection
--vnoremap * "zy/<C-r>z<CR>
--" Use shift-alt-a/u for :cnext and :cprev
--nnoremap Å :cp<CR>
--nnoremap ¨ :cn<CR>
--" search through the project
--nnoremap <Leader>/ :Ack<Space>
--" toggle search highlight with ,-
--nnoremap <Leader>- :set hlsearch!<CR>
--" a-* for backwards search
--nnoremap <F9> #

vim.opt.updatetime = 50
