syntax on

filetype indent plugin on
 
set ruler

set showcmd
 
set completeopt=menu,preview,longest

set number

set modeline

set background=dark

set mouse=a

set statusline

" 设置空格""
set smartindent  
set tabstop=4  
set shiftwidth=4  
set expandtab  
set softtabstop=4

noremap <F4> :Autoformat<CR>
let g:autoformat_verbosemode=1

" 设置状态行显示常用信息
" %F 完整文件路径名
" %m 当前缓冲被修改标记
" %m 当前缓冲只读标记
" %h 帮助缓冲标记
" %w 预览缓冲标记
" %Y 文件类型
" %b ASCII值
" %B 十六进制值
" %l 行数
" %v 列数
" %p 当前行数占总行数的的百分比
" %L 总行数
" %{...} 评估表达式的值，并用值代替
" %{"[fenc=".(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?"+":"")."]"} 显示文件编码
" %{&ff} 显示文件类型
set statusline=%F%r%h%w%=\ [ft=%Y]\ %{\"[fenc=\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}\ [pos=%04l,%04v\ %p%%]\ [len=%L]

" 设置 laststatus = 0 ，不显式状态行
" 设置 laststatus = 1 ，仅当窗口多于一个时，显示状态行
" 设置 laststatus = 2 ，总是显式状态行
set laststatus=2

"------------------------------NERDTree-------------------------------"

map <F6> :NERDTreeMirror<CR>
map <F6> :NERDTreeToggle<CR>

"------------------------------NERDTree-------------------------------"

"------------------------------pydiction------------------------------"

filetype plugin on
let g:pydiction_location = '/home/nercoeus/.vim/plugged/pydiction/complete-dict'
let g:pydiction_menu_height = 20

"---------------------------------------------------------------------"

"------------------------------YCM-------------------------------"

let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'


"------------------------------YCM-------------------------------"
"
"
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}

"------------------------------UltiSnips-------------------------------"
"插入模式下直接通过<C-z>键来触发UltiSnips的代码块补全

let g:UltiSnipsExpandTrigger="<C-z>"
"弹出UltiSnips的可用列表,由于不常用, 所以这里设置成了特殊的<C-i>映射
let g:UltiSnipsListSnippets="<C-i>"
"<C-f>跳转的到下一个代码块可编辑区
let g:UltiSnipsJumpForwardTrigger="<C-f>"

"------------------------------UltiSnips-------------------------------"

"nmap <Leader>tb :TagbarToggle<CR>      "快捷键设置
let g:tagbar_ctags_bin='ctags'          "ctags程序的路径
let g:tagbar_width=30                   "窗口宽度的设置
map <F3> :Tagbar<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()  "如果是c语言的程序的话，tagbar自动开启


" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'Yggdroot/LeaderF'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'jiangmiao/auto-pairs'

Plug 'majutsushi/tagbar'
Plug 'Chiel92/vim-autoformat'
Plug 'rkulla/pydiction'
" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()
