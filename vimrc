" Options
set ignorecase
set smartcase
set startofline
set ts=2 sts=2 sw=2 et
set shiftround
set showcmd
set guifont=Fira\ Code:h16
if has('gui_running')
  set macligatures
end
set nu rnu
set nowrap
set splitright
set incsearch
set nrformats=
set wildmenu
set cursorline "cursorcolumn
syntax enable
filetype plugin indent on
set autowrite
" make /g default behaviour in :s command
set gdefault
set mouse=a
map <LeftMouse> <nop>
imap <LeftMouse> <nop>
" TODO: figure out how to work with dots, dash, etc
"set iskeyword="@,48-57,_,192-255"
set lazyredraw
set hidden
set scrolloff=2

" directory = swap files, backupdir = backups saved
set directory=~/tmp/vimscrap/swap//
set backupdir=~/tmp/vimscrap/backup//
set undodir=~/tmp/vimscrap/undo//

" keep undo history per file
set undofile

let mapleader = ","

" swap j/k keys with +/-
nnoremap j +
nnoremap k -
nnoremap + j
nnoremap - k

" center after */n
"nnoremap n nzz
"nnoremap N Nzz
"nnoremap * *zz
"nnoremap <F9> #zz
" (<F9> = A + * => #)

nnoremap <silent> <Up> <C-y>
nnoremap <silent> <Down> <C-e>
nnoremap <silent> <Right> 10zl
nnoremap <silent> <Left> 10zh

nnoremap <Tab> <C-w>w

nnoremap H :bprev<CR>^
nnoremap L :bnext<CR>^
nnoremap T :e#<CR>^
"nnoremap K :A<CR>
nnoremap Y y$
nnoremap <silent> Q :Bd<CR>^
nnoremap <Space> :w<CR>
"nnoremap <CR> o

nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>. :cd %:p:h<CR>

" Airline
let g:airline_section_z = '%3p%% %3l:%2v'
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#trailing_regexp = '\S\s\+$'  " only show 'trailing space' error for space after other characters
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'mileszs/ack.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'leafgarland/typescript-vim'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'moll/vim-bbye'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'neoclide/vim-jsx-improve'
Plug 'peitalin/vim-jsx-typescript'
Plug 'prettier/vim-prettier'
Plug 'styled-components/vim-styled-components'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'
Plug 'tommcdo/vim-exchange'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()

set background=dark
"let g:nord_italic = 1
"let g:nord_italic_comments = 1
"let g:nord_uniform_diff_background = 1
"let g:nord_cursor_line_number_background = 1
colors nord

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set clipboard=unnamed

set listchars=tab:»-,trail:·,eol:¬,nbsp:_

" set comments to be italic
"hi Comment cterm=italic

" Rainbow parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Highlight git merge conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Use ack.vim for search
let g:ackprg = 'rg --vimgrep --smart-case'
let g:ack_use_cword_for_empty_search = 1

" Project-wide search for word under cursor
" Use alt-* for project wide search for current word
nnoremap ° :Ack! <C-R><C-W><CR>
" Use alt-* for project wide search for current selection
vnoremap ° "zy:Ack! <C-R>z<CR>
" Use * in visual mode to search for the selection
vnoremap * "zy/<C-r>z<CR>
" Use shift-alt-a/u for :cnext and :cprev
nnoremap Å :cp<CR>
nnoremap ¨ :cn<CR>
" search through the project
nnoremap <Leader>/ :Ack<Space>
" toggle search highlight with ,-
nnoremap <Leader>- :set hlsearch!<CR>
" a-* for backwards search
nnoremap <F9> #

" fzf keyboard shortcuts to open in split
let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

set rtp+=/usr/local/opt/fzf

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~50%' }

" fzf preview for Files cmd
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" fzf preview for GFiles cmd
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)
" Jump to the existing window if possible (Buffers cmd)
let g:fzf_buffers_jump = 1

" fzf
" fuzzy through files in working directory
nnoremap <Leader>f :Files<Enter>
" fuzzy through files in current git repo
nnoremap <Leader>g :GFiles<Enter>
" list, and fzf through, commits that changed the current file (with ctrl+d to view diff)
nnoremap <Leader>c :BCommits<Enter>
" fuzzy through open buffers
nnoremap <Leader>b :Buffers<Enter>
" fuzzy through bookmarks
nnoremap <Leader>m :Marks<Enter>
" Add a Jumps command
"function! GetJumps()
  "redir => cout silent jumps redir END
  "return split(cout, "\n")[1:]
"endfunction
"function! UseJump(line)
"endfunction
"command! Jumps call fzf#run(fzf#wrap({ \ 'source': GetJumps(), \ 'sink': function('UseJump')}))

" Disable ranger.vim default bindings
let g:ranger_map_keys = 0
" Use ranger when opening a directory
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1
" Use shift+alt+e to find a file using ranger
nnoremap ´ :RangerCurrentFile<CR>
" Use ctrl+n to find current file in tree with nerdtree
nnoremap <C-n> :NERDTreeFind<CR>

au Filetype html,javascript set suffixesadd+=.js,.css,.html,.ts,.tsx
au Filetype html set ts=4 sts=4 sw=4 et

" configure indentwise
let g:indentwise_equal_indent_skips_contiguous = 1
let g:indentwise_skip_blanks = 1
let g:indentwise_blanks_have_null_indentation = 0
let g:indentwise_treat_whitespace_as_blank = 0
let g:indentwise_suppress_keymaps = 1
let g:indentwise_preserve_col_pos = 0
map { <Plug>(IndentWisePreviousEqualIndent)
map } <Plug>(IndentWiseNextEqualIndent)
map ( <Plug>(IndentWisePreviousLesserIndent)
map ) <Plug>(IndentWiseNextLesserIndent)

" fix airline buflist with any :bd command other than just closing the current
" buffer (closing a numbered buffer, closing many)
"autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()
"autocmd BufDelete * call airline#extensions#tabline#buffers#invalidate()

" all folds open on new files
"autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax javascript normal zR

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

let g:startify_change_to_dir = 0

" skip quickfix with :bnext and :bprev
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END
