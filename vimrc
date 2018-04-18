set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'
" 语法自动补全插件
Plugin 'Valloric/YouCompleteMe'
" python 语法错误及风格排错
Plugin 'PyCQA/pylint'
" 文件树
Plugin 'scrooloose/nerdtree'
"配色方案
" Plugin 'jnurmine/Zenburn'
" Plugin 'nanotech/jellybeans.vim'
" Plugin 'altercation/solarized'
Plugin 'morhetz/gruvbox'
" 语法排错
Plugin 'vim-syntastic/syntastic'
"PEP8
Plugin 'PyCQA/pycodestyle'
" 注释
Plugin 'tpope/vim-commentary'
" GDB
Plugin 'vim-scripts/Conque-GDB'
" 在普通模式下运行常用的EX命令
Plugin 'tpope/vim-unimpaired'
" 智能路径管理
"Plugin 'tpope/vim-rails'
" 状态栏美化
Plugin 'vim-airline/vim-airline'
" 对应状态栏美化的主题
Plugin 'vim-airline/vim-airline-themes'
" vim 自动路径管理
Plugin 'tpope/vim-bundler'
" 前端插件 emmet
Plugin 'mattn/emmet-vim'
" HTMl5 语法检测
Plugin 'othree/html5.vim'
" 高亮 html,xml 标签
Plugin 'Valloric/MatchTagAlways'
" HTML 语法高亮
" Plugin 'ZSaberLv0/ZFVimTxtHighlight'
" 异步检错
" Plugin 'neomake/neomake'
"lint neomake
" Plugin 'dojoteef/neomake-autolint'
" 自动缩进
Plugin 'vim-scripts/indentpython.vim'
" 折叠插件
Plugin 'tmhedberg/SimpylFold'
" PEP8
Plugin 'nvie/vim-flake8'
"ctrl p 搜索
Plugin 'kien/ctrlp.vim'
" BadWhitespace
Plugin 'bitc/vim-bad-whitespace'
" gtags  默认不支持py
"Plugin 'vim-scripts/gtags.vim'
" 缩进助手
"Plugin 'kana/vim-textobj-entire'
" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
Plugin 'tpope/vim-fugitive'
" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
"Plugin 'L9'
" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
"Plugin 'git://git.wincent.com/command-t.git'
" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
"Plugin 'file:///home/gmarik/path/to/plugin'
" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
"Plugin 'ascenator/L9', {'name': 'newL9'}

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后
"
" 自动补全配置
set completeopt=longest,menu
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"映射按键,没有这个会导致其他插件的tab不能用
let g:ycm_key_list_select_completion=['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<c-p>', '<Up>']
let g:ycm_confirm_extra_conf=0                      "关闭加载.ycm_extra_conf.py提示
let g:ycm_collect_identifiers_from_tags_files = 1	" 开启 YCM基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	        " 从第2个键入字符就开始罗列匹配项
let g:ycm_use_ultisnips_completer = 1               " Default 1, just ensure
let g:ycm_cache_omnifunc=0	                        " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	        " 语法关键字补全
let g:ycm_complete_in_comments = 1                  " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                   " 在字符串输入中也能补全
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0  " 注释和字符串中的文字也会被收入补全
let g:ycm_server_python_interpreter = '/usr/bin/python3.6'      " YCM 的python解释器位置
" 补全python的关键字
" 修改高亮的背景色, 适应主题
" highlight SyntasticErrorSign guifg=white guibg=black
" to see error location list

" NERDTree 的快捷键映射
nmap <F2> :NERDTreeToggle<cr>

" vim 自身的配置
let python_highlight_all=1
syntax on
set hidden
if has("autocmd")
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
endif
" py 缩进4 HTML 缩进 2
autocmd FileType html setlocal ts=2 sw=2 sts=2
autocmd FileType python setlocal ts=4 sw=4 sts=4

"PEP8 indentation 适合gvim
" au BufNewFile,BufRead *.py
" \ set tabstop=4
" \ set softtabstop=4
" \ set shiftwidth=4
" \ set textwidth=79
" \ set expandtab
" \ set autoindent
" \ set fileformat=unix

" js html css 缩进 适合gvim
" au BufNewFile,BufRead *.js, *.html, *.css
"     \ set tabstop=2
"     \ set softtabstop=2
"     \ set shiftwidth=2
"We also want to avoid extraneous whitespace. We can have VIM flag that for us so that it’s easy to spot - and then remove.
" hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"设置折叠
set foldenable " 开始折叠
set foldmethod=indent "设置为缩进折叠
set foldcolumn=0 " 设置折叠区域的宽度
setlocal foldlevel=99 " 设置折叠层数为
" set foldclose=all " 设置为自动关闭折叠
nnoremap <space> za
" 用空格键来开关折叠"
" f2 进入paste模式
set pastetoggle=<f2>
" 高亮显示当前行/列
set cursorline
" 让配置变更立即生效
autocmd BufWritePost $VIMRC source $VIMRC
" <F3> 运行python程序
map <f3> :w<cr>:!python %<cr>
"vim tab键默认4空格
set ts=4
set expandtab
set autoindent
"显示行号
set nu
" 保留的历史记录上限
set history=200
"支持UTF-8编码
set encoding=utf-8
" 屏蔽左下角的状态显示
set noshowmode
" vim 自动更改目录为当前文件所在目录
set autochdir
"代码变得更漂亮
set t_Co=256
" colors zenburn
" colors jellybeans
colors gruvbox

"80字符红色光标提示
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%80v.\+/
if exists('+colorcolumn')
   set colorcolumn=80
else
   au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
" pylint 语法排错插件配置
" let pylint_version = substitute(pylint_version, '\v^\S+\s+', '', '')
" syntastic 配置
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_checkers = ['python', 'pylint']
let g:syntastic_python_pylint_args=""
" let g:syntastic_debug = 1
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_enable_highlighting=1
let g:syntastic_loc_list_height = 5

" pyenv的vim支持配置
set wildignore+=versions/*,cache/*

"自动括号及引号补全
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
" GDB 设置
"Conque GDB
""待调试文件位于屏幕上方
let g:ConqueGdb_SrcSplit = 'above'
"保存历史
let g:ConqueGdb_SaveHistory = 1
"修改Conque GDB的Leader键
let g:ConqueGdb_Leader = '\'
"总是显示颜色
let g:ConqueTerm_Color = 2
"程序结束运行时，关闭Conque GDB窗口
let g:ConqueTerm_CloseOnEnd = 1
"Conque Term配置错误时显示警告信息
let g:ConqueTerm_StartMessages = 0

" airline 配置
scriptencoding utf-8
let g:airline_extensions = ['tabline']
"airline主题
let g:airline_solarized='dark'
let g:airline_powerline_fonts = 1
set t_Co=256

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':p:t'
let g:airline#extensions#hunks#enabled = 0

let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ycm#enabled = 0
let g:airline#extensions#ctrlp#show_adjacent_modes = 0
let g:airline_highlighting_cache = 1
let g:airline#extensions#tabline#show_tab_type = 0

if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" show absolute file path in status line
let g:airline_section_c = '%<%F%m%#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
" show tab number in tab line
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.crypt = '🔒'


" emmet 配置
" remap the default <C-Y> leader
let g:user_emmet_leader_key='<C-A>'
" let g:user_emmet_mode='n'    "only enable normal mode functions.
" let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.

" Enable just for html/css
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall



" MatchTagAlways 配置
let g:mta_use_matchparen_group = 1
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}
let g:mta_use_matchparen_group = 1
let g:mta_set_default_matchtag_color = 1

" ZFVimTxtHighlight 配置
" autocmd FileType html setl syntax=zftxt


" gruvbox 配置
if has('gui_running')
    set background=light   " Setting dark mode
else
    set background=dark    " Setting light mode
endif
let g:gruvbox_italic = 1
let g:gruvbox_termcolors=256

" neomake 异步查错
" When writing a buffer (no delay).
" call neomake#configure#automake('w')
" " When writing a buffer (no delay), and on normal mode changes (after
" 750ms).
" call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
" call neomake#configure#automake('rw', 1000)
" " Full config: when writing or reading a buffer, and on changes in insert
" and
" normal mode (after 1s; no delay when writing).
" call neomake#configure#automake('nrwi', 500)

" let g:neomake_autolint_enabled=1
" let g:neomake_autolint_events = {
"       \ 'InsertLeave': {'delay': 0},
"       \ 'TextChanged': {},
"      \ }
" Correctly setup PYTHONPATH for pylint. Since Neomake-Autolint uses a
" temporary file the default PYTHONPATH will be in the temporary directory
" rather than the project root.
" function! s:PylintSetup()
  " Store off the original PYTHONPATH since it will be modified prior to
  " doing a lint pass.
  " let s:PythonPath = exists('s:PythonPath') ? s:PythonPath : $PYTHONPATH
  " let l:path = s:PythonPath
  " if match(l:path, getcwd()) >= 0
    " If the current PYTHONPATH already includes the working directory
    " then there is nothing left to do
    " return
  " endif

  " if !empty(l:path)
    " Uses the same path separator that the OS uses, so ':' on Unix and ';'
    " on Windows. Only consider Unix for now.
    " let l:path.=':'
  " endif

  " let $PYTHONPATH=l:path . getcwd()
" endfunction

" autocmd vimrc FileType python
      " \ autocmd vimrc User NeomakeAutolint call s:PylintSetup()


" call neomake#configure#automake({
" \ 'TextChanged': {},
" \ 'InsertLeave': {},
" \ 'BufWritePost': {'delay': 0},
" \ 'BufWinEnter': {},
" \ }, 500)


" let maker = {'name': 'My maker'}
" function! maker.get_list_entries(jobinfo) abort
"   return [
"     \ {'text': 'Some error', 'lnum': 1, 'bufnr': a:jobinfo.bufnr},
"     \ {'text': 'Some warning', 'type': 'W', 'lnum': 2, 'col': 1,
"     \  'length': 5, 'filename': '/path/to/file'},
"     \ ]
" endfunction

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" simple_fold 设置
let g:SimpylFold_docstring_preview=1
