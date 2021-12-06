ecryptfs-mount-private(1)                                                                eCryptfs                                                                ecryptfs-mount-private(1)

NAME
       ecryptfs-mount-private - interactive eCryptfs private mount wrapper script.

SYNOPSIS
       ecryptfs-mount-private

DESCRIPTION
       ecryptfs-mount-private is a wrapper script for the mount.ecryptfs_private utility that will interactively prompt for the user's login password, if necessary.

FILES
       ~/.Private - underlying directory containing encrypted data

       ~/Private - mountpoint containing decrypted data (when mounted)

       ~/.ecryptfs/Private.sig - file containing signature of mountpoint passphrase

       ~/.ecryptfs/wrapped-passphrase - file containing the wrapped passphrase

       ~/.ecryptfs/wrapping-independent - this file exists if the wrapping passphrase is independent from login passphrase

SEE ALSO
       mount.ecryptfs_private(1), ecryptfs-umount-private(1)

       /usr/share/doc/ecryptfs-utils/ecryptfs-faq.html

       http://ecryptfs.org/

AUTHOR
       This  manpage and the ecryptfs-mount-private utility was written by Dustin Kirkland <kirkland@ubuntu.com> for Ubuntu systems (but may be used by others).  Permission is granted to
       copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 or any later version published by the Free Software Foundation.

       On Debian and Ubuntu systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

ecryptfs-utils                                                                          2008-11-13                                                               ecryptfs-mount-private(1)
