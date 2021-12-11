"#VIM FOR Mr.LI#"
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

color peachpuff

syntax on
set rnu
set cursorline
"set cursorcolumn
set wrap      "不会出框
set showcmd
set wildmenu  "智能联想
set smartcase "有大写字母时准确搜索
set ts =3
set expandtab
set shiftwidth=4

"行号
set relativenumber
set number
highlight CursorLineNr guifg=#F778A1

set hlsearch  "用/搜索后高亮标记
set incsearch  "边输边高亮
set ignorecase "忽略大小
set autoindent "自动缩进
set smartindent "C程序自动缩进
"cursor
"set guicursor=i:hor5-iCursor-blinkon0,v:ver10-vCursor
"map <C-A> ggVGY

inoremap QQ <ESC>
inoremap '  ''<left>
inoremap "  ""<left>
inoremap [  []<left>
inoremap {  {}<left>
inoremap (  ()<left>


noremap H I
noremap h i
noremap i k
noremap j h
noremap k j

noremap J 4h
noremap L 4l
noremap K 5jzz
noremap I 5kzz
noremap + nzz
noremap _ Nzz
noremap ! :nohl<CR>
noremap e :set paste<CR>
noremap E :set nopaste<CR>
noremap < I//
noremap { {zz
noremap } }zz

"noremap C S
"noremap S C



map Q :wq!<CR>
map <C-s> :w<CR>










" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly et to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
"syntax on


" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gcmt/wildfire.vim'
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
Plug 'tpope/vim-surround'


call plug#end()

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on


" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

