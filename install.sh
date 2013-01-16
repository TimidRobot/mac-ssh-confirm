#!/bin/bash
dest=/usr/libexec/ssh-askpass
src="$(pwd)/ssh-askpass.sh"

if [[ ! -e "${dest}" ]] || [[ -L "${dest}" ]]
then
    sudo ln -fns "${src}" "${dest}"
else
    echo "${dest} must be absent or a symlink for install"
    ls -l ${dest}
fi
