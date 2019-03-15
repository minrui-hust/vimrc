" ==============================================================
" https://github.com/VundleVim/Vundle.vim 
" ==============================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'c.vim'

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdtree'

Plugin 'Yggdroot/LeaderF'

Plugin 'majutsushi/tagbar'

"Plugin 'minrui-hust/YouCompleteMe'

Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'

Plugin 'DoxygenToolkit.vim'

" color scheme
Plugin 'Solarized'
Plugin 'molokai'
Plugin 'monokai'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" ==============================================================


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
" ==============================================================


" ==============================================================
" Setting for nerdtree
" ==============================================================
" map space to open and toggle nerdtree
nnoremap <SPACE> :NERDTreeToggle<CR>
nnoremap <localleader><SPACE> :NERDTreeFind<CR>

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
" ==============================================================


" ==============================================================
" Setting for c.vim
" ==============================================================
" disable ctrl-j jump, cause ctrl-j is used for shrink window height
let g:C_Ctrl_j = 'off'
" ==============================================================


" ==============================================================
" Setting for you complete me
" ==============================================================
nnoremap <localleader>j :YcmCompleter GoTo<CR>
nnoremap <localleader>; <c-o>

let  g:ycm_confirm_extra_conf=0
let  g:ycm_enable_diagnostic_signs=0
let  g:ycm_max_num_candidates=15
set  completeopt="menu"
"let  g:ycm_autoclose_preview_window_after_insertion=1
"let  g:ycm_log_level="debug"
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
nnoremap <c-f> :Leaderf function<cr>
nnoremap <c-p> :Leaderf file<cr>
" ==============================================================


" ==============================================================
" Setting for airline
" ==============================================================
let g:airline_theme = "bubblegum"
let g:airline_left_sep = '►'
let g:airline_right_sep = '◄'
" ==============================================================


" ==============================================================
" Setting for tagbar
" ==============================================================
nnoremap ' :TagbarToggle<cr>
let g:tagbar_width = 32
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
" ==============================================================


" =======================================================
" key map
" =======================================================
" for edit .vimrc
nnoremap <localleader>ev :vs $MYVIMRC<cr>
nnoremap <localleader>sv :source $MYVIMRC<cr>

nnoremap <F5> :call MakeProject("cmake")<CR>
nnoremap <F6> :call MakeProject("make")<CR>

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

" switch buffer
nnoremap . :bn<cr>
nnoremap , :bp<cr>

nnoremap U J

" <F11> to toggle full screen
map <silent> <F11> :call ToggleFullscreen()<CR>
map <silent> <F10> :call Maximize_Window()<CR>
" =======================================================

" ================ extra file type ======================
autocmd BufEnter *.launch set filetype=xml
" =======================================================


" =======================================================
" self defined functions
" =======================================================
" function that call make and cmake in build directory
function! MakeProject(cmd)
    let cur_file = expand('%:p')
    let dentries = split(cur_file, '/')[0:-2]
    let home_path = $HOME

    let vim_file = ""
    let cur_path = "/".join(dentries, "/")
    while cur_path != home_path
        let vim_file = globpath(cur_path."/.project.settings", "project.vim")
        if(vim_file != "")
            exec "source ".vim_file
            break
        endif

        let dentries = dentries[0:-2]
        let cur_path = "/".join(dentries, "/")
    endwhile

    if vim_file == ""
        echo "Could not find .project.settings/project.vim"
        return
    endif

    if a:cmd == "cmake"
        exec "!cd ".g:build_dir." && ".g:cmake_cmd." && ../.project.settings/gen_ycm_conf.pl compile_commands.json ../.project.settings/ycm_extra_conf.py"
        exec "YcmCompleter ClearCompilationFlagCache"
    elseif a:cmd == "make"
        exec "!cd ".g:build_dir." && ".g:make_cmd
    else
        echo "Unknow MakeProject Command"
    endif
endfunction

" function toggle fullscreen
let g:fullscreen = 0
function! ToggleFullscreen()
  if g:fullscreen == 1
    let g:fullscreen = 0
    let mod = "remove"
  else
    let g:fullscreen = 1
    let mod = "add"
  endif
  call system("wmctrl -ir " . v:windowid . " -b " . mod . ",fullscreen")
endfunction

" function maximum vim window
function! Maximize_Window()
  silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
" =======================================================
