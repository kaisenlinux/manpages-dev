ecryptfs-unwrap-passphrase(1)                                                            eCryptfs                                                            ecryptfs-unwrap-passphrase(1)

NAME
       ecryptfs-unwrap-passphrase - unwrap an eCryptfs mount passphrase from file.

SYNOPSIS
       ecryptfs-unwrap-passphrase [file]

       printf "%s" "wrapping passphrase" | ecryptfs-unwrap-passphrase [file] -

DESCRIPTION
       ecryptfs-unwrap-passphrase is a utility to unwrap an eCryptfs mount passphrase from file, using a specified wrapping passphrase, and display the decrypted result on standard out.

SEE ALSO
       ecryptfs(7), ecryptfs-rewrap-passphrase(1), ecryptfs-wrap-passphrase(1)

       /usr/share/doc/ecryptfs-utils/ecryptfs-faq.html

       http://ecryptfs.org/

AUTHOR
       This  manpage  was  written  by Dustin Kirkland <kirkland@ubuntu.com> for Ubuntu systems (but may be used by others).  Permission is granted to copy, distribute and/or modify this
       document under the terms of the GNU General Public License, Version 2 or any later version published by the Free Software Foundation.

       On Debian and Ubuntu systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

ecryptfs-utils                                                                          2008-07-21                                                           ecryptfs-unwrap-passphrase(1)
