call plug#begin(stdpath('data') . '/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'cohama/lexima.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'zchee/deoplete-jedi'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
" syntax correction and linting
Plug 'mxw/vim-jsx'
Plug 'dense-analysis/ale'
"indentline
Plug 'Yggdroot/IndentLine'
"theming
Plug 'danilo-augusto/vim-afterglow'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'hzchirs/vim-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ayu-theme/ayu-vim'
Plug 'euclio/vim-nocturne'
Plug 'joshdick/onedark.vim'

" call PlugInstall to install new plugins
call plug#end()
" basics
set encoding=utf-8
set backspace=indent,eol,start  " more powerful backspacing
set mouse=a
filetype plugin indent on
syntax on set number
set relativenumber
"set clipboard=unnamedplus
set number
set incsearch
set ignorecase
set smartcase
set nohlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set nowrap

" function to delete trailing space after an abbreviation
	func Eatchar(pat)
    	let c = nr2char(getchar(0))
        return (c =~ a:pat) ? '' : c
endfunc

" abbreviations

iabbr jmain public static void main(String[] args){<Return>
iabbr sout System.out.println(<Right>;<Left><Left><c-r>=Eatchar('\m\s\<bar>/')<cr>


" language

set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" preferences

inoremap jk <ESC>
let mapleader = "\<space>"
set pastetoggle=<F2>
" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv
" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$
" exit terminal using esc
tnoremap <Esc> <C-\><C-n>
" navigate split screens easily
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
" change spacing for language specific
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
autocmd Filetype java setlocal ts=4 sts=4 sw=4
autocmd Filetype c setlocal ts=4 sts=4 sw=4

" Plugin settings

"" Deoplete
let g:deoplete#enable_at_startup = 1
"" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
"" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Theming
let g:indentline_char = '|'
let g:airline_powerline_fonts = 1
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11:cANSI
syntax enable
set t_Co=256
set termguicolors
"set background=dark
"colorscheme nocturne
"let ayucolor="light"
"let ayucolor="mirage"
let ayucolor="dark"
colorscheme ayu
let g:afterglow_inherit_background=0
let g:afterglow_italic_comments=1
"colorscheme onedark
"let g:airline_theme = "onedark"
"colorscheme afterglow
"let g:airline_theme = "afterglow"
"colorscheme palenight              "for palenight
"let g:airline_theme = "lucius"      "for lucius airline theme
"let g:material_style='oceanic'     "for material
"colorscheme vim-material           "for material
hi Comment guifg=#56B6C2

"NERDTree
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" jsx
let g:jsx_ext_required = 0
" ale compatibility with airline
let g:airline#extensions#ale#enabled = 1
" ale
"highlight ALEErrorSign guibg=#FF479F 
"let g:ale_set_signs = 0
"hi link ALEErrorLine ErrorMsg
"hi link ALEWarningLine WarningMsg
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier_eslint'],
\   'java': ['google_java_format']}
"let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_eslint_executable = 'prettier-eslint'
let g:ale_javascript_prettier_eslint_use_global = 1
