#!/bin/bash
#
# Add each configured IdentityFile via ssh-add -c to configure prompting
#
# Requirements:
#    1. each identity must be configured in ~/.ssh/config
#    2. each identity must have already been added via ssh-add -K
#    3. the ssh-askpass.sh script must have already been installed

# Loop through identities and add with confirmation
for _id in $(awk '/IdentityFile/ {print $2}' ~/.ssh/config)
do
    # Replace tilda with expanded path
    _id=${_id/\~/~}
    # Piping anything triggers invocation of ssh-askpass
    # (which does the heavy lifting)
    echo "# Use ssh-askpass.sh" | ssh-add -c ${_id}
done
