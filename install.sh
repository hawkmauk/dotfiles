# Copy dotfiles
for dotfile in .vimrc .inputrc
do
        source=$(pwd)/${dotfile}
        target=${HOME}/${dotfile}

        # backup target if it exists
	echo "checking for existing [${target}]"
        if [ -f "${target}" ]; then
		echo "backup existing"
                mv ${target} ${target}_$(date +%s)
        fi
        
        # create the link to the dotfile
        ln -s ${source} ${target}
done

# Check that vundle plugin manager has been installed

VUNDLE_DIR=~/.vim/bundle/Vundle.vim

echo "Checking for Vundle install at ${VUNDLE_DIR}"

if [ ! -d ${VUNDLE_DIR} ]; then
    echo "Installing vundle to ${VUNDLE_DIR}"
    git clone https://github.com/VundleVim/Vundle.vim.git ${VUNDLE_DIR}
fi

