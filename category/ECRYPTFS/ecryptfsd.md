ecryptfsd(8)                                                                             eCryptfs                                                                             ecryptfsd(8)

NAME
       ecryptfsd - user-space eCryptfs daemon.

DESCRIPTION
       ecryptfsd  is  a userspace daemon that runs as the user performing file operations under the eCryptfs mount point. It services public key requests from the eCryptfs kernel module;
       these requests are sent via /dev/ecryptfs on file open events. ecryptfsd only needs to be run when a mount is done with a public key module.

       The daemon can be started simply by running ecryptfsd. ecryptfsd will register itself with the kernel as the daemon that should service all eCryptfs filesystem requests done under
       the context of the user who runs the daemon.

SEE ALSO
       ecryptfs(7), ecryptfs-manager(8), mount.ecryptfs(8)

       /usr/share/doc/ecryptfs-utils/ecryptfs-faq.html

       http://ecryptfs.org/

AUTHOR
       This manpage was written by William Lima <wlima.amadeus@gmail.com> for the Ubuntu system (but may be used by others).  Permission is granted to copy, distribute and/or modify this
       document under the terms of the GNU General Public License, Version 2 or any later version published by the Free Software Foundation.

       On Debian and Ubuntu systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

ecryptfs-utils                                                                           May 2007                                                                             ecryptfsd(8)
