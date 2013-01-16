Overview
========

One way to help protect against `SSH Agent Hijacking`_ is by confirming each
use of the of the decrypted identities managed by ``ssh-agent``.

These tools allow confirmation while (still) meeting the following objectives:

- Password protected SSH identities
- SSH identity passwords stored in Mac OS X Keychain
- Absolute minimum install:

  - Do not overwrite or replace executables
  - Do not require compiling or Xcode

Additionally, configuration SSH to use ``ControlMaster`` connections, will
keep thinks easy.

.. _SSH Agent Hijacking:
   http://www.clockwork.net/blog/2012/09/28/602/ssh_agent_hijacking


Installation
============

1. Symlink ``ssh-askpass.sh`` to ``/usr/libexec/ssh-askpass``.
   (The ``install.sh`` script does this.)
2. It may be convenient to put ``ssh_add_confirm_ids.sh`` in your PATH.


Use
===

1. Add identities to your Mac OS X Keychain via ``ssh-add -K``
2. Prior to connecting to any hosts, execute ``ssh_add_confirm_ids.sh``

   - In the interest of security, do **not** Always Allow security access to
     your keychain

3. Repeat the step above each time you log into your Mac


Inspiration
===========

- `And now Chicken of the VNC tunneled through SSH on OS X`_ (includes
  ``macos-askpass``, An SSH_ASKPASS command for MacOS X)
- `Making OpenSSH on Mac OS X More Secure`_
- `Get Current Application with AppleScript`_

.. _And now Chicken of the VNC tunneled through SSH on OS X:
   https://blogs.oracle.com/mock/entry/and_now_chicken_of_the
.. _Making OpenSSH on Mac OS X More Secure:
   https://jcs.org/notaweblog/2011/04/19/making_openssh_on_mac_os_x_more_secure/
.. _Get Current Application with AppleScript:
   http://vanderbrew.com/blog/2010/02/15/get-current-application-with-applescript/


License
=======

mac-ssh-confirm is licensed under the `BSD 2-Clause License <http://www.opensource.org/licenses/BSD-2-Clause>`_: ::

    Copyright (c) 2013, Tim Zehta
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    - Redistributions of source code must retain the above copyright notice,
      this list of conditions and the following disclaimer.
    - Redistributions in binary form must reproduce the above copyright notice,
      this list of conditions and the following disclaimer in the documentation
      and/or other materials provided with the distribution.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
    AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
    IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
    ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
    LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
    CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
    SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
    INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
    CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
    ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.
