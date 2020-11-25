#!/bin/bash

EXCLUDE=('.git' '.gitignore' 'setup.sh' '.setup.sh.swp')
LINKS=($(ls -A))

for i in ${!LINKS[@]}; do
	[[ ${EXCLUDE[@]} =~ ${LINKS[$i]} ]] && unset LINKS[$i]
done

for i in ${LINKS[@]}; do
	[[ -h ~/$i ]] && continue
	[[ -f ~/$i ]] && echo "File or directory already exists: $i" && continue
	echo "Creating symlink for $i"
	$(ln -sr $i ~/)
done

[[ -z $(which xclip) ]] && echo "Install xclip for tmux"
