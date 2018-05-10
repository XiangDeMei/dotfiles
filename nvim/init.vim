call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'w0rp/ale'

Plug 'joshdick/onedark.vim'
Plug 'icymind/NeoSolarized'
Plug 'tomasr/molokai'
Plug 'spf13/vim-colors'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts'
Plug 'easymotion/vim-easymotion'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'benmills/vimux'

Plug 'kien/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Genneral {{{
    syntax on

    set number
    set relativenumber

    set background=dark
    set t_Co=256
    "colorscheme molokai
    "colorscheme NeoSolarized
    "colorscheme onedark
    "colorscheme ir_black
    colorscheme gruvbox

    " 突出显示当前行
    set cursorline

    " 检测文件类型
    filetype on
    " 针对不同的文件类型采用不同的缩进格式
    filetype indent on
    " 允许插件
    filetype plugin on
    " 启动自动补全
    filetype plugin indent on

    " 缩进配置
    " Smart indent
    set smartindent
    " 打开自动缩进
    " never add copyindent, case error   " copy the previous indentation on autoindenting
    set autoindent

    " tab相关变更
    " 设置Tab键的宽度        [等同的空格个数]
    set tabstop=4
    " 每一次缩进对应的空格数
    set shiftwidth=4
    " 按退格键时可以一次删掉 4 个空格
    set softtabstop=4
    " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
    set smarttab
    " 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
    set expandtab
    " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
    set shiftround

    " 分屏窗口移动, Smart way to move between windows
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l
" }}}

" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        " call setline(1, "\#!/usr/bin/env python")
        " call append(1, "\# encoding: utf-8")
        call setline(1, "\# -*- coding: utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc

" nerdtree {{{
    map <F7> :NERDTreeToggle<CR>
    let NERDTreeHighlightCursorline=1
    let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'
    let g:nerdtree_tabs_open_on_console_startup=0
    let g:nerdtree_tabs_open_on_gui_startup=0
" }}}

" tagbar {{{
    nmap <F9> :TagbarToggle<CR>
" }}}

" airline {{{
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_left_sep = '▶ '
    let g:airline_left_alt_sep = '❯'
    let g:airline_right_sep = '◀'
    let g:airline_right_alt_sep = '❮'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_theme = 'bubblegum'
    " 是否打开tabline
    " let g:airline#extensions#tabline#enabled = 1
" }}}

" deoplete {{{
    let g:deoplete#enable_at_startup = 1
" }}}
