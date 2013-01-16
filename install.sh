#!/bin/bash
set -o errexit
set -o errtrace
set -o nounset

trap '_es=${?};
    _lo=${LINENO};
    _co=${BASH_COMMAND};
    echo "${0}: line ${_lo}: \"${_co}\" exited with a status of ${_es}";
    exit ${_es}' ERR

dest=/usr/libexec/ssh-askpass
src="$(pwd)/ssh-askpass.sh"

if [[ ! -e "${dest}" ]] || [[ -L "${dest}" ]]
then
    sudo ln -fns "${src}" "${dest}"
else
    echo "${dest} must be absent or a symlink for install"
    ls -l ${dest}
fi
