# Initialisierung eines Bare Git Rep für Dotfiles
# 
# curl -Lks http://bit.do/cfg-init | /bin/bash
# curl -Lks http://https://github.com/martinzimmer/dotfiles/blob/master/bin/dotfiles-init.sh | /bin/bash

git init --bare $HOME/.git-dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.git-dotfiles --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@git.aeschma.de:mz/dotfiles.git
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.git-dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

