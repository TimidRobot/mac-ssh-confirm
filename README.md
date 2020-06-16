# mac-ssh-confirm


## Overview

One way to help protect against [SSH Agent Hijacking][hijacking] is by
confirming each use of the of the decrypted identities managed by `ssh-agent`.

These tools allow confirmation while (still) meeting the following objectives:

- Password protected SSH identities
- SSH identity passwords stored in Mac OS X Keychain
  - Passwords do not need to be entered again and again.
- Absolute minimum install:
  - Do not overwrite or replace executables
  - Do not require compiling or Xcode

This is a useful hack. More useful would be development by Apple to support
SSH Agent confirmations.

Additional helper utilities:
- **[cmc][cmc]**: ControlMaster Controller - Eases management of SSH
  ControlMaster connections.
- **[solo-agent][soloagent]**: Enable discrete SSH Agents to avoid leaking
  access across hosts


[hijacking]:http://www.clockwork.net/blog/2012/09/28/602/ssh_agent_hijacking
[cmc]:https://github.com/TimidRobot/cmc
[soloagent]:https://github.com/TimidRobot/solo-agent


## Installation

1. macOS no longer comes with X11. Unless you have an old release,
   [XQuartz][xquartz] is required ([#1][issue1]).
2. Symlink `ssh-askpass.sh` to `/usr/libexec/ssh-askpass`.
   (The `install.sh` script does this.)
3. It may be convenient to put `ssh_add_confirm_ids.sh` in your PATH.

[xquartz]:https://xquartz.macosforge.org/landing/
[issue1]:https://github.com/TimidRobot/mac-ssh-confirm/issues/1


## Use

1. Add identities to your Mac OS X Keychain via `ssh-add -K`
2. Prior to connecting to any hosts, execute `ssh_add_confirm_ids.sh`
   - In the interest of security, do **not** Always Allow security access to
     your keychain
3. Repeat the step above each time you log into your Mac

To clear existing identities in the agent and load configured identies to
require confirmation:
- `ssh-add -D; ssh_add_confirm_ids.sh`

To clear existing identities in the agent and load identities saved in your
keychain **without** the need to confirm access:
- `ssh-add -D; ssh-add -k`


## Inspiration

- [And now Chicken of the VNC tunneled through SSH on OS X][chicken] (includes
  `macos-askpass`, a SSH_ASKPASS command for Mac OS X)
- [Making OpenSSH on Mac OS X More Secure][moresecure]
- [Get Current Application with AppleScript][applescript]


[chicken]:https://blogs.oracle.com/mock/entry/and_now_chicken_of_the
[moresecure]:https://jcs.org/notaweblog/2011/04/19/making_openssh_on_mac_os_x_more_secure/
[applescript]:http://vanderbrew.com/blog/2010/02/15/get-current-application-with-applescript/


## License

- [`LICENSE`](LICENSE) (Expat/[MIT][mit] License)

[mit]: http://www.opensource.org/licenses/MIT "The MIT License | Open Source Initiative"
