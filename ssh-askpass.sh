#!/bin/bash
#
# Mac OS X ssh-askpass script
#
# This script has two modes:
#    1. Automatically provide password to ssh-add using the security command
#    2. Prompt user to allow access to a key provided by the ssh-agent
#       (a key that was added via ssh-add -c)

set -o errexit
set -o errtrace
set -o nounset

trap '_es=${?};
    _lo=${LINENO};
    _co=${BASH_COMMAND};
    echo "${0}: line ${_lo}: \"${_co}\" exited with a status of ${_es}";
    exit ${_es}' ERR

# Default exit status is 1 (failure)
es=1

# Test input to determine mode
if [[ "${1}" =~ ^Enter\ passphrase\ for ]]
then
    #### Provide key when invoked as "Enter Passphrase for IDENTITY_PATH: "
    # Isolate identity path
    id=${1#*for }
    id=${id%: }
    # Query Keychain for password
    security -q find-generic-password -a ${id} -w
    es=${?}
else
    #### Prompt user to allow access to IDENTITY
    result=$(osascript -e "
    on GetCurrentApp()
        tell application \"System Events\"
            set _app to item 1 of (every process whose frontmost is true)
            return name of _app
        end tell
    end GetCurrentApp

    set _app to GetCurrentApp()

    tell application _app
        display dialog \"${1}\" ¬
            buttons { \"Deny\", \"Allow\"} ¬
            default button 2 cancel button 1 ¬
            with title \"SSH AskPass\" with icon caution
    end tell
    ")

    # Return successful exit status if allowed
    if [[ "${result}" == 'button returned:Allow' ]]
    then
        es=0
    fi
fi

exit ${es}
