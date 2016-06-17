set nocompatible
let mapleader='\'               " explicitly define <leader> as \

source ~/.vim/vundle_config.vim " Use vundle configurations first.

syntax enable                   " enable syntax highlighting
set background=dark             " use dark background
colorscheme solarized           " use solarized color scheme

" The special char does not work on Chrome remote desktop and virtual box.
" set list                        " display special characters
" set listchars=space:·,tab:·\ ,trail:·,extends:»,precedes:« " eol:$

set cursorline                  " highlight cursor line
set laststatus=2                " always show status line
set statusline+=%{getcwd()}     " show current working directory
set statusline+=%=              " separator
set statusline+=%p%%\ %l,%c\ %t " show cursor posion and file name
let &colorcolumn="80,".join(range(100,999),",") " 80 and 100 coloum markers

filetype plugin indent on       " enable file type detections
set autoread                    " auto read again if changed outside of vim
set hidden                      " allow unwritten file in hidden buffer

set fileformats=unix,dos,mac    " set file format preference
set encoding=utf8               " set utf8 as the standard encoding
set backspace=indent,eol,start  " backspace over everything in insert mode
set wildmode=longest,list       " autocomplete command and list command matches
set history=1000                " keep 1000 lines of command line history
set scrolloff=7                 " number of lines above and below the cursor
set lazyredraw                  " redraw only when we need to
set number                      " show line numbers
set showcmd		                  " show incomplete commands
set showmatch                   " highlight matching [{()}]
set matchtime=2                 " Tenths of seconds to show the match
" highlight last inserted text
nnoremap gV `[v`]

set tabstop=2                   " number of visual spaces per tab
set softtabstop=2               " number of spaces in tab when editing
set expandtab                   " tabs are spaces
set shiftwidth=2                " number of spaces when indent or unindent
set autoindent                  " auto indent
set smartindent                 " smart indent

set foldenable                  " enable folding
set foldnestmax=10              " 10 nested fold max
set foldmethod=indent           " fold based on indent level
set foldlevelstart=10           " open most folds by default
" use space to open/close folds
nnoremap <space> za

set ignorecase                  " ignore case in search patterns
set smartcase                   " do not ignore case if there is upper case
set incsearch                   " do incremental searching
set hlsearch                    " highlight search matches
" turn off search highlight with \<space>
nnoremap <leader><space> :nohlsearch<CR>

" customize format
nnoremap <leader>f :Format<CR>

set writebackup   " enable backup before overwriting a file
set backup        " enable backup after overwriting a file
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp   " dir for backup files
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp   " dir for swap files
set backupskip=/tmp/*,/private/tmp/*                  " skip backup for those

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*~,*.pyc

" ctrl-u and ctrl-w cannot be undone. Use ctrl-g u to first break undo
" sequence and start new change, so that you can undo ctrl-u and ctrl-w.
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Treat long wrapped lines as multiple lines
nnoremap j gj
nnoremap k gk

" Better window navigation
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

" Disable arrow keys
noremap <up>    <nop>
noremap <down>  <nop>
noremap <left>  <nop>
noremap <right> <nop>

if has('mouse')
  set mouse=a " enable mouse
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has("autocmd")
  autocmd VimEnter * silent! lcd %:p:h " auto change cwd to startup file dir
  autocmd BufReadPost * call <SID>JumpToLastKnownCursorPosition()
  autocmd BufWritePre * call <SID>TrimTrailingEmptyLinesAndSpaces()
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
function! <SID>JumpToLastKnownCursorPosition()
  if line("'\"") >= 1 && line("'\"") <= line("$") |
    exe "normal! g`\"" |
  endif
endfunction

" Trim trailing empty lines at the end of file and spaces at the end of line.
" This is called on buffer write.
function! <SID>TrimTrailingEmptyLinesAndSpaces()
  " save last search & cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")

  " trim trailing empty lines
  let lines = line('$')
  let done = 0
  " loop so that we can also delete trailing lines consisting of only whitespace
  while !done
    " erase last line if it's only whitespace
    %s/^\s*\%$//e

    " erase trailing blank lines
    %s/\n*\%$/\r/e
    %s/\n*\%$//e

    " if we actually did anything, assume that we have more to do
    let done = lines == line('$')
    let lines = line('$')
  endwhile

  " trim trailing spaces
  %s/\s\+$//e

  " restore last search & cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Clang format
function! <SID>Format()
  write
  silent !clang-format -i -style=google %
  edit
  redraw!
  nohlsearch
endfunction
command! Format call <SID>Format()
