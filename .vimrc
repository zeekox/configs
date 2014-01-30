" based on http://nvie.com/posts/how-i-boosted-my-vim/

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup fedora
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

" Use pathogen to easily modify the runtime path to include all
" " plugins under the ~/.vim/bundle directory
"call pathogen#helptags()
"call pathogen#runtime_append_all_bundles()

" hide buffers
set hidden

set wrap        " don't wrap lines
set tabstop=2     " a tab is X spaces
set shiftwidth=2  " number of spaces to use for autoindenting
set noexpandtab
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
"set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      "highlight search terms
set incsearch     "show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile
set clipboard=unnamedplus

" don't warn when modification in invisible buffer
"set hidden

":hi LineNr ctermfg=darkgrey ctermbg=black

filetype plugin indent on

if &t_Co >= 256 || has("gui_running")
   colorscheme zenburn
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.

autocmd filetype html,xml set listchars-=tab:>.

set pastetoggle=<F2>

set mouse=a

vmap Q gq
nmap Q gqap

nma qa :qa!<CR>
nmap qw :w!<CR>

:imap <c-space> <c-n>
:imap <c-s-space> <c-p>

" fix keys in termital, use 'od -a' to get key send 
map <ESC>^[[D <C-Left>
map <ESC>^[[C <C-Right>

" tab navigation
nmap <C-S-tab> :tabprevious<cr>
nmap <C-tab> :tabnext<cr>
nmap <C-t> :tabnew<cr>
map <C-t> :tabnew<cr>
map <C-S-tab> :tabprevious<cr>
map <C-tab> :tabnext<cr>
"map <C-w> :tabclose<cr>
imap <C-S-tab> <ESC>:tabprevious<cr>i
imap <C-tab> <ESC>:tabnext<cr>i
nmap <C-t> <ESC>:tabnew<cr>

" to append after closing tag
" '<,'>s/<\/.\{-}>/&\\/

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>w :w<CR>
map <leader>p :pu<CR>
vmap <leader>y "+y
map <leader>e :FufFile **/<CR>
map <leader>t :tabnew <bar> FufFile **/<CR>
map <leader>gf :tabe <cfile><cr>
map <leader>f mzgg=G`z<CR>

" use % to jump to end tag
source $VIMRUNTIME/macros/matchit.vim

" close tags
autocmd Filetype html,xml,xsl,jsp,js,txt source ~/.vim/plugin/closetag.vim

"call pathogen#infect() 

" Remove menu bar
set guioptions-=m

" Remove toolbar
set guioptions-=T

" js
let g:JSHintHighlightErrorLine = 0

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=3 sw=3 sts=0 noexpandtab
