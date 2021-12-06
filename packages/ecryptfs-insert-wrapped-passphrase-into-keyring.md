ecryptfs-insert-wrapped-passphrase-into-keyring(1)                                       eCryptfs                                       ecryptfs-insert-wrapped-passphrase-into-keyring(1)

NAME
       ecryptfs-insert-wrapped-passphrase-into-keyring - unwrap a wrapped passphrase from file and insert into the kernel keyring.

SYNOPSIS
       ecryptfs-insert-wrapped-passphrase-into-keyring [file]

       printf "%s" "wrapping passphrase" | ecryptfs-insert-wrapped-passphrase-into-keyring [file] -

DESCRIPTION
       ecryptfs-insert-wrapped-passphrase-into-keyring is a utility to manually unwrap a passphrase from a file, and insert the unwrapped passphrase into the kernel keyring.

SEE ALSO
       ecryptfs(7), keyctl(1)

       /usr/share/doc/ecryptfs-utils/ecryptfs-faq.html

       http://ecryptfs.org/

AUTHOR
       This  manpage  was  written  by Dustin Kirkland <kirkland@ubuntu.com> for Ubuntu systems (but may be used by others).  Permission is granted to copy, distribute and/or modify this
       document under the terms of the GNU General Public License, Version 2 or any later version published by the Free Software Foundation.

       On Debian and Ubuntu systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

ecryptfs-utils                                                                          2008-07-21                                      ecryptfs-insert-wrapped-passphrase-into-keyring(1)
