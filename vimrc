set nocompatible
let mapleader='\'               " explicitly define <leader> as \

source ~/.vim/vundle_config.vim " Use vundle configurations first.

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
set showcmd		                  " show incomplete commands
set number                      " show line numbers
" highlight last inserted text
nnoremap gV `[v`]

set tabstop=2                   " number of visual spaces per tab
set softtabstop=2               " number of spaces in tab when editing
set expandtab                   " tabs are spaces
set shiftwidth=2                " number of spaces when indent or unindent
set autoindent                  " auto indent
set smartindent                 " smart indent

syntax enable                   " enable syntax highlighting
set cursorline                  " highlight cursor line
highlight clear CursorLineNr    " not highlight line number
set showmatch                   " highlight matching [{()}]
set matchtime=2                 " Tenths of seconds to show the match
let c_comment_strings=1         " highlight strings inside C comments

set laststatus=2                " always show status line
set statusline+=%{getcwd()}     " show current working directory
set statusline+=%=              " separator
set statusline+=%l,%c\ %t       " show cursor posion and file name

set foldenable                  " enable folding
set foldcolumn=1                " add 1 column to indicate folds
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

set writebackup   " enable backup before overwriting a file
set backup        " enable backup after overwriting a file
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp   " dir for backup files
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp   " dir for swap files
set backupskip=/tmp/*,/private/tmp/*                  " skip backup for those

let &colorcolumn="80,".join(range(120,999),",") " 80 and 120 coloum markers

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*~,*.pyc

" ctrl-u and ctrl-w cannot be undone. Use ctrl-g u to first break undo
" sequence and start new change, so that you can undo ctrl-u and ctrl-w.
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Treat long wrapped lines as multiple lines
map j gj
map k gk

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
  autocmd BufReadPost * :call <SID>JumpToLastKnownCursorPosition()
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
function! <SID>JumpToLastKnownCursorPosition()
  if line("'\"") >= 1 && line("'\"") <= line("$") |
    exe "normal! g`\"" |
  endif
endfunction

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
  " save last search & cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction

