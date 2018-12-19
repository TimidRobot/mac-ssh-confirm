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
ES=1

# Test input to determine mode
if [[ "${1}" =~ ^Enter\ passphrase\ for ]]
then
    #### Provide key when invoked as "Enter Passphrase for IDENTITY_PATH: "
    # Isolate identity path
    ID=${1#*for }
    ID=${id%: }
    # Query Keychain for password
    security -q find-generic-password -a ${id} -w
    ES=${?}
else
    #### Prompt user to allow access to IDENTITY
    RESULT=$(osascript -e "
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
    if [[ "${RESULT}" == 'button returned:Allow' ]]
    then
        ES=0
    fi
fi
exit ${ES}
