autocmd!
scriptencoding utf-8
"
" stop loading config if it's on tiny or small
if !1 | finish | endif

" Standard vim settings
set nocompatible
set number
syntax on
syntax enable
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
set backupskip=/tmp/*,/private/tmp/*
set smartcase

" ##########################################
" Plugins, maps
runtime ./plugs.vim
runtime ./maps.vim

" ##########################################
" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " Use NeoSolarized
  let g:neosolarized_termtrans=1
  runtime ./colors/NeoSolarized.vim
  colorscheme NeoSolarized
endif

match Keyword /self/

" ##########################################
" Vim Explorer
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" ##########################################
" Go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

" Go tab spacing (visual only)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

" Go format on save
au BufWritePost *.go !gofmt -w %

" ##########################################
" Vim
nnoremap <leader><space> :nohlsearch<CR>

" Vim highlighting whitespaces
highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.go match BadWhitespace /\s\+$/

