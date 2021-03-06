set nocompatible
syntax enable
set number
set ruler
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
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
set smarttab
set shiftwidth=2
set softtabstop=2
set mouse=a
set ttymouse=xterm2
set clipboard=unnamed,autoselect
"set binary
"set noeol
set nofixeol
colorscheme monokai
set guifont=rounded-mplus-1mn-regular:h15
set cursorline
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P}
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
imap <c-j> <esc>
augroup vimrc-local
autocmd!
autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
	augroup END

	function! s:vimrc_local(loc)
		let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
		for i in reverse(filter(files, 'filereadable(v:val)'))
			source `=i`
		endfor
	endfunction
"--------------------------
" NeoBundle 
"---------------------------
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundleLazy 'marcus/rsense',{
      \'autoload':{
      \'filetypes':'ruby',
      \ }
      \}
NeoBundle 'Shougo/neocomplcache-rsense.vim', {
      \ 'depends': ['Shougo/neocomplcache.vim', 'marcus/rsense'],
      \ }
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'tyru/caw.vim.git'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'yuratomo/w3m.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'nathanaelkane/vim-indent-guides'

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)

"---------------------------
" syntastic 
"---------------------------
let g:syntastic_check_on_open=0
let g:syntastic_check_on_save=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=6
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': ['javascript'],
      \ 'passive_filetypes': []
      \ }
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
"---------------------------
" emmet 
"---------------------------
let g:use_emmet_complete_tag = 1
let g:user_emmet_leader_key = '<C-e>'
let g:user_emmet_settings = {
      \   'lang' : 'ja'
      \ }"
"---------------------------
" simply javascript indenter
"---------------------------
let g:SimpleJsIndenter_BriefMode = 1

"---------------------------
" neocomplcache 
"---------------------------
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

if has('gui_running')
  set lines=90 columns=200
endif
"---------------------------
" Rsense 
"---------------------------
let g:rsenseUseOmniFunc = 1
let g:rsenseHome = "/Users/yui/.vim/bundle/rsense"

"---------------------------
" vim ref 
"---------------------------
let g:ref_phpmanual_path = $HOME . '/.vim/php-chunked-xhtml'

"---------------------------
" vim-indent-guides
"---------------------------
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
let g:indent_guides_guide_size = 1
