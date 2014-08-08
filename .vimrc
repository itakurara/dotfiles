syntax enable
set number
set ruler
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:< 
set incsearch
set hlsearch
set nowrap
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

set nocompatible
"---------------------------
" Start Neobundle Settings.
"---------------------------
"bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

"--Required:
call neobundle#begin(expand('~/.vim/bundle/'))
"neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
"今後このあたりに追加のプラグインをどんどん書いて行きます！！

NeoBundle 'mattn/emmet-vim'
call neobundle#end()

filetype plugin indent on
NeoBundleCheck
"-------------------------
" End Neobundle Settings.
"-------------------------
