fuse-zip(1)                                                           FUSE filesystem to read and modify ZIP archives                                                          fuse-zip(1)

NAME
       fuse-zip - a FUSE filesystem for zip archives with write support

SYNOPSIS
       fuse-zip [options] zip-file mount-point

OPTIONS
       -h     print help

       -V     print version

       -r     open archive in read-only mode

       -o opt[,opt...]
              mount options (refer to mount.fuse(8) for details)

       -f     don't detach from terminal

       -d     turn on debugging, also implies -f

       If you want to specify character set conversion for file names in archive, use the following fusermount options:

         -omodules=iconv,from_code=$charset1,to_code=$charset2

       See FUSE documentation for details.

DESCRIPTION
       fuse-zip  is  a FUSE filesystem, that enables any program to work with a ZIP archive as though it is a plain directory.  Unlike KIO or Gnome VFS, it can be used in any application
       without modifications.

       Unlike other FUSE filesystems, only fuse-zip provides write support to ZIP archives.  Also, fuse-zip is faster that all known implementations on large archives with many files.

       Since version 0.3.0 fuse-zip has support for absolute and parent-relative paths in file names, but only in read-only mode (-r command line switch). Absolute  paths  are  displayed
       under "ROOT" directory, every ".." in path replaced by "UP" in directory name and "normal" files are placed under "CUR" directory.

       Support for UNIX file permissions and owner information has been added in version 0.4.0. See PERMISSIONS for details.

       Since version 0.5.0 fuse-zip forces open in read-only mode if archive file or its parent directory is not writable.

USAGE
       General usage would look like this

       1   mkdir /tmp/zipArchive
       2   fuse-zip foobar.zip /tmp/zipArchive
       3   (do something with the mounted file system)
       4   fusermount -u /tmp/zipArchive

       Be patient. Wait for fuse-zip process finish after unmounting, especially on a big archives.

PERMISSIONS
       Access check will not be performed unless -o default_permissions mount option is given.

FILES
       /var/log/user.log
              see this file in case any errors occur

SEE ALSO
       fusermount(1), mount.fuse(8).

LICENSE
       This is Free Software; this software is licensed under the GPL version 3, as published by the Free Software Foundation, or later.  There is NO warranty; not even for MERCHANTABIL‐
       ITY or FITNESS FOR A PARTICULAR PURPOSE.

AUTHORS
       Alexander Galanin <al@galanin.nnov.ru> http://galanin.nnov.ru/~al
       This manual page was originally written by Kirill Zaitsev <teferiincub@gmail.com>. Updated by Alexander Galanin.

FUSE filesystem to read and modify ZIP archives                                        December 2018                                                                           fuse-zip(1)
