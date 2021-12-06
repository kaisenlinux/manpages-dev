ecryptfs-add-passphrase(1)                                                               eCryptfs                                                               ecryptfs-add-passphrase(1)

NAME
       ecryptfs-add-passphrase - add an eCryptfs mount passphrase to the kernel keyring.

SYNOPSIS
       ecryptfs-add-passphrase [--fnek]

       printf "%s" "passphrase" | ecryptfs-add-passphrase [--fnek] -

DESCRIPTION
       ecryptfs-add-passphrase is a utility to manually add a passphrase to the kernel keyring.

       If the --fnek option is specified, the filename encryption key associated with the input passphrase will also be added to the keyring.

SEE ALSO
       ecryptfs(7), keyctl(1)

       /usr/share/doc/ecryptfs-utils/ecryptfs-faq.html

       http://ecryptfs.org/

AUTHOR
       This  manpage  was  written  by Dustin Kirkland <kirkland@ubuntu.com> for Ubuntu systems (but may be used by others).  Permission is granted to copy, distribute and/or modify this
       document under the terms of the GNU General Public License, Version 2 or any later version published by the Free Software Foundation.

       On Debian and Ubuntu systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

ecryptfs-utils                                                                          2008-07-21                                                              ecryptfs-add-passphrase(1)
