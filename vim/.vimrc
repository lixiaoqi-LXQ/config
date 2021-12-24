set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

" colors desert
" colors dracula


let mapleader = "`"
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

syntax on
set rnu
set wrap      "不会出框
set showcmd     " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set autowrite       " Automatically save before commands like :next and :make
set wildmenu  "智能联想
set smartcase "有大写字母时准确搜索
set ts=4
set mouse=a
set expandtab
set shiftwidth=4
set cursorline

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
noremap <C-j> <C-w>hzz
noremap <C-k> <C-w>jzz
noremap <C-i> <C-w>kzz
noremap <C-l> <C-w>lzz
noremap <C-o> <C-o>zz

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
noremap b1 :b1<CR>
noremap b2 :b2<CR>
noremap b3 :b3<CR>
noremap b4 :b4<CR>


map Q :wq!<CR>
map <C-s> :w<CR>

" ===
" === auto update
" ===
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

" ===
" === format
" === zR zM zn zN
Plug 'vim-autoformat/vim-autoformat'
let g:formatterpath = ['/usr/bin/']
noremap <F3> :Autoformat<CR>
" au BufWrite * :Autoformat

" ===
" === fold code
" === zR zM zn zN
Plug 'pseewald/vim-anyfold'
nmap    <Space> za
autocmd Filetype * AnyFoldActivate
autocmd User anyfoldLoaded normal zR

" ===
" === for comment
" ===
" useful: <l>cc <l>cu <l>cs <l>ci <l>cy
Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1

" ===
" === status bar
" ===
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme='behelit'
" let g:airline_theme='base16color'


" ===
" === selecte
" ===
Plug 'gcmt/wildfire.vim'
map <C-p> <Plug>(wildfire-fuel)
nmap <C-q> <Plug>(wildfire-quick-select)

" ===
" === surround
" ===
Plug 'tpope/vim-surround'


" ===
" === not use nerdtree
" ===
Plug 'preservim/nerdtree'

" ===
" === theme
" ===
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'connorholyday/vim-snazzy'
Plug 'ayu-theme/ayu-vim'



" ===
" === coc.nvim
" ===
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-clangd', 'coc-marketplace', ]
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


call plug#end()

filetype plugin indent on
runtime! debian.vim
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif


if has('nvim')
    map <LEADER>c1 :set background=dark<CR>:colorscheme snazzy<CR>:AirlineTheme dracula<CR>
    map <LEADER>c2 :set background=light<CR>:colorscheme ayu<CR>:AirlineTheme ayu_mirage<CR>
    let ayucolor="mirage" " for mirage version of theme
    " colorscheme snazzy
    set termguicolors     " enable true colors support
    colorscheme ayu
    let g:SnazzyTransparent = 1
    " set background=dark
    let g:airline_theme='ayu_mirage'

    let g:lightline = {
                \     'active': {
                    \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
                    \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
                    \     }
                    \ }
else
    colorscheme desert
    let g:airline_theme='base16color'
endif
