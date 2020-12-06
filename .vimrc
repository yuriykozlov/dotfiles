language en_US
set encoding=utf-8
" Russian symbols support for switching between modes
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } "Project and file navigation
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } "Golang support
Plug 'blueshirts/darcula'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'frazrepo/vim-rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

call plug#end()

" Enable mouse
set mouse=a

" Disable bells sound
set belloff=all

" Enable nocompatible mode with vi
set nocompatible

" Enable 256 colors
set t_Co=256

" Enalbe syntax highlight
syntax on

" Enable colorscheme
colorscheme darcula
set background=dark

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree " Open NERDTree when Vim starts 
let NERDTreeShowHidden=1 " Show hidden files

" Rows
set number "set rows numbers

" Tabulation and intends
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab "make tabs consisting of spaces
set smartindent

" Search
set hlsearch "highlight search results
set incsearch "enable incremental search

" Enable rainbow brackets (1 = enable, 0 = disable)
let g:rainbow_active = 0

filetype plugin indent on

set autowrite

" Golang syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Golang auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Browser for GoDocBrowser 
let g:go_play_browser_command = 'lynx'

" Golang status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex\: `\b` for building, `\r` for running and `\t` for running test.

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" Backspace enable anywhere
set backspace=indent,eol,start

" Press Esc Esc to undo hlsearch
nnoremap <silent> <esc><esc> :nohlsearch<CR>
