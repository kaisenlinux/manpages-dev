
ARCHIVEMOUNT(1)                                                             User Commands                                                            ARCHIVEMOUNT(1)

NAME
       archivemount - mounts an archive for access as a file system

SYNOPSIS
       archivemount [-hVdfs] [-o options] archivepath mountpoint

DESCRIPTION
       The  archivemount  command mounts the file tree contained in the archive archivepath on the directory mountpoint.  The archive's contents can subsequently be
       accessed inside mountpoint as a file system.  The umount(8) command performs the corresponding unmount operation.

       archivemount is known to work under both linux and Mac OS X (via MacFUSE).

EXAMPLE SESSION
       Consider the gzipped tar archive ``files.tgz'' containing files ``file1'' and ``file2'', and an empty directory ``mnt''.

       $ ls
       files.tgz    mnt/

       $ archivemount files.tgz mnt

       $ ls mnt
       file1    file2

       [... Perform desired read/write operations on the archive via mnt/ ...]

       $ umount mnt

       [... Any changes are saved to the archive ...]

ARCHIVE FORMATS
       Archive format support is provided by the libarchive(3) library.  Read operations are supported for:

              •      old-style tar archives,

              •      most variants of the POSIX ``ustar'' format,

              •      the POSIX ``pax interchange'' format,

              •      GNU-format tar archives,

              •      most common cpio archive formats,

              •      ISO9660 CD images (with or without RockRidge extensions),

              •      Zip archives.

       Archives compressed with gzip(1), bzip2(1), or compress(1) are automatically detected and transparently decompressed.

       The following formats can be written:

              •      POSIX-standard ``ustar'' archives,

              •      POSIX ``pax interchange format'' archives,

              •      POSIX octet-oriented cpio archives,

              •      two different variants of shar archives.

       Before writing, the original archive is renamed with a ``.orig'' extension appended to it.  More detail about the read/write support  can  be  found  in  the
       libarchive(3) documentation.

OPTIONS
       archivemount  is  built upon the FUSE (Filesystem in Userspace) library, and the complete set of available options depends upon the specific FUSE implementa‐
       tion.  Execute archivemount -h to retrieve a definitive list.

   general options
       -o opt,[opt...]
              mount options

       -h   --help
              print help

       -V   --version
              print version

   archivemount mount options
       -o readonly
              disable write support

       -o nobackup
              remove archive file backups

       -o subtree=<regex>
              mount only subtree of archive, strip subtree part from path

   FUSE mount options
       These options are available to linux users using standard FUSE.

       -d   -o debug
              enable debug output (implies -f)

       -f     foreground operation

       -s     disable multi-threaded operation

       -o allow_other
              allow access to other users

       -o allow_root
              allow access to root

       -o nonempty
              allow mounts over non-empty file/dir

       -o default_permissions enable permission checking by kernel

       -o fsname=NAME
              set filesystem name

       -o subtype=NAME
              set filesystem type

       -o large_read
              issue large read requests (2.4 only)

       -o max_read=N
              set maximum size of read requests

       -o hard_remove
              immediate removal (don't hide files)

       -o use_ino
              let filesystem set inode numbers

       -o readdir_ino
              try to fill in d_ino in readdir

       -o direct_io
              use direct I/O

       -o kernel_cache
              cache files in kernel

       -o [no]auto_cache
              enable caching based on modification times

       -o umask=M
              set file permissions (octal)

       -o uid=N
              set file owner

       -o gid=N
              set file group

       -o entry_timeout=T
              cache timeout for names (1.0s)

       -o negative_timeout=T
              cache timeout for deleted names (0.0s)

       -o attr_timeout=T
              cache timeout for attributes (1.0s)

       -o ac_attr_timeout=T
              auto cache timeout for attributes (attr_timeout)

       -o intr
              allow requests to be interrupted

       -o intr_signal=NUM
              signal to send on interrupt (10)

       -o modules=M1[:M2...]
              names of modules to push onto filesystem stack

       -o max_write=N
              set maximum size of write requests

       -o max_readahead=N
              set maximum readahead

       -o async_read
              perform reads asynchronously (default)

       -o sync_read
              perform reads synchronously

       -o atomic_o_trunc
              enable atomic open+truncate support

   MacFUSE mount options
       These options are available to Mac users using MacFUSE.

       -o allow_other
              allow access to others besides the user who mounted                             the file system

       -o allow_recursion
              allow a mount point that itself resides on a MacFUSE volume (by default, such mounting is disallowed)

       -o allow_root
              allow access to root (can't be used with allow_other)

       -o auto_xattr
              handle extended attributes entirely through ._ files

       -o blocksize=SIZE
              specify block size in bytes of "storage"

       -o case_insensitive
              enable case-insensitive mode

       -o daemon_timeout=T
              timeout in seconds for kernel calls to daemon

       -o debug
              turn on debug information printing

       -o default_permissions
              let the kernel handle permission checks locally

       -o defer_permissions
              defer permission checks to file operations themselves

       -o direct_io
              use alternative (direct) path for kernel-user I/O

       -o extended_security
              turn on Mac OS X extended security (ACLs)

       -o fsid=FSID
              set the second 32-bit component of the fsid

       -o fsname=NAME
              set the file system's name

       -o fssubtype=NUM
              set the file system's fssubtype identifier

       -o fstypename=NAME
              set the file system's type name

       -o iosize=SIZE
              specify maximum I/O size in bytes

       -o jail_symlinks
              contain symbolic links within the mount

       -o kill_on_unmount
              kernel will send a signal (SIGKILL by default) to the daemon after unmount finishes

       -o local
              mark the volume as ``local'' (default is ``nonlocal'')

       -o negative_vncache
              enable vnode name caching of non-existent objects

       -o volname=NAME
              set the file system's volume name

       -o noalerts
              disable all graphical alerts (if any) in MacFUSE Core

       -o noappledouble
              ignore Apple Double (._) and .DS_Store files entirely

       -o noapplexattr
              ignore all ``com.apple.*'' extended attributes

       -o nobrowse
              mark the volume as non-browsable by the Finder

       -o nolocalcaches
              meta option equivalent to noreadahead,noubc,novncache

       -o noping_diskarb
              do not ping Disk Arbitration (pings by default)

       -o noreadahead
              disable I/O read-ahead behavior for this file system

       -o nosynconclose
              disable sync-on-close behavior (enabled by default)

       -o nosyncwrites
              disable synchronous-writes behavior (dangerous)

       -o noubc
              disable the unified buffer cache for this file system

       -o novncache
              disable the vnode name cache for this file system

       -o hard_remove
              immediate removal (don't hide files)

       -o use_ino
              let filesystem set inode numbers

       -o readdir_ino
              try to fill in d_ino in readdir

       -o direct_io
              use direct I/O

       -o kernel_cache
              cache files in kernel

       -o [no]auto_cache
              enable caching based on modification times

       -o umask=M
              set file permissions (octal)

       -o uid=N
              set file owner

       -o gid=N
              set file group

       -o entry_timeout=T
              cache timeout for names (1.0s)

       -o negative_timeout=T
              cache timeout for deleted names (0.0s)

       -o attr_timeout=T
              cache timeout for attributes (1.0s)

       -o ac_attr_timeout=T
              auto cache timeout for attributes (attr_timeout)

       -o intr
              allow requests to be interrupted

       -o intr_signal=NUM
              signal to send on interrupt (30)

       -o modules=M1[:M2...]
              names of modules to push onto filesystem stack

       -o max_write=N
              set maximum size of write requests

       -o max_readahead=N
              set maximum readahead

       -o async_read
              perform reads asynchronously (default)

       -o sync_read
              perform reads synchronously

   Module options
       [subdir]

       -o subdir=DIR
              prepend this directory to all paths (mandatory)

       -o [no]rellinks
              transform absolute symlinks to relative

       [iconv]

       -o from_code=CHARSET
              original encoding of file names (default: UTF-8)

       -o to_code=CHARSET
              new encoding of the file names (default: ISO-8859-2)

LICENSE
       This sofware is free software; you can redistribute it and/or modify it under the terms of the GNU Library General Public License as published  by  the  Free
       Software Foundation; either version 2 of the License, or (at your option) any later version.

       This  software  is  distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
       FOR A PARTICULAR PURPOSE.  See the GNU Library General Public License for more details.

       You should have received a copy of the GNU Library General Public License along with this software; if not, write to the Free Software Foundation,  Inc.,  59
       Temple Place, Suite 330, Boston, MA  02111-1307  USA

KNOWN BUGS
       This is beta software and should be treated as such.  Bug reports to the AUTHORS listed below would be appreciated.

       archivemount is forced to run a single-thread mode for now. Support for stable multithreading is planned in a future release.

SEE ALSO
       bzip2(1), compress(1), cpio(1), gzip(1), libarchive(3), pax(1), tar(1), umount(8), and zip(1)

       ``Filesystem in Userspace'': http://fuse.sourceforge.net/

       ``MacFUSE'': http://code.google.com/p/macfuse/

AUTHORS
       Archivemount is written and maintained by Andre Landwehr <andrel@cybernoia.de>.

       This man page was written by Tom Duck <tom.duck@dal.ca> with material drawn from the page for libarchive(3).

ARCHIVEMOUNT version 0.8.7                                                 15 August 2013                                                            ARCHIVEMOUNT(1)
