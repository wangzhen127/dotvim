" Use vundle: https://github.com/VundleVim/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" plugins on GitHub repo
Plugin 'rking/ag.vim'
" Plugin 'vim-scripts/argtextobj.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tmhedberg/matchit'
Plugin 'Valloric/MatchTagAlways'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'natduca/quickopen'
" Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'easymotion/vim-easymotion'
" Plugin 'terryma/vim-multiple-cursors'
Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'tpope/vim-repeat'
" Plugin 'tpope/vim-surround'
" Plugin 'tpope/vim-unimpaired'
" Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" ag.vim
nnoremap <leader>ag :Ag!

" ctrlp
map <leader>cp  :CtrlP
map <leader>cpb :CtrlPBuffer
map <leader>cpm :CtrlPMRU
map <leader>cpr :CtrlPRoot

if executable('ag')
  " Using ag will be faster. Use ~/.agignore to specify ignore patterns.
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
else
  let g:ctrlp_max_files = 0 " no limit of the number of files to scan
  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$' " ignore those files
endif
let g:ctrlp_match_window = 'bottom,order:ttb' " position and result order
let g:ctrlp_max_height = 20       " height of ctrlp window
let g:ctrlp_working_path_mode = 0 " use current working directory as search dir
let g:ctrlp_follow_symlinks = 1   " follow symlinks but ignore looped ones

" NERDTree
map <leader>nt  :NERDTree
map <leader>ntc :NERDTreeClose
map <leader>ntt :NERDTreeToggle
map <leader>ntf :NERDTreeFind

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
