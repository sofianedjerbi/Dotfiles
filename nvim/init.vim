" Author: Sofiane DJERBI (@Kugge)
" Neovim + vim-plug config
"TODO: hide cmdline when not used

"""""""""""""""""
" PREPROCESSING "
"""""""""""""""""

" Set bash shell
set shell=bash
" Detect filetype
filetype on
" Load ftplugin
filetype plugin on
" Load indent.nvim
filetype indent on

"""""""""""""
" Functions "
"""""""""""""

" Trim Whitespaces
fun TrimWhitespaces()
    " Save location
    let l:save = winsaveview()
    " Delete pattern
    keeppatterns %s/\s\+$//e
    " Goto previous location
    call winrestview(l:save)
endfun

" Empty message after a specified time
fun s:ewrapper(timer)
    echo ''
endfun

""""""""""""""""
" Plugins init "
""""""""""""""""

" Init
call plug#begin()
    " GENERAL PURPOSE
    Plug 'glepnir/dashboard-nvim'                   " Dashboard
    Plug 'preservim/nerdtree'                       " Explorer
    Plug 'jbyuki/instant.nvim'                      " Collaborative editing
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Language server
    Plug 'tomtom/tcomment_vim'                      " Comments
    Plug 'unblevable/quick-scope'                   " Move faster L/R
    Plug 'airblade/vim-gitgutter'                   " Wrapper for git diff
    Plug 'KadoBOT/nvim-spotify', { 'do': 'make' }   " Spotify-tui wrapper
    Plug 'Yggdroot/indentLine'                      " Display vertical lines
    " LANGUAGES PLUGIN
    Plug 'dag/vim-fish'                             " Fish syntax color
call plug#end()

" Disable git gutter signs by default
let g:gitgutter_signs = 0

" Instant.nvim config
let g:instant_username = "Kugge" " Remote username

" IndentLine chars
let g:indentLine_char = "┆"
let g:indentLine_color_gui = "#1C2A35"

""""""""""""""""""
" User interface "
""""""""""""""""""

" Numbers : Nothing by default
"set relativenumber " Show relative numbers
"set number " And line number

" Hide statusline
set laststatus=0

" Syntax
syntax on

" Highlight trailing whitespaces
highlight TrailingSpaces ctermbg=grey guibg=grey

" Highlight characters after column 80
highlight Column80 ctermbg=red guibg=red

"""""""""""""""""
" AUTO COMMANDS "
"""""""""""""""""

" Hide the command entered in command line after a short period of time
augroup cmdline
	autocmd!
	"autocmd CmdlineLeave :  call timer_start(5000, funcref('s:ewrapper'))
augroup end

" Match characters after column 80
au BufWrite * call matchadd('Column80', '\%>80v', -1)
" Match trailing whitespaces
au BufWrite * call matchadd('TrailingSpaces', '\s\+$', -1)

" Quickscope format
highlight QuickScopePrimary gui=underline,bold cterm=underline
highlight QuickScopeSecondary gui=underline cterm=underline

"""""""""""""
" Behaviour "
"""""""""""""

" Tab
set tabstop=4 " Tab mapped to 4 spaces
set softtabstop=4 " tab column number
set shiftwidth=4 " Indents width
set expandtab " Tab to spaces

" Exit Terminal mode with escape 2 times
tno <Esc><Esc> <C-\><C-n>

" Command-related
set ignorecase " Ignore case
set smartcase

" Scrolling
set scrolloff=10 " Scroll gap

"""""""""""""""""""""
" Keyboard controls "
"""""""""""""""""""""

" Toggle numbers with alt + space
nmap <A-Space> :set nonumber! norelativenumber!<Return>

" Add lines with Oo without bein in insert mode
nno O O<Esc>
nno o o<Esc>

" Nerdtree toggle with F6
nmap <F6> :NERDTreeToggle<Return>

" Toggle git diff with ALT + X
nmap <A-x> :GitGutterSignsToggle<Return>
nmap <A-x> :GitGutterLineHighlightsToggle<Return>

" Toggle quick scope with F6
nmap <F6> :QuickScopeToggle<Return>

" Remove trailing whitespaces with F5
nmap <F5> :call TrimWhitespaces()<Return>

" Save/load session
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>

"""""""""""""""""""""""""
" Non-keyboard controls "
"""""""""""""""""""""""""

" Enable the mouse in all modes
set mouse=a

""""""""""""""""
" Colors setup "
""""""""""""""""

" Use terminal colors
set termguicolors

" Set nb column color (see alacritty colors)
hi LineNr guifg=#BD924C
"hi LineNr guibg=#0C161D

" Change highlight search color (see alacritty colors)
hi Search guibg=#BD924C

" Change ~ symbol color (no line)
hi NonText guifg=#9F793B

" Change comment colors and set them to italic
hi Comment gui=italic guifg=#466986

