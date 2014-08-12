syntax enable
set number
set ruler
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:< 
set incsearch
set hlsearch
set showmatch
set whichwrap=h,l
set nowrapscan
set ignorecase
set smartcase
set hidden
set history=2000
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
colorscheme monokai
set cursorline
set nocompatible
inoremap { {}<Left>
"---------------------------
" NeoBundle 
"---------------------------
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/syntastic'

let g:syntastic_mode_map = {
  \ "mode" : "active",
  \ "active_filetypes" : ["xml", "html", "scss", "css", "javascript", "json"],
  \}
let g:syntastic_javascript_checker = ['jshint']
let g:syntastic_json_checker = ['jsonlint']
call neobundle#end()

filetype plugin indent on
NeoBundleCheck
"---------------------------
" emmet 
"---------------------------
let g:use_emmet_complete_tag = 1
let g:user_emmet_leader_key = '<C-e>'
let g:user_emmet_settings = {
      \   'lang' : 'ja'
      \ }"
