set nocompatible
runtime macros/matchit.vim

filetype off
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
syntax on
filetype plugin indent on
set ofu=syntaxcomplete#Complete

colorscheme darkblood

" Fix keys
if &term =~ "rxvt"
	exec "set <kPageUp>=\<ESC>[5^"
	exec "set <kPageDown>=\<ESC>[6^"
	exec "set <C-Left>=\<ESC>Od"
	exec "set <C-Right>=\<ESC>Oc"
endif

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

nnoremap <F3> :set invcul cul?<CR>
imap <F3> <C-O>:set invcul cul?<CR>

nnoremap <F4> :set invcursorcolumn cursorcolumn?<CR>
imap <F4> <C-O>:set invcursorcolumn cursorcolumn?<CR>

nnoremap <F5> :call ColorColumnToggle()<CR>
imap <F5> <C-O>:call ColorColumnToggle()<CR>

function ColorColumnToggle()
	if &colorcolumn
		set colorcolumn=
	else
		set colorcolumn=80
	endif
endfunction

set mouse=c
set directory=~/.tmp
set backupdir=~/.tmp
set backup
set noerrorbells
set novisualbell
set magic
set hidden
set shortmess=atI
let mapleader="ò"

set fileencodings=utf-8,latin1
set encoding=utf-8
set termencoding=utf-8
set guifont=Terminus\ 8

set helplang=en
set history=1000
set hlsearch
set incsearch
set sidescroll=1
set scrolloff=3
set nowrap

set autoindent
set smartindent
set smarttab
set ignorecase
set smartcase
set shiftwidth=2
set ts=2
set noexpandtab
set modeline
set tildeop
set cpoptions+=$

set statusline=%F%m%r%h%w\ [Type:\ %Y]\ [Lines:\ %L\ @\ %p%%\ {%l;%v}]\ %{fugitive#statusline()}
set laststatus=2

set number
set showmode ruler

set wildmode=longest:full
set wildmenu

" make stuff more understandable
"mat ExtraWhitespace /^\t\+\zs \+\| \+\zs\t\+/
set listchars=tab:·\ ,trail:░,extends:»,precedes:«
set list

" Commands
command -range=% Share silent <line1>,<line2>write !curl -s -F "sprunge=<-" http://sprunge.us | head -n 1 | tr -d '\r\n ' | xclip
command -nargs=1 Indentation silent set ts=<args> shiftwidth=<args>

" Mappings
map RE gq}

map <F1> <Nop>
imap <F1> <Nop>
vmap <F1> <Nop>

imap <silent> <C-H> <C-O>h<CR>
imap <silent> <C-K> <C-O>k<CR>
imap <silent> <C-L> <C-O>l<CR>
imap <silent> <C-J> <C-O>j<CR>

map <silent> <PageUp> 1000<C-U>
map <silent> <PageDown> 1000<C-D>
imap <silent> <PageUp> <C-O>1000<C-U>
imap <silent> <PageDown> <C-O>1000<C-D>

" Disable arrows to learn to stop using them
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Tabs
map <silent> <C-T> :tabnew<CR>
map <silent> <C-W> :tabclose<CR>
map <silent> <kPageUp> :tabprevious<CR>
map <silent> <kPageDown> :tabnext<CR>
map <silent> <Leader>H :tabprevious<CR>
map <silent> <Leader>L :tabnext<CR>
imap <silent> <C-T> <C-O>:tabnew<CR>
imap <silent> <C-W> <C-O>:tabclose<CR>
imap <silent> <kPageUp> <C-O>:tabprevious<CR>
imap <silent> <kPageDown> <C-O>:tabnext<CR>
map <silent> <C-H> :tabfirst<CR>
imap <silent> <C-H> <C-O>:tabfirst<CR>

" Windows
"map <silent> <C-Left> :wincmd h<CR>
"map <silent> <C-Up> :wincmd k<CR>
"map <silent> <C-Right> :wincmd l<CR>
"map <silent> <C-Down> :wincmd j<CR>
map <silent> <C-H> :wincmd h<CR>
map <silent> <C-K> :wincmd k<CR>
map <silent> <C-L> :wincmd l<CR>
map <silent> <C-J> :wincmd j<CR>
map <silent> <C-+> :resize +1<CR>
map <silent> <C--> :resize -1<CR>

"imap <silent> <C-Left> <C-O>:wincmd h<CR>
"imap <silent> <C-Up> <C-O>:wincmd k<CR>
"imap <silent> <C-Right> <C-O>:wincmd l<CR>
"imap <silent> <C-Down> <C-O>:wincmd j<CR>
imap <silent> <C-O><C-H> :wincmd h<CR>
imap <silent> <C-O><C-K> :wincmd k<CR>
imap <silent> <C-O><C-L> :wincmd l<CR>
imap <silent> <C-O><C-J> :wincmd j<CR>
imap <silent> <C-O><C-+> :resize +1<CR>
imap <silent> <C-O><C--> :resize -1<CR>

" File handling
map <Leader>N :NERDTreeToggle<CR>
map <Leader>T :CommandT<CR>
map <Leader>B :CommandTBuffer<CR>
map <Leader>F :CommandTFlush<CR>
map <Leader>U :GundoToggle<CR>
map <Leader>S :mksession! .vim.session<CR>

" Better ESC
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
inoremap <Tab> <Esc>`^
au VimEnter * map <Tab> <Esc>
au VimEnter * imap <Tab> <Esc>
au VimEnter * vmap <Tab> <Esc>

" Syntastic
let g:syntastic_enable_signs = 1

let c_no_curly_error   = 1
let g:localrc_filename = '.lvimrc'

" Command-T
let g:CommandTMaxFiles=100000
let g:CommandTMaxDepth=100

" cctree
let g:CCTreeUsePerl = 1
let g:CCTreeUseUTF8Symbols = 1

autocmd VimEnter * call DoAliases()
function DoAliases()
	Alias W  w
	Alias Wq wq
	Alias Q  q
	Alias Qw wq
endfunction

"autocmd VimEnter * call DoArpeggios()
function DoArpeggios()
	Arpeggio inoremap jk <ESC>
	Arpeggio inoremap kl <CR>

	Arpeggio inoremap ui <BS>
	Arpeggio inoremap io <DEL>

	Arpeggio inoremap ji <C-O>^
	Arpeggio inoremap ko <C-O>$
endfunction

