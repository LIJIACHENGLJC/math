let mapleader=" "
set encoding=utf-8
set number
set guifont=Monaco:h12
""set guifont=Monaco:h20
set ruler
set ignorecase
set history=50
set hlsearch
set incsearch
set shiftwidth=4
set nocompatible
set grepprg='c:\ProgramData\chocolatey\bin\rg.exe'
set dictionary='c:\Users\李佳成\AppData\Local\nvim\dict\endict.txt'
set grepformat=%f:%l:%m
set nofoldenable


syntax on
filetype plugin indent on
filetype plugin on
set fileformats=unix,dos

function! Cd_current()
    unlet! cpath
    let cpath = expand('%:p:h')
    exe 'cd ' . cpath
endfunction

function! Copyword()
    unlet! g:Copyword
"    unlet! g:progr
    let g:Copyword = expand("<cword>")
"    let g:progr = '!"c:\Program Files (x86)\GoldenDict\GoldenDict.exe" '
endfunction

function! Searchword()
    execute '/^'.g:Copyword
endfunction

function! AskGoldendict()
    unlet! g:EnWord
    unlet! g:progr
    let g:EnWord = expand("<cword>")
    let g:progr = '!"c:\Program Files (x86)\GoldenDict\GoldenDict.exe" '
    execute g:progr.g:EnWord
endfunction
function! Openpdf()
    unlet! texname
    unlet! pdfname
    let texname = @%
    let pdfname = substitute(texname,"tex$","pdf","g")
    exec '!SumatraPDF '.pdfname
endfunction

nnoremap <F4> :call Copyword()<CR><C-W>h:call Searchword()<CR>vipy<C-W>lp
map <F2> :call Cd_current()<CR>
nnoremap <leader>w :call AskGoldendict()<CR><CR>
nnoremap <F3> :e e:\study\note\vocabulary.md<CR>
nnoremap <F5> :split term://powershell make<CR>
nnoremap <F6> :call Openpdf()<CR>
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
inoremap jk <Esc>
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
nnoremap <Space>j zzzo
nnoremap <Space>k zc
nnoremap <C-P> "+p
inoremap <C-V> <Esc>"+pa
vnoremap <C-C> "+y

nmap <F8> :call Preview()<CR>
func! Preview()
    if &filetype == 'markdown' || $filetype =='md'
        exec "!chrome %"
    endif
endfunc
call plug#begin()
Plug 'voldikss/vim-translator'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/neocomplcache.vim'
"Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'preservim/nerdcommenter'
"Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
""Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
""Plug 'ycm-core/YouCompleteMe'
call plug#end()

"---------------neocomplcache------------"
let g:neocomplcache_enable_at_startup = 1
 " Ctrl + a 计数自动加一
 " "*" 搜索光标所在的单词
 " 100iasdf[ESC] 会插入100次asdf然后回到normal模式
 " m[a-z] 标记(最多26个)    `[a-z]返回标记点
 " :reg查看寄存器   "*yy复制当前行到剪切板     "*p粘贴寄存器中的数据
 " 巧用map映射
 " -----------------ultisnips-------------"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-N>"
let g:UltiSnipsJumpBackwardTrigger="<C-P>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetDirectories=['C:\Users\李佳成\AppData\Local\nvim\plugged\ultisnips\snipdir\']

"let g:python3_host_prog = 'C:\ProgramData\Anaconda3\python.exe'
"let g:python2_host_prog = 'C:\ProgramData\Anaconda3\envs\python27/python.exe'


"----------------youcompleteme--------------"
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = 'C:\Users\李佳成\AppData\Local\nvim\plugged\YouCompleteMe\global_extra_conf.py'

""---------------powerline------------------"
"let g:syntastic_python_flake8_args = '--ignore=W191,E501,E128,W291,E126,E101'
"let b:syntastic_checkers = ['flake8']
"unlet! g:python_space_error_highlight
"let g:pymode_syntax_indent_errors = 0
"let g:pymode_syntax_space_errors = 0
"
"--------------airline-------------"
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"**************************vim-easy-align**********************"
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"----------------markdown---------------"
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1

"----------------markdown-preview--------"
let g:mkdp_auto_start = 1
let g:mkdp_auto_open = 1
""let g:mkdp_browser = 'chrome'
let g:mkdp_path_to_chrome = "chrome"
""let g:mkdp_markdown_css=''

"----------------markdown-instant-preview"
""let g:instant_markdown_browser = "firefox --new-window"
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

"/--------------vimtex-------------"
"let g:vimtex_quickfix_mode=0
"let g:vimtex_view_general_viewer = 'SumatraPDF'
"let g:vimtex_view_general_options
"    \ = '-reuse-instance -forward-search @tex @line @pdf'
"let g:vimtex_view_general_options_latexmk = '-reuse-instance'

"**************************废弃函数**********************"
"map <F5> :call Compile_latex()<CR>
"function! Compile_latex()
"    unlet! texname
"    unlet! pdfname
"    let texname = @%
"    let pdfname = substitute(texname,"tex$","pdf","g")
"python3 << EOF
"import os
"import vim
"varpdf = vim.eval('pdfname')
"vartex = vim.eval('texname')
"texshell = "xelatex " + vartex
"openpdf = "SumatraPDF" + " " + varpdf
"print("compiling tex file..................")
"os.system("wt "+texshell)
"print("done")
"print("opening pdf file....................")
"print("done")
"os.system(openpdf)
"EOF
""    vsplit term://powershell xelatex "g:texname"
""    !start g:pdfname
"endfunction

"help normal
"help execute
"help expr-quote"
"help pattern-overview
"help internal-variables
"ncm2
"plug semshi
