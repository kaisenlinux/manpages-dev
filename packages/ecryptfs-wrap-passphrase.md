ecryptfs-wrap-passphrase(1)                                                              eCryptfs                                                              ecryptfs-wrap-passphrase(1)

NAME
       ecryptfs-wrap-passphrase - wrap an eCryptfs mount passphrase.

SYNOPSIS
       ecryptfs-wrap-passphrase [file]

       printf "%s\n%s" "passphrase to wrap" "wrapping passphrase" | ecryptfs-wrap-passphrase [file] -

DESCRIPTION
       ecryptfs-wrap-passphrase is a utility to wrap an eCryptfs mount passphrase, using a specified wrapping passphrase, and write the encrypted output to file.

SEE ALSO
       ecryptfs(7), ecryptfs-rewrap-passphrase(1), ecryptfs-unwrap-passphrase(1)

       /usr/share/doc/ecryptfs-utils/ecryptfs-faq.html

       http://ecryptfs.org/

AUTHOR
       This  manpage  was  written  by Dustin Kirkland <kirkland@ubuntu.com> for Ubuntu systems (but may be used by others).  Permission is granted to copy, distribute and/or modify this
       document under the terms of the GNU General Public License, Version 2 or any later version published by the Free Software Foundation.

       On Debian and Ubuntu systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

ecryptfs-utils                                                                          2008-07-21                                                             ecryptfs-wrap-passphrase(1)
