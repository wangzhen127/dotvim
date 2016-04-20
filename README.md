This repository contains my vim settings.

```
cd
git clone git@github.com:wangzhen127/dotvim.git .vim
cd .vim
git submodule update --init  # Get Vundle.vim

ln -s ~/.vim/vimrc ~/.vimrc
vim +PluginInstall +qall     # Install plugins

cd bundle/YouCompleteMe
./install.py --clang-completer --tern-completer
cd ../../

# ag --ignore currently seems to have problems. Use global ~/.agignore file.
echo .git >> ~/.agignore
echo .svn >> ~/.agignore
echo .hg >> ~/.agignore

mkdir -p ~/.vim-tmp         # for backup and swap files

# For quickopen, need to add the targe project to index from command line.
# See https://github.com/natduca/quickopen
```
