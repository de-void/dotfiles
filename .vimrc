set nocompatible              " be iMproved, required
filetype off                  " required


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
Plugin 'majutsushi/tagbar'          " Class/module browser


Plugin 'bling/vim-airline'   	    	  " Lean & mean status/tabline for vim
Plugin 'herrbischoff/cobalt2.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fisadev/FixedTaskList.vim'  	" Pending tasks list
Plugin 'rosenfeld/conque-term'      	" Consoles as buffers
Plugin 'tpope/vim-surround'	   	" Parentheses, brackets, quotes, XML tags, and more
Plugin 'tpope/vim-fugitive'
Plugin 'ctags.vim'

" Elixir language support
  Plugin 'elixir-lang/vim-elixir'
  Plugin 'slashmili/alchemist.vim'


 Plugin 'tpope/vim-fugitive'


Plugin 'Valloric/YouCompleteMe'
Plugin 'ctags.vim'


call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set ruler

 "autocmd vimenter * TagbarToggle
 "autocmd vimenter * NERDTree
 "autocmd vimenter * if !argc() | NERDTree | endif

colorscheme lucario

set nu
set nobackup
set smarttab
set tabstop=2

set laststatus=2
let g:airline_theme='cobalt2'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:alchemist#elixir_erlang_src = "/usr/local/share/src"

map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0

map <F3> :NERDTreeToggle<CR>

map <F2> :TaskList<CR>
