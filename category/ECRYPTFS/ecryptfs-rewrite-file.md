ecryptfs-rewrite-file(1)                                                                 eCryptfs                                                                 ecryptfs-rewrite-file(1)

NAME
       ecryptfs-rewrite-file - force a file to be rewritten (reencrypted) in the lower filesystem

SYNOPSIS
       ecryptfs-rewrite-file [file1] [file2] [file3] ...

DESCRIPTION
       This script takes one or more files/directories/symlinks as arguments, moves each of them to a temporary file, and then moves them back to the original name.  This causes the file
       to be rewritten (and reencrypted) in the lower filesystem.

       This script may be combined with find(1) and xargs(1) to rewrite an entire eCryptfs mountpoint, unmount, and sync:

         find . -xdev -print0 | xargs -r -0 /usr/bin/ecryptfs-rewrite-file
         ecryptfs-umount-private
         sync

       It is advised that this script is executed in runlevel 1 or 3, to avoid simultanteous writes and race conditions with targeted files.

       USING THIS SCRIPT WHILE GNOME, KDE, OR OTHER APPLICATIONS ARE RUNNING MAY CAUSE DATA LOSS.

SEE ALSO
       find(1), xargs(1), ecryptfs-umount-private(1), sync(1)

       http://ecryptfs.org/

AUTHOR
       This manpage was written by Dustin Kirkland <kirkland@ubuntu.com> for Ubuntu systems (but may be used by others).  Permission is granted to copy,  distribute  and/or  modify  this
       document under the terms of the GNU General Public License, Version 2 or any later version published by the Free Software Foundation.

       On Debian and Ubuntu systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

ecryptfs-utils                                                                          2009-03-20                                                                ecryptfs-rewrite-file(1)
