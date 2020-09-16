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
