if command -v bat > /dev/null
then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi
