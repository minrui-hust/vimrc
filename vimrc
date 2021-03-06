" check if plug.vim exist, if not, download one
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

"Plug 'vim-scripts/c.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
"Plug 'zxqfl/tabnine-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'minrui-hust/color-cpp.vim'
"Plug 'tenfyzhong/CompleteParameter.vim'
Plug 'Yggdroot/LeaderF'
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'vim-scripts/DoxygenToolkit.vim'
"Plug 'jiangmiao/auto-pairs'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'tpope/vim-surround'

" color scheme
Plug 'vim-scripts/Solarized'
Plug 'vim-scripts/molokai'
Plug 'vim-scripts/monokai'

call plug#end()


" ==============================================================
" global settings
" ==============================================================
" encoding
set encoding=utf-8
set fileencodings=utf-8,gbk,gb18030,gk2312
set ambiwidth=double

" font
set guifont=Ubuntu\ Mono\ 15

" color scheme
colorscheme molokai

" syntax enable
syntax enable

" auto indent
set ts=2
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set cindent

" set backspace work
set backspace=indent,eol,start

set number

" corss cursor
set cursorline
set cursorcolumn

" highlight search
set hlsearch
set incsearch

" no wrap
set nowrap

" hide menu bar
set guioptions-=T

" local leader to be ';'
let maplocalleader = ";"

let s:user_name = "Rui Min"
let s:user_email= "rui.min@allride.ai"
let s:user_company = "Allride.ai"
" ==============================================================


" ==============================================================
" Setting for nerdtree
" ==============================================================
" map space to open and toggle nerdtree
nnoremap <space> :NERDTreeFind<cr>
nnoremap <c-b> :NERDTreeToggle<cr>

" set tree node display cursor to '+' and '-'
let NERDTreeDirArrowExpandable = '+'
let NERDTreeDirArrowCollapsible = '-'

" set the nerdtree window position and size
let NERDTreeWinPos='left'
let NERDTreeSize=30

" show line number
let NERDTreeShowLineNumbers=0

" show hidden files at start
let NERDTreeShowHidden=0

" change the vim pwd with nerdtree
let NERDTreeChDirMode=2
" ==============================================================


" ==============================================================
" Setting for c.vim
" ==============================================================
" disable ctrl-j jump, cause ctrl-j is used for shrink window height
let g:C_Ctrl_j = 'off'
" ==============================================================


" ==============================================================
" Setting for markdown-preview.nvim
" ==============================================================
let g:mkdp_auto_close = 0
" ==============================================================


" ==============================================================
" Setting for enhanced highlight
" ==============================================================
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
" ==============================================================



" ==============================================================
" Setting for DoxygenToolkit.vim
" ==============================================================
let g:DoxygenToolkit_commentType = "C++"
nnoremap <localleader>cm :Dox<CR>
" ==============================================================


" ==============================================================
" Setting for you complete me
" ==============================================================
nnoremap <localleader>j :YcmCompleter GoTo<CR>
nnoremap <localleader>; <c-o>
nnoremap <localleader>fx :YcmCompleter FixIt<CR>
command  Diag YcmDiags

let  g:ycm_confirm_extra_conf=0
let  g:ycm_enable_diagnostic_signs=0
let  g:ycm_max_num_candidates=15
"set  completeopt="menu"
let  g:ycm_add_preview_to_completeopt = 1
"let  g:ycm_autoclose_preview_window_after_insertion=1
"let  g:ycm_log_level="debug"

" for complete_parameters
"inoremap <silent><expr> ( complete_parameter#pre_complete("()")
" ==============================================================


" ==============================================================
" Setting for codefmt
" ==============================================================
nnoremap <localleader>= :FormatCode<cr>
let clang_format_style='file'
" ==============================================================


" ==============================================================
" Setting for leaderf
" ==============================================================
nnoremap ' :Leaderf function<cr>
nnoremap <c-p> :Leaderf file<cr>
" ==============================================================

" ==============================================================
" Setting for CtrlSF
" ==============================================================
" ctrl-f to search global
function! DoCtrlSF()
  let l:pattern = input("<pattern>:", "\\b".expand('<cword>')."\\b")
  exec ":CtrlSF ".l:pattern
endfunction
nnoremap <c-f> :call DoCtrlSF()<cr>
" default use regex search
let g:ctrlsf_regex_pattern = 1
" ==============================================================

" ==============================================================
" Setting for airline
" ==============================================================
let g:airline_theme = "bubblegum"
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" ==============================================================


" ==============================================================
" Setting for tagbar
" ==============================================================
nnoremap <c-t> :TagbarToggle<cr>
let g:tagbar_width = 32
"let g:tagbar_iconchars = ['+', '-']
let g:tagbar_autofocus = 1
"let g:tagbar_autoclose = 1
" ==============================================================


" =======================================================
" key map
" =======================================================
" for edit .vimrc
nnoremap <localleader>ev :vs $MYVIMRC<cr>
nnoremap <localleader>sv :source $MYVIMRC<cr>

" switch between windows
nnoremap H <c-w>h
nnoremap L <c-w>l
nnoremap J <c-w>j
nnoremap K <c-w>k

" resize window
nnoremap <c-h> :vertical resize -5<cr>
nnoremap <c-l> :vertical resize +5<cr>
nnoremap <c-j> :resize -5<cr>
nnoremap <c-k> :resize +5<cr>
nnoremap W <c-w>=

" fast close window
nnoremap <localleader>x :q<cr>

" fast split window
nnoremap <localleader>v :vs<cr>
nnoremap <localleader>n :sp<cr>

" chomp last ;
nnoremap d; $x

" system clipboard
nnoremap Y "+y
nnoremap P "+p

nnoremap ? *

" move next line up
nnoremap U J

" alt-j to page down, alt-k to page up
nnoremap <m-j> <c-d>
nnoremap <m-k> <c-u>

" terminal map
if has('terminal')
  " esc to enter terminal normal mode
  tnoremap <localleader><esc> <C-W>N
  " F1 to open current window as terminal
  noremap <F1> :bel terminal<CR>
  " <cr> to enter termimal working mode
  au TerminalOpen * if &buftype == 'terminal' | nnoremap <buffer> <CR> i | endif
  " close terminal
  au TerminalOpen * if &buftype == 'terminal' | nnoremap <buffer> <localleader>x :q!<CR> | endif
  " terminal no numbers 
  au TerminalOpen * if &buftype == 'terminal' | :setlocal nonumber | endif
  " terminal no vertical cursor
  au TerminalOpen * if &buftype == 'terminal' | :setlocal nocursorcolumn | endif
  " background color
  hi Terminal ctermbg=lightgrey ctermfg=lightblue guibg=#32122B guifg=white

  let g:terminal_ansi_colors = ['#101010', '#AA0000', '#00AA00', '#AAAA00', '#6699FF', '#AA00AA', '#00AAAA', '#AAAAAA', '#555555', '#FF5555', '#55FF55', '#FFFF55', '#5555FF', '#FF55FF', '#55FFFF', '#FFFFFF']

  tmap <silent> <ScrollWheelUp> <c-w>N
endif

" <F11> to toggle full screen
map <silent> <F11> :call ToggleFullscreen()<CR>
map <silent> <F10> :call Maximize_Window()<CR>
" =======================================================

" ================ extra file type ======================
autocmd BufEnter *.launch set filetype=xml
autocmd BufEnter *.urdf set filetype=xml
" =======================================================

" =======================================================
" self defined functions
" =======================================================

" add file header contain author and company information
function! AddFileHeader()
  let l:date = strftime("%Y")
  exec "normal gg"
  exec "normal O"."// Copyright ".l:date." ".s:user_company."."." All Rights Reserved."
  exec "normal o"."Author: ".s:user_name." (".s:user_email.")."
  exec "normal :update\n"
endfunction
command Header call AddFileHeader()

" =======================================================
