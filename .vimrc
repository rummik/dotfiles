set nocompatible

" Pretty up the UI
set number

"" Syntax highlighting options
set background=dark
syntax on

""" Highlight tabs and extra spaces (Options for SpaceHi)
let g:spacehi_tabcolor='gui=underline guifg=darkmagenta ctermfg=darkmagenta cterm=underline'
let g:spacehi_spacecolor='gui=underline guifg=red ctermfg=red cterm=underline'

""" Column markers
hi ColorColumn ctermbg=darkgrey guibg=darkgrey
set colorcolumn=80,100,120

"" Folding
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

"" CLI options
set title
set mouse=a
set spelllang=en_us

"" GUI options
set guioptions-=T " Remove toolbar

if has("gui_running")
	set background=light
	colors tango
endif


" Temp files and backups
set nobackup
"set backup
"set backupdir=~/.vim/backup
set directory=~/.vim/tmp


" Pathogen
execute pathogen#infect()


" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'briancollins/vim-jst'
Bundle 'wavded/vim-stylus'
Bundle 'editorconfig/editorconfig-vim'


" Indent options
filetype plugin indent on

set autoindent
set smartindent
set nocindent

set smarttab


" Make paragraph formatting a bit better (gq)
set formatprg = "par 79"


" Use .vimrc_local.vim instead of _vimrc_local.vim
let g:local_vimrc = '.vimrc_local.vim'


" 2HTML
let html_use_css	= 1
let html_no_hyperlinks	= 1
let use_xhtml		= 1
let html_ignore_folding	= 1
if exists('html_no_pre')
	unlet html_no_pre
endif


" Language specific stuff

"" PHP
let php_sql_query          = 1
let PHP_removeCRwhenUnix   = 1
let PHP_default_indenting  = 1
let php_show_semicolon     = 0

"" Javascript
let javaScript_alternateSwitch = 1

