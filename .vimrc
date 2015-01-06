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


" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'editorconfig/editorconfig-vim'
Plugin 'Valloric/YouCompleteMe'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'

Plugin 'briancollins/vim-jst'
Plugin 'claco/jasmine.vim'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'

Plugin 'burnettk/vim-angular'
Plugin 'rummik/vim-ng-snippets'

Plugin 'wavded/vim-stylus'

Plugin 'emgram769/vim-multiuser'

call vundle#end()


" CoVim
let CoVim_default_name = "rummik"
let CoVim_default_port = "54321"  

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"


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

