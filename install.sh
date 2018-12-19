#!/bin/bash
#
# Install symlink of ssh-askpass.sh to /usr/libexec/ssh-askpass

set -o errexit
set -o errtrace
set -o nounset

trap '_es=${?};
    _lo=${LINENO};
    _co=${BASH_COMMAND};
    echo "${0}: line ${_lo}: \"${_co}\" exited with a status of ${_es}";
    exit ${_es}' ERR

DEST=/usr/libexec/ssh-askpass
SRC="$(pwd)/ssh-askpass.sh"

# only install if there's nothing there, or it's a symlink
if [[ ! -e "${DEST}" ]] || [[ -L "${DEST}" ]]
then
    sudo ln -fns "${SRC}" "${DEST}"
else
    echo "ERROR: ${DEST} must be absent or a symlink for install" 1>&2
    ls -l ${DEST}
fi
