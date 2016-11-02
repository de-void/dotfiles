" TODO
" - Figure out how to jump around .h/.m files with ctags
" - Find some code dependency measurer: Find the GitHub repo of the guy who created a project for this.
" - Create a command that will create a NAME.cpp, NAME.hpp, and TAME.test.cpp file all in the right place
" - Figure out how to jump to the next line that has something marked in the gutter
" - Figure out what conflicts with <leader>n in Python files
" - Create a command that will display a symbol in the gutter for every line that was changed within the past x days.  This would be super helpful for debugging.

" TODO Later
" - Set a sanitizer special case list so that it ignores any problems in the third party files: http://llvm.org/releases/3.6.0/tools/clang/docs/SanitizerSpecialCaseList.html
" - Set flags in the compile_commands.json for the header files so that clang-tidy also deals with them

" Reference
" - Jump between git hunks: ]c and [c
" - Open and close the quickfix list: <leader>q
" - Show git revision history on file: :Ghistory
" - Jump to beginning or end of code block: [{ or ]}
" - Jump to last insertion point: `.
" - Close all folds: zM
" - Reselect previous visual selection: gv
" - Cut in visual mode: i
" - Delete to end of line easily: D
" - Jump to ctags definition: c-]
" - Look up clang flags: `clang -cc1 --help`
" - Create a project persisent mark :B <name>
" - List all of the project's marks :BA
" - Move to the next blank line: `}`
" - Jump to the next item in the quick fix list: `<c-n>`
" - Jump to the previous item in the quick fix list: `<c-m>`
" - Jump to the iTerm2 window: `option-space`
" - Search and replace: Search for your text like you usually would:
"   `/mytext<cr>`, then type `cgn`, then enter your replacement text and hit
"   enter.  Now you can just press `.` to go through the remaining matches to
"   replace them.
" - Search the python documentation: `K`
" - Add/remove bookmark at current line: mm
" - Show all bookmarks: ma

" Plugins {{{
call plug#begin(~/.nvim/autoload)
Plug 'kovisoft/slimv'                       " LISP
Plug 'thomasgubler/vim-gitignore'           " Respect .gitignore in vim's wildignore
Plug 'scrooloose/nerdcommenter'             " Commenting shortcuts
Plug 'scrooloose/nerdtree'                  " File system explorer
Plug 'rking/ag.vim', {'on': 'Ag'}           " ag support for searching files
Plug 'honza/vim-snippets'                   " default snippets for ultisnips
Plug 'tpope/vim-dispatch'                   " Asynchronous build
Plug 'altercation/vim-colors-solarized'     " Color scheme
Plug 'AndrewRadev/simple_bookmarks.vim'     " Persistent, global marks
"Plug 'MattesGroeger/vim-bookmarks'          " persistent project bookmarks.  It adds a gutter that is annoying.
"Plug 'scrooloose/syntastic'                 " Syntax checkers, currently used for Python
Plug 'benekastah/neomake'                   " Asynchronous make and make and syntax checking using neovim async client/server plugin feature
Plug 'xolox/vim-notes'                      " Easy note taking
Plug 'bling/vim-airline'                    " Show useful information in the status bar
Plug 'airblade/vim-rooter'                  " Change neovim's working directory to the project's root directory based on git root
" Plug 'jaxbot/semantic-highlight.vim'       " Highlight each variable a different color
" Plug 'YankRing.vim'                   " Yank history
" vim-repeat = a . function that repeats an entire macro rather than the last command only
" Documentation search: https://github.com/Keithbsmiley/investigate.vim

" General Code Formatting {{{
Plug 'kien/rainbow_parentheses.vim'         " parentheses pretty highlighting
Plug 'nathanaelkane/vim-indent-guides'      " Pretty lines to follow the begnning and end of code blocks
Plug 'tpope/vim-endwise'                    " Wisely add endings like endif, endfunction, etc..
Plug 'tpope/vim-surround'                   " Add, remove, and change surrounding characters in pairs
Plug 'Raimondi/delimitMate'                 " Automatically insert closing brackets
Plug 'Konfekt/FastFold'                     " Improve fold performance
" }}}

" git {{{
Plug 'tpope/vim-unimpaired'                 " Keyboard shortcut to jump to next git conflict
Plug 'tpope/vim-fugitive'                   " git wrapper
Plug 'airblade/vim-gitgutter'               " Show which lines have changed in the futter
" }}}

" tmux {{{
Plug 'christoomey/vim-tmux-navigator'     " Navigate tmux panes and windows like vim splist
Plug 'benmills/vimux'                     " vim + tmux convenience commands
Plug 'xolox/vim-session'                  " Save and restore vim state
Plug 'tmux-plugins/vim-tmux'              " Proper syntax highlighting and editing of tmux.conf
" }}}

" Python {{{
Plug 'davidhalter/jedi-vim'
"Plug 'klen/python-mode', {'for': 'python'}  " linters, run code, debug, etc.
" }}}

" Go {{{
Plug 'fatih/vim-go', {'for': 'go'}          " Autocompletion, syntax highlighting, etc.
" }}}

" Markdown {{{
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'            " Highlighting, folding, etc.
"Plug 'suan/vim-instant-markdown'          " Instantly preview Markdown in browser
" }}}

" Xcode functionality {{{
Plug 'kien/ctrlp.vim'                       " quick search bar
Plug 'b4winckler/vim-objc'                  " Better Obj-C indenting
Plug 'SirVer/ultisnips'                     " code snippets
Plug 'eraserhd/vim-ios'                     " .h <-> .m switching and project build
" cocoa.vim is causing me a very serious slowdown.  Why?
"Plug 'kentaroi/cocoa.vim'
"Plug 'zenangst/cocoa.vim'                    " method list, documentation, fixes the incorrect block bracket error
Plug 'Valloric/YouCompleteMe'               " code completion
Plug 'Valloric/ListToggle'                  " Toggle the display of the location and quickfix windows
Plug 'Chiel92/vim-autoformat'               " Auto-format code using existing formatters
Plug 'qstrahl/vim-matchmaker'               " Highlight the term under the cursor
Plug 'xolox/vim-misc'                       " Dependency for vim-easy-tags
Plug 'xolox/vim-easytags'                   " Automatically update exuberant ctags for syntax highlighting of user-defined variables
" }}}
call plug#end()
" }}}

" UI {{{
colorscheme solarized
set background=dark
" Make the gutter background the same color as the text area's background
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_column_always = 1
highlight SignColumn ctermbg=None
" }}}

" Settings {{{
set clipboard=unnamed
set nocompatible " Use vim settings
set modelines=0	" Prevent security hole

" All tabs are 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" General Settings
set visualbell                  " No bell
set t_vb=                       " No bell
set encoding=utf-8
set scrolloff=3                 " Allow text to scroll to center view when it's at the bottom of the document
set autoindent
set showmode
set showcmd                     " Show incomplete commands
set hidden                      " Open new file without being forced so save open buffer
set wildmenu
set wildmode=list:longest
" Ignore file types in autocomplete
set wildignore=*.pkl,*.swp,*.bak,*.pyc,*.class,*.o,*.obj,.DS_Store,*.jpg,*.d,*.dia,*.imageset,*.png,*.ai,*/Pods/*,*.xcworkspace,*.xcodeproj,*/tmp/*,*.lock,*/xcodebuild/*,*.orig,*.rope*
set ruler                       " Show cursor position info in a line at the bottom
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set undofile                    " Preserve undo information between sessions
let mapleader = "\<Space>"             " Set <leader> to ,
autocmd FileType vim autocmd BufEnter * set textwidth=0     " Force this on .vimrc which otherwise attempts to override and text textwidth=78
set textwidth=0
set formatoptions-=tc
set autoread                    " Automatically read from file whenever it's changed on disk
" TODO: Map something with the option meta key:
" :nnoremap <silent>â :set paste<CR>m`o<Esc>`:set nopaste<CR>`

" in many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" History
"set nobackup		" prevent the ~ backup files from appearing on the filesystem
set backup
set writebackup
set swapfile
set backupdir=~/.nvim/backup//
set directory=~/.nvim/swap//
set undodir=~/.nvim/undo//
set history=500		" keep 50 lines of command line history
set undolevels=500
set incsearch		" do incremental searching
" }}}

" Keyboard Mappings {{{
" To find out what a key is mapped to execute :verbose map KEY, such as <C-h>
nnoremap <leader>ev :e $MYVIMRC<cr>
" Reload .vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" Open a new vertical split window and switch to it
nnoremap <leader>w <C-w>v<C-w>l
" Navigate splits the same way you navigate tmux panes
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
set pastetoggle=<F2>    " Toggle paste mode to disable syntax changes to content that's pasted iv
" Go backward in jumplist
nnoremap <C-a> <C-i>
" Use 0 to jump to the first non-whitespace character on the line and ^ to go to the beginning of the line
nnoremap 0 ^
nnoremap ^ 0
" When accidently typing :q out of order, do what's expected rather than showing a list of commands I may have been thinking of
map q: :q

" Save a file that requires sudo privelage after you opened it
cmap w!! w !sudo tee % >/dev/null

" Search Settings
nnoremap / /\v
vnoremap / /\v
set ignorecase                      " Ignore case if all character in search string are lowercase
set smartcase                       " Case-sensitive search if at least one character is uppercase
set gdefault                        " By default, replace all occurences of a word on the line
" Highlight search results while typing
set incsearch
set showmatch
set hlsearch
" Remove search highlights with <leader><space>
nnoremap <leader><space> :noh<cr>
" Tab key matches bracket pairs
nnoremap <tab> %
vnoremap <tab> %
" Use semi-colon as colon key
nnoremap ; :
" TODO: Make a shortcut that puts ; at the end of the current line
"nnoremap <leader>:

"These are to cancel the default behavior of d, D, c, C to put the text they delete in the default register. Note that this means e.g. "ad won't copy the text into register a anymore.  You have to explicitly yank it.
vnoremap i d \| :let @"=@c<cr>
nnoremap d "cd
vnoremap d "cd
nnoremap D "cD
vnoremap D "cD
nnoremap c "cc
vnoremap c "cc
nnoremap C "cC
vnoremap C "cC
nnoremap x "cx
vnoremap x "cx

vmap r "_dP       // Replace the selected text with what's in the yank register

" vim training
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Show/hide line numbers
nnoremap <leader>n :set number<cr>
nnoremap <leader>nn :set nonumber<cr>
nnoremap <leader>m :set relativenumber<cr>
nnoremap <leader>mm :set norelativenumber<cr>
" Cool ideas to show relative or absolute line numbers depending on current use
":au FocusLost * :set number
":au FocusGained * :set relativenumber
"autocmd InsertEnter * :set number


" Don't use Ex mode, use Q for formatting
map Q gq

" Cut (Copy and then delete the current line)
nnoremap yd yydd<CR>
"vnoremap yd y \| d<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Jump to next and previous items in quickfix list
" Having either of these shortcuts enabled breaks selecting items in the quickfix list by
" pressing Enter
nnoremap <leader>j :cn<CR>
nnoremap <leader>k :cp<CR>

" tmux navigator
noremap <silent> <c-/> :TmuxNavigatePrevious<cr>
tnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
tnoremap <silent> <c-j> :TmuxNavigateDown<cr>
tnoremap <silent> <c-k> :TmuxNavigateUp<cr>
tnoremap <silent> <c-l> :TmuxNavigateRight<cr>
inoremap <silent> <c-h> <Esc>:TmuxNavigateLeft<cr>I
inoremap <silent> <c-j> :echo "test"
inoremap <silent> <c-k> <Esc>:TmuxNavigateUp<cr>I
inoremap <silent> <c-l> <Esc>:TmuxNavigateRight<cr>I

" Exit terminal mode:
tnoremap <Esc> <C-\><C-n>
" }}}

" Frequent Files {{{
" File to keep all of my debugging tips, reminders, and checlist for myself
:command! Bug :e ~/Dropbox/dev/docs/bug-todo.md
:command! Apple :e ~/Dropbox/dev/docs/apple.md
:command! Memories :e ~/Dropbox/life/memories
:command! Math :e ~/Dropbox/dev/math.md
:command! Cs :e ~/Dropbox/dev/cs.md
" }}}

" Plugin Settings {{{

"vim-surround {{{
" NOTE: we explicitly set a temporary marker (z) and restore
"       it after the surround operation because otherwise the
"       surround plugin will move the cursor to the opening
"       quote of the operand after the operation, instead of
"       keeping the cursor where it was before the operation
"
nmap <Leader>' mzcs"'`z
nmap <Leader>" mzcs'"`z
" Surround the current line with [] and return to the original cursor position
nmap <Leader>r mzyssr`z
" }}}

"delimitMate {{{
" Skip over closing parenthesis when pressing tab when it's the next character
function! SkipClosingParentheses()
  let line = getline('.')
  let current_char = line[col('.')-1]

  "Ignore EOL
  if col('.') == col('$')
    return "\t"
  end

  return stridx(']})', current_char)==-1 ? "\t" : "\<Right>"
endfunction

"inoremap <expr> <Tab> SkipClosingParentheses()
" }}}

" nerd-tree {{{
map <leader>f :NERDTreeToggle<CR>
" }}}

" simple-bookmark.vim {{{
let g:simple_bookmarks_filename = getcwd() + '.vim-bookmarks'
:command! -nargs=+ B :Bookmark <args>
:command! -nargs=+ BG :GotoBookmark <args>
:command! -nargs=+ BD :DelBookmark <args>
:command! BA :CopenBookmark
" }}}

" vim-bookmarks {{{
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
" }}}

" python-mode {{{
" Python 3 is not currently supported in neovim: https://github.com/neovim/neovim/pull/2208, https://github.com/neovim/neovim/issues/1829
"let g:pymode_python = 'python3'
"let g:pymode_lint = 1                   " Enable linter
"let g:pymode_lint_cwindow = 0           " Don't auto open the window of errors
"let g:pymode_lint_on_write = 1          " Check with linter on save
"let g:pymode_lint_checkers = ['mccabe', 'pylint', 'pep8', 'pyflakes', 'pep257'] " pylama wraps pep8, pep257, pyflakes, mccabe, and pylint
"let g:pymode_rope_complete_on_dot = 0   " Disable pymode completion in favor of YouCompleteMe
"let g:pymode_lint_ignore = "E501,C0301"
" }}}

" FastFold {{{
function! SetFoldMethod()
   if &ft =~ 'vim'
        set foldmethod=marker   " I want to be able to manually sort into folded sections
        set foldlevel=0
    else
        set foldcolumn=0        " Something is trying to set foldcolumn=3 for .m objc files.  Override it.
        set foldmethod=syntax
    endif
endfun
autocmd BufRead * call SetFoldMethod()
set foldnestmax=3
set foldcolumn=0
let g:fastfold_savehook = 0     " Don't update folds on file save
let g:fastfold_togglehook = 1   " Update folds when the user toggles a fold
" Go to the end of the current fold
nmap z] zo]z
" Go to the beginning of the current fold
nmap z[ zo[z
" }}}

" ctrlp {{{
" Search through ctags
nnoremap <leader>. :CtrlPTag<cr>
" Make ctrlp a lot faster in git repositories
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ -g ""'
let g:ctrlp_use_caching = 0             " ag is so fast that caching isn't necessary
let g:ctrlp_max_files = 10000
let g:ctrlp_working_path_mode = 'r'     " Always use the current working directory rather than the location of the current file
let g:ctrlp_by_filename = 1             " Default to filename only search rather than searching the whole path
" }}}

" vim-easytags {{{
let g:easytags_async = 1
let g:easytags_file = '~/.nvim/tags'
let g:eastytags_always_enable = 1 " Highlight tags immediately on entering a file
let g:easytags_python_enabled = 1 " The Python highlighter is 2x faster than the VimScript highlighter
" easy-tags should automatically execute :UpdateTags on CursorHold
"autocmd FileType objc,cpp,c,python autocmd InsertLeave <buffer> :silent UpdateTags
" }}}

" unite.vim {{{
"noremap <C-p> :Unite file_rec/async<cr>
" }}}

" Syntastic {{{
let g:syntastic_python_python_exec = '/usr/local/bin/python3.4'
let g:syntastic_python_checkers = ['pylint', 'pep257']
"let g:syntastic_python_checkers = ['pylint', 'flake8', 'pyflakes', 'pep8', 'pep257']
" Using syntastic with Python is compatible with using YouCompleteMe for Objective-C becuase Syntastic is enabled only for Python
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": ["python"] }
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_objc_checkers = ['oclint -rc LONG_LINE=200']
let g:syntastic_auto_loc_list = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

" vim-autoformat {{{
let g:aformat = 1 " Custom variable I use to easily diable autoformatting on the fly

" Autoformat 4 seconds after the user's cursor stops moving in normal mode
" I had to remove objc and objcpp from this list to prevent messing up the screwy files at work
"autocmd FileType cpp,c autocmd InsertLeave <buffer> :silent Autoformat

" On Python files, autoformat it and then show warnings and errors after
" leaving insert but not if it has already been done since the last
" InsertLeave
let g:formatReady = 0
set updatetime=4000
"autocmd FileType python autocmd TextChanged <buffer> call SetFormatReady()
"autocmd FileType python,cpp autocmd InsertLeave <buffer> call SetFormatReady()
"autocmd FileType python,cpp autocmd CursorHold <buffer> call TryFormatAndCheck()
autocmd FileType python,cpp autocmd TextChanged,InsertLeave <buffer> call FormatAndCheck()

function! FormatAndCheck()
        ":Autoformat
        ":w " I need to save after the autoformat, otherwise changes made there will not be reflected in the syntax check step below:
        :Neomake
        ":SyntasticCheck
endfunction

function! TryFormatAndCheck()
    " TODO: Don't run the autoformatter if the user just pressed undo or if
    " there is currently a syntax error?
    if g:formatReady && g:aformat
        let g:formatReady = 0
        call FormatAndCheck()
    endif
endfunction

function! SetFormatReady()
    let g:formatReady = 1
endfunction

" Auto save
" TODO: How do I solve the issue of saving before :bw?
autocmd BufUnload,BufLeave,FocusLost,QuitPre,InsertLeave,TextChanged,CursorHold * silent! wall
" }}}

" vim-session {{{
let g:session_directory = getcwd()          " The session directory is always the current directory.  This should allow save and restory on a per project basis
let g:session_default_name = ".vim-session"
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_lock_enabled = 0
autocmd QuitPre * silent! SaveSession
" }}}

" fugitive {{{
set statusline+=%{fugitive#statusline()}
:command! Ghistory :Glog -- %
" }}}

" YouCompleteMe {{{

" I might want to use jedi-vim instead of YouCompleteMe for Python:
 "let g:ycm_filetype_specific_completion_to_disable = { 'python' : 1 }
 "let g:ycm_filetype_blacklist = { 'python' : 1 }

" Also consider using clang complete instead of YouCompleteMe for Objective-C
" since it currently supports multi argument methods. http://appventure.me/2013/01/29/use-vim-as-xcode-alternative-ios-mac-cocoa/

nnoremap <leader>d :YcmCompleter GoToDefinition <cr>
nnoremap <leader>s :YcmCompleter GoToDeclaration <cr>
"let g:ycm_server_log_level = 'debug'
let g:ycm_global_ycm_extra_conf = '/Users/admin/.ycm_extra_conf.py'
:command! Errors :YcmDiag
let g:ycm_confirm_extra_conf = 0
set completeopt-=preview " Don't show the window at the top with additional completion information
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_collect_identifiers_from_tags_files = 1   " Load completion identifiers from the ctags files as well.  ctags files in use can be found with `:echo tagfiles()`
let g:ycm_autoclose_preview_window_after_completion = 1 " Close the window at the top that appears with additional completion information
let g:ycm_autoclose_preview_window_after_insertion = 1
function! SetErrorsAndWarnings() " Only show the errors and warnings gutter if it's a file that I wrote
    let currentFilePath = expand('%:p')
    echo currentFilePath
    if currentFilePath =~ '/Dropbox/dev/'
        let g:ycm_show_diagnostics_ui = 1
    elseif currentFilePath =~ '/local'
        let g:ycm_show_diagnostics_ui = 1
    else
        let g:ycm_show_diagnostics_ui = 0
    endif
endfunction
" Execute the function before the file is opened so that it can be turned off in time for files that are be opened
"autocmd BufRead * call SetErrorsAndWarnings()
" Execute it on entering a buffer so that it can be turned on for files that were already read
"autocmd BufEnter * call SetErrorsAndWarnings()
let g:ycm_semantic_triggers =  {
  \   'objc' : ['re!\@"\.*"\s',
  \     're!\@\w+\.*\w*\s',
  \     're!\@\(\w+\.*\w*\)\s',
  \     're!\@\(\s*',
  \     're!\@\[.*\]\s',
  \     're!\@\[\s*',
  \     're!\@\{.*\}\s',
  \     're!\@\{\s*',
  \     "re!\@\'.*\'\s",
  \     '#ifdef ',
  \     're!:\s*',
  \     're!=\s*',
  \     're!,\s*', ],
  \ }
" }}}

" ListToggle {{{
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
" }}}

" vim-auto-save {{{
let g:auto_save = 1                 " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save_silent = 1          " do not display the auto-save notification
let g:auto_save_no_updatetime = 1   " do not set the updatetime to 200
" }}}

" rainbow {{{
let g:rainbow_active = 1
" }}}

" rainbow_parentheses {{{
au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
    "\ ['gray',        'RoyalBlue3'],
    "\ ['black',       'SeaGreen3'],
    "\ ['darkgray',    'DarkOrchid3'],
" }}}
let g:lisp_rainbow=1                    "Lisp rainbow parentheses

" ag.vim {{{
":command! -nargs=+ S :Ag! --vim --python --cpp "<args>"
:command! -nargs=+ S :Ag! "<args>"
:command! -nargs=+ Sm :Ag! --matlab --ignore=*Test* --ignore=_* "<args>"
:command! -nargs=+ St :Ag! --matlab --ignore=*Test* --ignore=_* --ignore=*Tool* "<args>"
" }}}

" UltiSnips {{{
" TODO: Why doesn't <c-j> work in a Python file to complete an snip such as
" for "@property"
"The below key bindings are compatible with YouCompletMe integration
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" }}}

" vim-matchmaker {{{
" Underline words matched by Matchmaker
function! ToggleMatchmaker()
    " Don't show matches in non-code files
    if &ft =~ 'objc\|objcpp\|python\|cpp'
        Matchmaker
    else
        " Specifically, I want it disabled on help, mkd
        Matchmaker!
    endif
endfun
autocmd BufEnter * call ToggleMatchmaker()
highlight Matchmaker guibg=NONE
highlight Matchmaker gui=underline
highlight Matchmaker ctermbg=NONE
highlight Matchmaker cterm=underline
" }}}

" YankRing {{{
" Show all yanks with YankRing
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>
" }}}

" vim-instant-markdown {{{
filetype plugin indent on
let g:instant_markdown_autostart = 0
" }}}
" }}}

" Autocommands {{{
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
" :help autocmd-events
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	  \ | wincmd p | diffthis
endif

" Set the title of the Terminal to the currently open file
function! SetTerminalTitle()
    let titleString = expand('%:t')
    if len(titleString) > 0
        let &titlestring = expand('%:t')
        set title
    endif
endfunction
autocmd BufEnter * call SetTerminalTitle()

" Automatically edit any file that is open elsewhere, skip the message that asks for confirmation
augroup NoSimultaneousEdits
    autocmd!
    autocmd  SwapExists  *  :let v:swapchoice = 'e'
augroup END
set shortmess+=A " Don't warn about existing swap files

" Remove all trailing whitespaces on file save (doesn't remove trailing newlines)
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
" I removed objc from this list so that it doesn't mess up files at work that have poor whitespace
autocmd FileType vim,mkd,c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Whenever vim gains focus, autoload any changes made by another process,
" don't try to run this in the command line.  It will cause an error
"autocmd CursorHold * if getcmdwintype() == '' | checktime | endif
" }}}

" Builds {{{
function! MakeAndFormat()
    :silent! Make
    if &ft =~ 'python\|cpp'
        :silent! :Autoformat
        :silent! :wall
        ":silent! call FormatAndCheck()
    endif
endfunction
nnoremap <silent> <leader>b :call MakeAndFormat()<cr>
" TODO: Edit the errorformat so that it knows there's an error when "segfault" occurs in the output

" The same as :set, but it automatically escapes the arguments
function! Set( ... )
  let result = ''
  for i in a:000
    if ( i !~ '[=!?]' )
      let result .= '\'
    endif
    " Escaping out any existing spaces takes care of the case where we passed in escaped spaces.
    let result .= ' ' .escape( i, ' ' )
  endfor
  execute 'set' .result
endfunction
com! -nargs=+ -complete=option Set call Set( <f-args> )

let cwd = getcwd()
if ( cwd == '/local/dev/Foundation')
    :Set makeprg=sudo ~rc/bin/buildit -project Foundation -release Monarch -archive -rootsDirectory ~/Desktop/ -dsymsInDstroot -configuration Debug /local/dev/Foundation/
elseif ( cwd == '/local/dev/UserActivity')
    :Set makeprg=sudo ~rc/bin/buildit -release Monarch -project UserActivity -archive -rootsDirectory ~/Desktop/ -dsymsInDstroot -configuration Debug /local/dev/UserActivity/
elseif ( cwd == '/local/dev/aalgocpp')
    set makeprg=./build.sh\ &&\ ./build/algorithmscpp
elseif ( cwd == '/local/dev/aalgopy')
    Set makeprg=py.test-3.4 -vv -s
endif

" }}}