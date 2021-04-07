FUSEISO(1)                                                                        General Commands Manual                                                                       FUSEISO(1)

NAME
       fuseiso - FUSE module to mount ISO filesystem images

SYNOPSIS
       fuseiso [options] <ISO image> <mount point> [FUSE library options]

DESCRIPTION
       This manual page documents briefly the fuseiso command.

       fuseiso provides a module to mount ISO filesystem images using FUSE.

       With FUSE it is possible to implement a fully functional filesystem in a userspace program.

       fuseiso can read ISO, BIN and NRG images containing ISO9660 filesystems.  Along with it, it supports some common extensions, like Joliet, RockRidge and zisofs.

       It  also  supports  non-standard images, like CloneCD's IMGs and Alcohol 120%'s MDFs, as their format looks exactly like BIN images. One major limitation of BIN images is that fu‐
       seiso does not handle CUE files in any way, and thus can only work with the first track of those images.

       Other formats like CCD and MDS are not supported, since their format is not public and no one knows it.

OPTIONS
       -n     Do not maintain ~/.mtab.fuseiso.

       -p     Maintain mount point, create it if it doesn't exist and delete it on exit.

       -c iocharset
              Specify iocharset for Joliet filesystems.

       -h     Prints an help screen.

Common FUSE library options
       -f     Run in foreground, do not daemonize.

       -d     Run in foreground and print debug information.

       -s     Run single-threaded.

SEE ALSO
       fusermount(1),

AUTHOR
       fuseiso was written by Dmitry Morozhnikov <dmiceman@mail.ru>.

       This manual page was written by David Paleino <dapal@debian.org>, for the Debian project (and may be used by others).

                                                                                       February 2010                                                                            FUSEISO(1)
