# Initialisierung eines Bare Git Rep für Dotfiles
# 
# curl -Lks http://bit.do/cfg-init | /bin/bash



git init --bare $HOME/.git-dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.git-dotfiles --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@git.aeschma.de:mz/dotfiles.git
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.git-dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
