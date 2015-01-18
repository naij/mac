set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'https://github.com/scrooloose/nerdtree.git'

Plugin 'Yggdroot/indentLine'

Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" 开启语法高亮
syntax enable
set background=light
let g:solarized_termcolors=256
colorscheme solarized
" 设置工作目录为当前编辑文件的目录
" set bsdir=buffer
" set autochdir
" 编码设置
set encoding=utf-8
" 不要备份文件，使用backup备份文件（原文件加～后缀）
set nobackup
" 不生成.swap文件
set noswapfile
" 搜索结果高亮【hls】
set hlsearch
" 搜索逐字符高亮 
set incsearch
" 智能匹配，即小写全匹配，大小写混合则严格匹配【scs】
set smartcase
" mouse=a 启动所有模式，会屏蔽鼠标的右键功能；
" mouse=v 让Vim在可视化模式下也可以使用右键粘贴
set mouse=v
" 显示行号【nu】
set number
" 显示光标所在列号【ru】
set ruler
" 高亮当前行【cul】
set cursorline
" 显示匹配的括号【sm】
set showmatch
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 高亮当前列【cuc】
" set cursorcolumn
" 显示当前的模式，FreeBSD下默认不显示【sc】
set showcmd
" 启用自动缩进，和上一行的缩进保持一致【ai】
set autoindent
set smartindent
" 使用C语言的缩进风格【cin】
set cindent
" 探测文件类型
filetype on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 设置F6为切换Paste模式的快捷键，便于从其他窗口向Vim中粘贴代码，GUI下的Vim可能无效【pt】
set pastetoggle=<F6>
" 缩进和（软）制表符使用空格代替【et】
set expandtab
" 设置制表符为4 个空格【ts】
set tabstop=4
" 设置软制表符为4 个空格【sts】
set softtabstop=4
" 设置缩进为4 个空格【sw】
set shiftwidth=4
" 设置折叠
" 设置竖线显示
" let g:indentLine_char = '┆'

filetype plugin on
filetype indent on

" 按F2打开关闭NERDTree
nmap <F2> :NERDTreeToggle<cr>

"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 使用alt加数字键切换tab
function! TabPos_ActivateBuffer(num)
    let s:count = a:num 
	exe "tabfirst"
	exe "tabnext" s:count  
endfunction

function! TabPos_Initialize()
    for i in range(1, 9) 
        exe "map <M-" . i . "> :call TabPos_ActivateBuffer(" . i . ")<CR>"
    endfor
    exe "map <M-0> :call TabPos_ActivateBuffer(10)<CR>"
endfunction

autocmd VimEnter * call TabPos_Initialize()
