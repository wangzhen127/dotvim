" ==============================================================================
" Use vundle: https://github.com/VundleVim/Vundle.vim
" ==============================================================================

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" plugins on GitHub repo
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-scripts/mru.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Valloric/YouCompleteMe'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Customized plugin settings
map <C-n> :NERDTreeToggle<CR>

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
