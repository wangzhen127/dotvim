This repository contains my vim settings.

```
cd
git clone git@github.com:wangzhen127/dotvim.git .vim
cd .vim
git submodule update --init   # Get Vundle.vim

ln -s ~/.vim/vimrc ~/.vimrc   # Link vimrc
mkdir -p ~/.vim-tmp           # For backup and swap files
vim +PluginInstall +qall      # Install plugins

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
