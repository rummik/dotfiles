" Dark background
set background=dark

" Don't want complete Vi compatibility
set nocompatible

" More powerful backspace
set backspace=indent,eol,start

" Mouse
set mouse=a

" Spelling
set spelllang=en_us

" Title
set title

" SpaceHi options
let g:spacehi_tabcolor='gui=underline guifg=darkmagenta ctermfg=darkmagenta cterm=underline'
let g:spacehi_spacecolor='gui=underline guifg=red ctermfg=red cterm=underline'

" Set where to keep backups and swap files
set nobackup
"set backup
"set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Syntax
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Pathogen
execute pathogen#infect()

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'briancollins/vim-jst'
Bundle 'wavded/vim-stylus'

" Indenting
filetype plugin indent on

set autoindent
set smartindent
set nocindent

" Use .vimrc_local.vim instead of _vimrc_local.vim
let g:local_vimrc = '.vimrc_local.vim'

" Line numbers
set number

" PHP
let php_sql_query          = 1
let PHP_removeCRwhenUnix   = 1
let PHP_default_indenting  = 1
let php_show_semicolon     = 0

" Javascript
let javaScript_alternateSwitch = 1

" HTML Syntax Conversion Options
let html_use_css	= 1
let html_no_hyperlinks	= 1
let use_xhtml		= 1
let html_ignore_folding	= 1
if exists('html_no_pre')
	unlet html_no_pre
endif

" Folding
set foldmethod=indent
set foldcolumn=1
set foldlevel=1
set foldtext=MyFoldText()

function! MyFoldText()
	let n = v:foldend - v:foldstart + 1
	let i = indent(v:foldstart)
	let istr = ''
	while i > 0
		let istr = istr . ' '
		let i = i - 1
	endwhile
	return istr . "+-" . v:folddashes . " " . n . " lines "
endfunction
