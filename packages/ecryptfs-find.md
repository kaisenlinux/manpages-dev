ecryptfs-find(1)                                                                         eCryptfs                                                                         ecryptfs-find(1)

NAME
       ecryptfs-find - use inode numbers to match encrypted/decrypted filenames

SYNOPSIS
       ecryptfs-find cleartext-filename ecryptfs-find ECRYPTFS_FNEK_ENCRYPTED.fwBGx18a.UcYl18CF7VKLMSDuEadV

DESCRIPTION
       This program will attempt to match encrypted filenames to their decrypted counterpart, and attempt to match decrypted filenames to their encrypted counterpart.

       Notes:
        - the eCryptfs filesystem must be mounted in order to work
        - it uses ls(1) in order to determine the inode
        - it uses find(1) in order to locate the inode

SEE ALSO
       find(1), ls(1)

       http://ecryptfs.org/

AUTHOR
       This  manpage  was  written  by Dustin Kirkland <kirkland@ubuntu.com> for Ubuntu systems (but may be used by others).  Permission is granted to copy, distribute and/or modify this
       document under the terms of the GNU General Public License, Version 2 or any later version published by the Free Software Foundation.

       On Debian and Ubuntu systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

ecryptfs-utils                                                                          2012-01-24                                                                        ecryptfs-find(1)
