Overview
========

These tools allow me to activate confirmation of SSH agent identities while
meeting the following objectives:

- Password protected SSH identities
- SSH identity passwords stored in Mac OS X Keychain
- Absolute minimum install:
  - Do not overwrite or replace executables
  - Do not require compiling or Xcode


Installation
============

1. Symlink ``ssh-askpass.sh`` to ``/usr/libexec/ssh-askpass``.
   (The ``install.sh`` script does this.)
2. It may be convenient to put ``ssh_add_confirm_ids.sh`` in your ``PATH``.


Use
===

1. Add identities to your Mac OS X Keychain via ``ssh-add -K``
2. Prior to connecting to any hosts, execute ``ssh_add_confirm_ids.sh``

   - In the interest of security, do **not** Always Allow security access to
     your keychain

3. Repeat step 3 each time you log into your Mac


Inspiration
===========

- `And now Chicken of the VNC tunneled through SSH on OS X (Joe Mocker's Weblog) <https://blogs.oracle.com/mock/entry/and_now_chicken_of_the>`_ (includes `macos-askpass`, An SSH_ASKPASS command for MacOS X)
- `joshua stein: Making OpenSSH on Mac OS X More Secure <https://jcs.org/notaweblog/2011/04/19/making_openssh_on_mac_os_x_more_secure/>`_
- `Get Current Application with AppleScript » Vanderbrew - The shared bits <http://vanderbrew.com/blog/2010/02/15/get-current-application-with-applescript/>`_


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
