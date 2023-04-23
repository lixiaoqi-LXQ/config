set nocompatible
set fileencodings=utf-8,ucs-bom,utf-16,gbk,big5,gb18030,latin1
" colors desert
" colors dracula

let mapleader = "`"
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

syntax on
" make any txt file highlighted
" autocmd BufRead,BufNewFile *.txt set ft=help

set backup
set patchmode=.bk
set undofile
set dir=~/tmp/vim_cache/swap
set backupdir=~/tmp/vim_cache/backup
set undodir=~/tmp/vim_cache/undos
:let savevers_dirs = &backupdir

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



noremap <TAB> zz
noremap <CR> Sif __name__ == '__main__':<CR>

inoremap QQ <ESC>
noremap w W
noremap H I
noremap h i
noremap i k
noremap j h
noremap k j
" noremap J 4h
" noremap L 4l
noremap J B
noremap L W
noremap K 5jzz
noremap I 5kzz
noremap { {zz
noremap } }zz
noremap - I<BACKSPACE><ESC>
noremap _ I<TAB><ESC>
noremap = <C-a>
noremap <C-o> <C-o>zz

" Window cmd
noremap <C-w>I <C-w>K
noremap <C-w>K <C-w>J
noremap <C-w>J <C-w>H
noremap <C-w>L <C-w>L
" moving cursor to orther window
noremap <C-k> <C-w><Down>zz
noremap <C-j> <C-w><Left>zz
noremap <C-l> <C-w><Right>zz
" This does not work: noremap <C-i> <C-w><Up>zz
" window resizing
noremap <C-w>, <C-w><
noremap <C-w>. <C-w>>
" moving around tab page
if has('nvim')
    map <C-Right> <C-PageDown>
    map <C-Left> <C-PageUP>
endif
" noremap <C-Shift-Tab> <C-w>gt



noremap n nzz
noremap N Nzz
noremap ! :nohl<CR>
noremap b1 :b1<CR>
noremap b2 :b2<CR>
noremap b3 :b3<CR>
noremap b4 :b4<CR>
noremap b5 :b5<CR>
noremap b6 :b6<CR>
noremap b7 :b7<CR>
noremap b8 :b8<CR>
noremap b9 :b9<CR>

map <F12> :wqall<CR>
map <C-a> ggVG
map <C-s> :w<CR>
map <C-c> "+y
noremap e :set paste<CR>
noremap E :set nopaste<CR>

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
" === ranger
" ===
Plug 'Lokaltog/neoranger'
" for setting ranger viewmode values
let g:neoranger_viewmode='miller' " supported values are ['multipane', 'miller']
" for setting any extra option passed to ranger params
let g:neoranger_opts='--cmd="set show_hidden true"' " this line makes ranger show hidden files by default
" Open ranger in current working directory
nnoremap <F11> :Ranger<CR>

" ===
" === backup
" ===
Plug 'vim-scripts/savevers.vim'

" ===
" === python
" ===
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']

" ===
" === indentLine
" ===
Plug 'Yggdroot/indentLine'
" let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2


" ===
" === format
" ===
Plug 'vim-autoformat/vim-autoformat'
let g:formatterpath = ['/usr/bin/']
noremap <F3> :Autoformat<CR>
let g:python3_host_prog="/usr/bin/python"
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
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='behelit'
" let g:airline_theme='base16color'


" ===
" === select
" ===
Plug 'gcmt/wildfire.vim'
map <C-p> <Plug>(wildfire-fuel)
nmap <C-q> <Plug>(wildfire-quick-select)

" ===
" === surround
" ===
Plug 'tpope/vim-surround'

" ===
" === markdown format table
" ===
Plug 'dhruvasagar/vim-table-mode'
function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
    let mapping_pattern = '\V' . escape(a:mapping, '\')
    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
    return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
            \ <SID>isAtStartOfLine('\|\|') ?
            \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
            \ <SID>isAtStartOfLine('__') ?
            \ '<c-o>:silent! TableModeDisable<cr>' : '__'


" ===
" === start animation
" ===
Plug 'mhinz/vim-startify'

" ===
" === drawit
" ===
Plug 'vim-scripts/DrawIt'

" ===
" === not use nerdtree
" ===
Plug 'preservim/nerdtree'

" ===
" === go 
" ===
Plug 'josa42/coc-go'

" ===
" === theme
" ===
Plug 'NLKNguyen/papercolor-theme'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'connorholyday/vim-snazzy'
Plug 'ayu-theme/ayu-vim'
let g:dracula_bold = 1
let g:dracula_italic = 1
let g:dracula_underline = 1
let g:dracula_undercurl = 1
let g:dracula_colorterm = 1
let g:dracula_inverse = 1

autocmd ColorScheme dracula hi CursorLine cterm=underline term=underline

" ===
" === CursorHold
" ===
Plug 'antoinemadec/FixCursorHold.nvim'
let g:cursorhold_updatetime = 100

" ===
" === coc.nvim
" ===
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-json', 'coc-pyright', 'coc-clangd', 'coc-vimlsp', 'coc-webview', 'coc-marketplace', 'coc-pairs', 'coc-highlight', 'coc-yaml', 'coc-go']
nmap <leader>rn <Plug>(coc-rename)

" use <CR> to confirm completion and select the first completion item
" and confirm the completion when no item has been selected and format
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
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
" Use gs to switch between source and header
noremap <silent> gs :CocCommand clangd.switchSourceHeader<CR>
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
autocmd ColorScheme * highlight CocHighlightText ctermbg=LightGray ctermfg=Black guibg=#3F3F3F guifg=#FFB4F5
" autocmd ColorScheme * highlight CocHighlightText guibg=#6A82B8

" auto fix
nmap <leader>qf  <Plug>(coc-fix-current)


call plug#end()

filetype plugin indent on
runtime! debian.vim
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif


" ===
" === table of python
" ===
function! TitleInsert()
    call setline(1,"#!/usr/bin/python")
endfunction
map <F2> :call TitleInsert()<CR>


if has('nvim')
    map <F8> :set background=light<CR>:colorscheme PaperColor<CR>:AirlineTheme ayu_light<CR>
    map <F9> :set background=dark<CR>:colorscheme snazzy<CR>:AirlineTheme dracula<CR>
    map <F10> :set background=light<CR>:colorscheme ayu<CR>:AirlineTheme ayu_mirage<CR>
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
