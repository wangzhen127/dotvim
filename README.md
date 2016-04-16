This repository contains my vim settings.

```
cd
git clone git@github.com:wangzhen127/dotvim.git .vim
cd .vim
git submodule update --init  # Get Vundle.vim

ln -s ~/.vim/vimrc ~/.vimrc
vim +PluginInstall +qall     # Install plugins
```
