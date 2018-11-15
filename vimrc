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

Plugin 'cpp.vim'

" https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'

" https://github.com/Valloric/YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" color scheme
Plugin 'Solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" ==============================================================

" ==============================================================
" Setting for nerdtree
" ==============================================================
" map F2 to shortcut of nerdtree
map <F2> :NERDTreeToggle<CR>

map F :NERDTreeFind<CR>

let NERDTreeMouseMode=2

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



set background=dark
colorscheme solarized

set guifont=Ubuntu\ Mono\ 15

syntax enable
syntax on

set ts=4
set expandtab

set shiftwidth=4

set autoindent

set cindent

set nu

set cursorline
set cursorcolumn

set hlsearch

set nowrap

" =======================================================
" key map
" =======================================================
nmap <F5> :call MakeProject("cmake")<CR>
nmap <F8> :call MakeProject("make")<CR>
" =======================================================

" =======================================================
" self defined functions
" =======================================================
function MakeProject(cmd)
    let cur_file = expand('%:p')
    let dentries = split(cur_file, '/')[0:-2]
    let home_path = $HOME

    let cur_file = ""
    let cur_path = "/".join(dentries, "/")
    while cur_path != home_path
        let cur_file = globpath(cur_path, "project.vim")
        if(cur_file != "")
            exec "source ".cur_file
            break
        endif

        let dentries = dentries[0:-2]
        let cur_path = "/".join(dentries, "/")
    endwhile

    if cur_file == ""
        echo "Could not find project.vim"
        exit
    endif

    if a:cmd == "cmake"
        exec "!cd ".g:build_dir." && ".g:cmake_cmd." && cp compile_commands.json .."
        exec "YcmForceCompileAndDiagnostics"
    elseif a:cmd == "make"
        exec "!cd ".g:build_dir." && ".g:make_cmd
    else
        echo "Unknow MakeProject Command"
    endif

endfunction
" =======================================================
