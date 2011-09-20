set nocompatible
runtime macros/matchit.vim

filetype off
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
syntax on
filetype plugin indent on

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

set mouse=c
set directory=~/.tmp
set noerrorbells
set novisualbell
set magic

set fileencodings=utf-8,latin1
set encoding=utf-8
set termencoding=utf-8
set guifont=Terminus\ 8

set helplang=en
set history=200
set hlsearch
set incsearch
set sidescroll=1
set nowrap

set autoindent
set smartindent
set smarttab
set smartcase
set shiftwidth=4
set ts=4
set noexpandtab

set statusline=%F%m%r%h%w\ [Type:\ %Y]\ [Lines:\ %L\ @\ %p%%\ {%l;%v}]
set laststatus=2

set number
set showmode ruler

set wildmode=longest:full
set wildmenu

" make stuff more understandable
mat ExtraWhitespace /^\t\+\zs \+\| \+\zs\t\+/
set listchars=tab:·\ ,trail:░,extends:»,precedes:«
set list

" Conditional stuff
autocmd FileType lisp,ruby,yaml,javascript,haml,scss,mkd Indentation 2
autocmd FileType man,gitcommit,diff,mail set nolist

autocmd BufRead,BufNewFile *.rbuild set ft=ruby
autocmd BufRead,BufNewFile *.markdown set ft=markdown
autocmd BufRead,BufNewFile *.yml set ft=yaml
autocmd BufRead,BufNewFile *.asciidoc set ft=asciidoc
autocmd BufRead,BufNewFile *.asd set ft=lisp

autocmd BufRead,BufNewFile valgrind*.log set ft=valgrind

autocmd BufReadCmd *.docx,*.xlsx,*.pptx call zip#Browse(expand("<amatch>"))
autocmd BufReadCmd *.odt,*.ott,*.ods,*.ots,*.odp,*.otp,*.odg,*.otg call zip#Browse(expand("<amatch>"))

let c_no_curly_error   = 1
let g:localrc_filename = '.lvimrc'

" Commands
command -range=% Share silent <line1>,<line2>write !curl -s -F "sprunge=<-" http://sprunge.us | head -n 1 | tr -d '\r\n ' | xclip
command -nargs=1 Indentation silent set ts=<args> shiftwidth=<args>

" Mappings
nnoremap <C-T> :TlistAddFilesRecursive .<CR>:TlistSessionSave .session<CR>
nnoremap t :TlistToggle<CR>:TlistSessionLoad .session<CR>

map <C-C> :redraw!<CR>
imap <C-C> :redraw!<CR>

map <C-F> :mksession! .vim.session<CR>
imap <C-F> <C-O>:mksession! .vim.session<CR>

imap <C-z> <C-O>u<CR>
map <C-z> u<CR>
imap <C-y> <C-O><C-R><CR>
map <C-y> <C-R><CR>

imap <silent> <C-H> <C-O>h<CR>
imap <silent> <C-K> <C-O>k<CR>
imap <silent> <C-L> <C-O>l<CR>
imap <silent> <C-J> <C-O>j<CR>

map <silent> <PageUp> 1000<C-U>
map <silent> <PageDown> 1000<C-D>
imap <silent> <PageUp> <C-O>1000<C-U>
imap <silent> <PageDown> <C-O>1000<C-D>

map <C-W> <Nop>

" Tabs
map <silent> <C-T> :tabnew<CR>
map <silent> <C-W> :tabclose<CR>
map <silent> <kPageUp> :tabprevious<CR>
map <silent> <kPageDown> :tabnext<CR>
map <silent> <S-H> :tabprevious<CR>
map <silent> <S-L> :tabnext<CR>
imap <silent> <C-T> <C-O>:tabnew<CR>
imap <silent> <C-W> <C-O>:tabclose<CR>
imap <silent> <kPageUp> <C-O>:tabprevious<CR>
imap <silent> <kPageDown> <C-O>:tabnext<CR>
map <silent> <C-H> :tabfirst<CR>
imap <silent> <C-H> <C-O>:tabfirst<CR>

" Windows
map <silent> <C-Left> :wincmd h<CR>
map <silent> <C-Up> :wincmd k<CR>
map <silent> <C-Right> :wincmd l<CR>
map <silent> <C-Down> :wincmd j<CR>
map <silent> <C-H> :wincmd h<CR>
map <silent> <C-K> :wincmd k<CR>
map <silent> <C-L> :wincmd l<CR>
map <silent> <C-J> :wincmd j<CR>
map <silent> <C-+> :wincmd +<CR>
map <silent> <C--> :wincmd -<CR>

imap <silent> <C-Left> <C-O>:wincmd h<CR>
imap <silent> <C-Up> <C-O>:wincmd k<CR>
imap <silent> <C-Right> <C-O>:wincmd l<CR>
imap <silent> <C-Down> <C-O>:wincmd j<CR>
imap <silent> <C-+> :wincmd +<CR>
imap <silent> <C--> :wincmd -<CR>

" File handling
map N :NERDTreeToggle<CR>
map T :CommandT<CR>
map FT :CommandTFlush<CR>

" Syntastic
let g:syntastic_enable_signs = 1

" Other
set sr fo=roqm1 tw=72
im <C-B> <C-O>:setl sr! fo<C-R>=strpart("-+",&sr,1)<CR>=tc<CR>_<BS><Right>

"autocmd VimEnter * call Arpeggios()
function Arpeggios()
	Arpeggio inoremap jk <ESC>
	Arpeggio inoremap kl <CR>

	Arpeggio inoremap ui <BS>
	Arpeggio inoremap io <DEL>

	Arpeggio inoremap ji <C-O>^
	Arpeggio inoremap ko <C-O>$
endfunction
