syntax on

filetype indent plugin on

set ruler

" 不能开启，导致 coc 停止工作
" set paste

set encoding=utf8

" 关闭兼容模式
set nocompatible

" 突出显示当前行
set cursorline

" 显示括号匹配
set showmatch

set showcmd

" 搜索高亮
set hlsearch

set completeopt=menu,preview,longest

set backspace=2

set number

set modeline

set background=dark

set mouse=a

set smartindent

set tabstop=4

" 设置自动缩进长度为4空格
set shiftwidth=4

" 继承前一行的缩进方式，适用于多行注释
set autoindent

set expandtab

set softtabstop=4

" 开启实时搜索
set incsearch

" 搜索时大小写不敏感
set ignorecase

" 退出插入模式指定类型的文件自动保存
au InsertLeave *.go,*.sh,*.php,*.py write

" 使用 jk 替换 ESC
inoremap jk <ESC>

" 使用 f4 格式化文件
noremap <F4> :Autoformat<CR>
let g:autoformat_verbosemode=1

" 设置 laststatus = 0 ，不显式状态行
" 设置 laststatus = 1 ，仅当窗口多于一个时，显示状态行
" 设置 laststatus = 2 ，总是显式状态行
set laststatus=2

" 状态栏设置
" set statusline=%F%r%h%w%=\ [ft=%Y]\ %{\"[fenc=\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}\ [pos=%04l,%04v\ %p%%]\ [len=%L]


" 使用 f10 + f12 进行跳转
" nmap <F12> <C-]>
nmap <F10> <C-O>

" 执行 cmd
nnoremap <Leader><Space> :!<Space>

" 分屏
noremap <Leader>t :belowright ter ++rows=15<CR>

highlight GitGutterAdd    ctermfg=blue
highlight GitGutterChange ctermfg=green
highlight GitGutterDelete ctermfg=red


"----------------------------airline-----------------------------------

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline#extensions#tabline#buffer_nr_show = 1        "显示buffer编号
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#battery#enabled = 1
let g:airline_theme='onedark'       " 需要安装joshdick/onedark.vim主题插件

let g:airline_powerline_fonts = 1  " 支持 powerline 字体

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
let g:airline#extensions#tabline#buffer_idx_format = {
        \ '0': '0 ',
        \ '1': '1 ',
        \ '2': '2 ',
        \ '3': '3 ',
        \ '4': '4 ',
        \ '5': '5 ',
        \ '6': '6 ',
        \ '7': '7 ',
        \ '8': '8 ',
        \ '9': '9 '
        \}
"----------------------------------------------------------------------


"------------------------------NERDTree-------------------------------"

map <F6> :NERDTreeMirror<CR>
map <F6> :NERDTreeToggle<CR>
" 显示隐藏文件
let NERDTreeShowHidden=1

"------------------------------NERDTree-------------------------------"

"------------------------------vim-go-------------------------------"

" let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
" let g:go_autodetect_gopath = 1
" let g:go_list_type = "quickfix"
" let g:go_version_warning = 1
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_generate_tags = 1
" let g:godef_split=2
" let g:go_diagnostics_enabled = 0
" let g:go_gopls_options = ['-remote=auto']

" Go语法高亮
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

" 在:w时自动进行GoImports
function! GoReformat()
	call go#fmt#Format(1)
endfunction
autocmd BufWriteCmd *.go call GoReformat()

"------------------------------vim-go-------------------------------"

"------------------------------tagbar-------------------------------"

nmap <F9> :TagbarToggle<CR>

let g:tagbar_ctags_bin='ctags'          "ctags程序的路径
let g:tagbar_width=30                   "窗口宽度的设置
let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }

"------------------------------tagbar-------------------------------"

"------------------------------nerd-tree-git-------------------------------"

let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Ignored"   : "☒",
            \ "Unknown"   : "?"
            \ }

"------------------------------nerd-tree-git-------------------------------"

"----------------------------- easymotion ---------------------------------

" 使用 ss 启用
nmap ss <Plug>(easymotion-s2)

"--------------------------------------------------------------------------

"------------------------------ vim.rainbow -------------------------------

let g:rainbow_active = 1

"--------------------------------------------------------------------------

"-------------------------------- fzf -------------------------------------

nmap <C-p> :Files<CR>
nnoremap <C-l> :Rg<CR>'

"--------------------------------------------------------------------------

"------------------------------- coc.nvim ---------------------------------

" colors ron
hi Pmenu ctermfg=7 ctermbg=236
hi PmenuSel ctermfg=white ctermbg=32
hi CocFloating ctermfg=black ctermbg=240

let g:coc_global_extensions = ['coc-snippets', 'coc-json', 'coc-pyright']

inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

" https://github.com/neoclide/coc.nvim/issues/262
" inoremap <silent><expr> <CR> pumvisible() ? "\<C-y><CR>" : "\<CR>"

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return ! col || getline('.')[col - 1] =~? '\s'
endfunction

augroup user_plugin_coc
    autocmd!
    autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

" use <c-space>for trigger completion
inoremap <silent><expr> <C-space> coc#refresh()

" Movement within 'ins-completion-menu'
imap <expr><C-j>   pumvisible() ? "\<Down>" : "\<C-j>"
imap <expr><C-k>   pumvisible() ? "\<Up>" : "\<C-k>"

" Scroll pages in menu
inoremap <expr><C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>" : "\<Left>"
imap     <expr><C-d> pumvisible() ? "\<PageDown>" : "\<C-d>"
imap     <expr><C-u> pumvisible() ? "\<PageUp>" : "\<C-u>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
nmap <F12> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <Leader>rn <Plug>(coc-rename)
nmap <Leader>rf <Plug>(coc-refactor)

nmap gs <Plug>(coc-git-chunkinfo)
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show commit contains current position
nmap gC <Plug>(coc-git-commit)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        let l:found = CocAction('doHover')
    endif
endfunction

"------------------------------------------------------------------------

autocmd FileType go nnoremap <buffer> g<F12> :call GodefUnderCursor()<cr>
let g:godef_split=3 """左右打开新窗口的时候
let g:godef_same_file_in_same_window=1 """函数在同一个文件中时不需要打开新窗口

call plug#begin('~/.vim/plugged')

"Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'junegunn/vim-easy-align'

" 目录树
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" 可以使 nerdtree 的 tab 更加友好些
Plug 'jistr/vim-nerdtree-tabs'

" 目录树展示 git 状态
Plug 'Xuyuanp/nerdtree-git-plugin'

" git 相关操作
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'jiangmiao/auto-pairs'

Plug 'Chiel92/vim-autoformat'

" 模糊查找
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'rkulla/pydiction'

" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"
" vim-go的极简版，去除了gopls，以及所有coc拥有的功能
Plug 'fioncat/vim-minigo'


" Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" Plug 'Blackrush/vim-gocode'

Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

Plug 'majutsushi/tagbar'

" git 相关
Plug 'tpope/vim-fugitive'

Plug 'frazrepo/vim-rainbow'

" 快速移动
Plug 'easymotion/vim-easymotion'

call plug#end()

