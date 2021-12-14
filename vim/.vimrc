set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

color peachpuff

let mapleader = "\\"
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

syntax on
set rnu
set cursorline
set wrap      "不会出框
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set autowrite		" Automatically save before commands like :next and :make
set wildmenu  "智能联想
set smartcase "有大写字母时准确搜索
set ts=4
set expandtab
set shiftwidth=4
   
"行号
set relativenumber
set number
highlight CursorLineNr guifg=#F778A1

set hlsearch  "用/搜索后高亮标记
set incsearch  "边输边高亮
set ignorecase "忽略大小写
set autoindent "自动缩进
set smartindent "C程序自动缩进
"cursor
"set guicursor=i:hor5-iCursor-blinkon0,v:ver10-vCursor
"map <C-A> ggVGY

inoremap QQ <ESC>
noremap H I
noremap h i
noremap i k
noremap j h
noremap k j
noremap <C-j> <C-w>h
noremap <C-k> <C-w>j
noremap <C-i> <C-w>k
noremap <C-l> <C-w>l

noremap J 4h
noremap L 4l
noremap K 5jzz
noremap I 5kzz
noremap n nzz
noremap N Nzz
noremap ! :nohl<CR>
noremap e :set paste<CR>
noremap E :set nopaste<CR>
noremap < I//
noremap { {zz
noremap } }zz

map Q :wq!<CR>
map <C-s> :w<CR>


" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

nmap <leader>rn <Plug>(coc-rename)

" use <CR> to confirm completion and select the first completion 
" item and confirm the completion when no item has been selected
" and format
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" use <tab> for trigger completion and navigate to the next complete item
" and navigate the completion list:
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> ( <Plug>(coc-diagnostic-prev)zz
nmap <silent> ) <Plug>(coc-diagnostic-next)zz

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-o> coc#refresh()
else
  inoremap <silent><expr> <c-o> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

Plug 'gcmt/wildfire.vim'
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
call plug#end()

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on

" This line should not be removed as it ensures that various options are
" properly et to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

