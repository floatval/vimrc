"======================================================================
"插件
"======================================================================
call plug#begin('~/.vim/plugged')
" 语法自动补全插件
Plug 'Valloric/YouCompleteMe'
" python 语法错误及风格排错
Plug 'PyCQA/pylint'
" 文件树
Plug 'scrooloose/nerdtree'
"配色方案
" Plug 'jnurmine/Zenburn'
" Plug 'nanotech/jellybeans.vim'
" Plug 'altercation/solarized'
Plug 'morhetz/gruvbox'
" 语法排错
"Plug 'vim-syntastic/syntastic'
"PEP8
Plug 'PyCQA/pycodestyle'
" 注释
Plug 'tpope/vim-commentary'
" GDB
" Plug 'vim-scripts/Conque-GDB'
" 在普通模式下运行常用的EX命令
Plug 'tpope/vim-unimpaired'
" 智能路径管理
"Plug 'tpope/vim-rails'
" 状态栏美化
Plug 'vim-airline/vim-airline'
" 对应状态栏美化的主题
Plug 'vim-airline/vim-airline-themes'
" vim 自动路径管理
Plug 'tpope/vim-bundler'
" 前端插件 emmet
Plug 'mattn/emmet-vim'
" HTMl5 语法检测
Plug 'othree/html5.vim'
" 高亮 html,xml 标签
Plug 'Valloric/MatchTagAlways'
" 异步检错
" 自动缩进
Plug 'vim-scripts/indentpython.vim'
" 彩虹括号
Plug 'luochen1990/rainbow'
" 折叠插件
Plug 'tmhedberg/SimpylFold'
" 缩进线
Plug 'Yggdroot/indentLine'
" PEP8
Plug 'nvie/vim-flake8'
"ctrl p 搜索
Plug 'kien/ctrlp.vim'
" BadWhitespace
Plug 'bitc/vim-bad-whitespace'
" gtags  默认不支持py
"Plug 'vim-scripts/gtags.vim'
" 缩进助手
"Plug 'kana/vim-textobj-entire'
Plug 'tpope/vim-fugitive'
" 打字机声音
" Plug 'skywind3000/vim-keysound'
" REPL
Plug 'sillybun/vim-repl/'
" asyncrun
Plug 'skywind3000/asyncrun.vim'
" python 变量类型自动标识
" Plug 'sillybun/vim-autodoc'

" HTML
" 括号智能补全
Plug 'jiangmiao/auto-pairs'
" HTML 标签自动闭合
Plug 'docunext/closetag.vim'

" MarkDown
" Mark 实时预览
Plug 'iamcco/markdown-preview.vim'
" MarkDown tagbar
Plug 'majutsushi/tagbar'
Plug 'lvht/tagbar-markdown'

" 语法
" debug
" Plug 'vim-vdebug/vdebug'
" PythonModle
" Plug 'python-mode/python-mode', { 'branch': 'develop'  }
"ale异步查错
Plug 'w0rp/ale'

" go 语言
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'majutsushi/tagbar'
Plug 'universal-ctags/ctags'
Plug 'SirVer/ultisnips'
" Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
call plug#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"
" 将你自己对非插件片段放在这行之后
"==============================================================================


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"                           vim 功能延拓
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
"==============================================================================
" vim 自身的配置
"==============================================================================
set relativenumber  " 开启相对行号,需7.4以上版本
let python_highlight_all=1
set nocompatible              " 去除VI一致性,必须
filetype plugin on

" set omnifunc=syntaxcomplete#Complete
set autowrite
" 解决vim8 的语法渲染问题
set re=1

" pyenv的vim支持配置
set wildignore+=versions/*,cache/*

" simple_fold 设置
let g:SimpylFold_docstring_preview=1

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

syntax on
set hidden
if has("autocmd")
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
endif
" py 缩进4 HTML 缩进 2
autocmd FileType html setlocal ts=2 sw=2 sts=2
autocmd FileType python setlocal ts=4 sw=4 sts=4

" Show by default 4 spaces for a tab
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

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
" IndentLine
 let g:indentLine_setColors = 0
" Vim
" let g:indentLine_color_term = 239

" GVim
" let g:indentLine_color_gui = '#A4E57E'

" none X terminal
" let g:indentLine_color_tty_light = 7 " (default: 4)
" let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
" let g:indentLine_bgcolor_term = 'grey'
" let g:indentLine_bgcolor_gui = '#FF5F00'
" 设置折叠
set foldenable " 开始折叠
set foldmethod=indent "设置为缩进折叠
set foldcolumn=0 " 设置折叠区域的宽度
setlocal foldlevel=99 " 设置折叠层数为
" set foldclose=all " 设置为自动关闭折叠
nnoremap <space> za
" 用空格键来开关折叠"

" f2 进入paste模式
" set pastetoggle=<f2>

" 高亮显示当前行/列
set cursorline

" 让配置变更立即生效
autocmd BufWritePost $VIMRC source $VIMRC

" <C-l> 运行python程序
nnoremap <C-l> :call CompileRunGcc()<cr>

func! CompileRunGcc()
          exec "w"
          if &filetype == 'python'
                  if search("@profile")
                          exec "AsyncRun kernprof -l -v %"
                          exec "copen"
                          exec "wincmd p"
                  elseif search("set_trace()")
                          exec "!python3 %"
                  else
                          exec "AsyncRun -raw python3 %"
                          exec "copen"
                          exec "wincmd p"
                  endif
          endif

endfunc
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

" 配色方案选择
set termguicolors   " 开启24位真色（同32位真色)
" set t_Co=256   # 因7.4以后支持24位真色，且终端支持真色故不用该选项
" colors zenburn
" colors jellybeans
colors gruvbox

"80字符光标提示
if exists('+colorcolumn')
   set colorcolumn=80
else
   au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" NERDTree 的快捷键映射
nmap <C-i> :NERDTreeToggle<cr>

" 彩虹括号配置
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
"==============================================================================
" 自动补全函数头
"==============================================================================
" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
         call setline(1, "\#! /usr/bin/env python3")
         call setline(2, "\# encoding: utf-8")
        " call setline(1, "\# -*- coding: utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc
"==============================================================================
"
"==============================================================================
"打字机音效
"==============================================================================
" let g:keysound_enable = 1
" let g:keysound_theme = 'typewirte'
" let g:keysound_py_version = 3
"==============================================================================


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"                           语法检错及补全
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
"==============================================================================
" YCM自动补全配置
"==============================================================================
set completeopt=longest,menu
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"映射按键,没有这个会导致其他插件的tab不能用
let g:ycm_key_list_select_completion=['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<c-p>', '<Up>']
let g:ycm_confirm_extra_conf = 0                    "关闭加载.ycm_extra_conf.py提示
let g:ycm_collect_identifiers_from_tags_files = 1	" 开启 YCM基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	        " 从第2个键入字符就开始罗列匹配项
let g:ycm_use_ultisnips_completer = 1               " Default 1, just ensure
" let g:ycm_cache_omnifunc=0	                        " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	        " 语法关键字补全
let g:ycm_complete_in_comments = 1                  " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                   " 在字符串输入中也能补全
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0  " 注释和字符串中的文字也会被收入补全
let g:ycm_server_python_interpreter = '/usr/bin/python3.6'      " YCM 的python解释器位置
let g:ycm_key_invoke_completion = '<C-k>'
let g:ycm_gocode_binary_path = '/home/ft-arch/goLearn/bin/gocode'
let g:ycm_godef_binary_path = '/home/ft-arch/goLearn/bin/godef'
" 开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files = 1
"设置关健字触发补全
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.', ' ', '(', '[', '&'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \   'python' : ['.'],
  \ }
" let g:ycm_cache_omnifunc = 1
" let g:ycm_semantic_triggers =  {
" 			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
" 			\ 'cs,lua,javascript': ['re!\w{2}'],
" 			\ }

let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
            \ "go":1,
            \ "python":1,
            \ "py":1,
			\ }
" 补全python的关键字
" 修改高亮的背景色, 适应主题
"==============================================================================
"
"==============================================================================
" neomake 异步查错
"==============================================================================
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


" call neomake#configure#automake({
" \ 'TextChanged': {},
" \ 'InsertLeave': {},
" \ 'BufWritePost': {'delay': 0},
" \ 'BufWinEnter': {},
" \ }, 500)
" function! MyOnBattery()
"   return readfile('/sys/class/power_supply/AC/online') == ['0']
" endfunction
" if MyOnBattery()
"   call neomake#configure#automake('w')
" else
"   call neomake#configure#automake('nrw', 1000)
" endif
" let g:neomake_python_enabled_makers = ['pylint']
" augroup my_custom_maker
"     au!
"     au Filetype custom.py let b:neomake_python_enabled_makers = ['flake8']
" augroup END
" let g:neomake_error_sign = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
" let g:neomake_warning_sign = {
"     \   'text': '⚠',
"     \   'texthl': 'NeomakeWarningSign',
"     \ }
" let g:neomake_message_sign = {
"     \   'text': '➤',
"     \   'texthl': 'NeomakeMessageSign',
"     \ }
" let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
" let g:neomake_autolint_enabled=1
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
"==============================================================================
"
"
"==============================================================================
"ALE config
"==============================================================================

let g:ale_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_completion_enabled = 0
let g:airline#extensions#ale#enabled = 1
let b:ale_lint_on_insert_leave = 1
let g:ale_set_ballons = 1
let g:ale_lint_delay = 200  " millisecs
let g:ale_lint_on_text_changed = 'always'  " never/insert/normal/always
let g:ale_lint_on_enter = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 1

" let g:ale_linters = {
" \   'javascript.jsx': ['eslint', 'flow'],
" \   'python': ['pylint'],
" \   'go': ['golint', 'govet', 'errcheck'],
" \}
let g:ale_fixers = {
\   'javascript.jsx': ['eslint', 'prettier'],
\   'python': ['autopep8'],
\}

" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_python_pylint_use_global = 1
let g:ale_list_window_size = 0
" 自定义图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"==============================================================================
"==============================================================================




"==============================================================================
" pylint 语法排错插件配置
"==============================================================================
" let pylint_version = substitute(pylint_version, '\v^\S+\s+', '', '')
" syntastic 配置
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_aggregate_errors = 1
" let g:syntastic_python_checkers = ['python', 'pylint']
" let g:syntastic_python_pylint_args=""
" " let g:syntastic_debug = 1
" let g:syntastic_error_symbol='>>'
" let g:syntastic_warning_symbol='>'
" let g:syntastic_enable_highlighting=1
" let g:syntastic_loc_list_height = 5
"
"
"==============================================================================
" GDB 设置
"==============================================================================
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
"==============================================================================
"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"                               主题及美化
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
"==============================================================================
" airline 配置
"==============================================================================
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
"==============================================================================
"
"==============================================================================
" gruvbox 配置
"==============================================================================
if has('gui_running')
    set background=light   " Setting dark mode
else
    set background=dark    " Setting light mode
endif
let g:gruvbox_italic = 1
let g:gruvbox_termcolors=256
"==============================================================================
"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"                       代码效率提升
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
"==============================================================================
" emmet 配置
"==============================================================================
" remap the default <C-Y> leader
let g:user_emmet_leader_key='<C-A>'
" let g:user_emmet_mode='n'    "only enable normal mode functions.
" let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.

" Enable just for html/css
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
"==============================================================================
"
"==============================================================================
" MatchTagAlways 配置
"==============================================================================
let g:mta_use_matchparen_group = 1
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}
let g:mta_use_matchparen_group = 1
let g:mta_set_default_matchtag_color = 1
"==============================================================================
"
" ZFVimTxtHighlight 配置
" autocmd FileType html setl syntax=zftxt
"==============================================================================
"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" python modle
" let g:pymode_python = 'python3'
"==============================================================================
"
"==============================================================================
" vim-go 配置
"==============================================================================
" 高亮方法及函数
let g:go_highlight_function_calls = 1
" 编译 go 程序快捷键
autocmd FileType go nmap <leader>b  <Plug>(go-build)
" 运行 go 程序快捷键
autocmd FileType go nmap <leader>r  <Plug>(go-run)
" 测试 go 程序快捷键
autocmd FileType go nmap <leader>t  <Plug>(go-test)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

" 开启未导入包的补全
let g:go_gocode_unimported_packages = 1
"==============================================================================
"
"==============================================================================
" Tags 配置
"==============================================================================
nmap <F8> :TagbarToggle<CR>
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

"==============================================================================
"REPL 配置
"==============================================================================
let g:sendtorepl_invoke_key = "<leader>w"    "传送代码快捷键，默认为<leader>w
let g:repl_position = 3                      "0表示出现在下方，1表示出现在上方，2在左边，3在右边
