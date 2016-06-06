This repository contains my vim settings.

Setup:
```
cd
git clone git@github.com:wangzhen127/dotvim.git .vim
cd .vim
git submodule update --init   # Get Vundle.vim

ln -sf ~/.vim/vimrc ~/.vimrc    # Link vimrc
ln -sf ~/.vim/gvimrc ~/.gvimrc  # Link gvimrc
mkdir -p ~/.vim-tmp             # For backup and swap files
vim +PluginInstall +qall        # Install plugins

# ag --ignore currently seems to have problems. Use global ~/.agignore file.
echo .git >> ~/.agignore
echo .svn >> ~/.agignore
echo .hg >> ~/.agignore

cd bundle/YouCompleteMe
./install.py --clang-completer --tern-completer
cd ../../

# For quickopen, need to add the targe project to index from command line.
# See https://github.com/natduca/quickopen
```

For using [solarized color scheme](https://github.com/altercation/solarized) in terminals:
* Mac iTerm2: https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized
* Ubuntu GNOME Terminal:
  * https://github.com/seebi/dircolors-solarized
  * https://github.com/Anthony25/gnome-terminal-colors-solarized
  * https://github.com/seebi/tmux-colors-solarized

Config Solarized color scheme for Ubuntu GNOME Terminal:
```
rm ~/.solarized -rf
mkdir ~/.solarized

cd ~/.solarized
git clone https://github.com/seebi/dircolors-solarized
ln -sf ~/.solarized/dircolors-solarized/dircolors.256dark ~/.dircolors
eval `dircolors ~/.dircolors`

cd ~/.solarized
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./install.sh  # Choose dark color scheme.
```
