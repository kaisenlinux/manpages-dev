FATRESIZE(1)                                                                      General Commands Manual                                                                     FATRESIZE(1)

NAME
       fatresize —     Resize an FAT16/FAT32 volume non-destructively

SYNOPSIS
       fatresize [-s SIZE]  [device]

DESCRIPTION
       This manual page documents briefly the fatresize

       This manual page was written for the Debian distribution because the original program does not have a manual page.

OPTIONS
       These  programs  follow  the usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options is included below.  For a complete description,
       see the Info files.

       -h           --help
                 Show summary of options.

       -s           --size
                 Resize volume to SIZE[k|M|G|ki|Mi|Gi] bytes or "max"

       -i           --info
                 Show volume information

       -p           --progress
                 Show progress

       -q           --quiet
                 Be quiet

       -v           --verbose
                 Verbose (not version)

EXAMPLES
       fatresize -s 2G /dev/evms/hdb2

       fatresize -q -s max /dev/hde6

       fatresize -i /dev/hdg3

       Size and device is required to run.  You can resize device-mapped partitions, e.g. EVMS partitions.

BUGS
       You can't resize FAT32 partition lesser than 512Mb because Windows(R) doesn't work properly with small FAT32 file system. Use FAT16.

AUTHOR
       This manual page was written by Philippe Coval rzr@gna.org for the Debian system (but may be used by others).  Permission is granted to copy, distribute and/or modify  this  docu‐
       ment under the terms of the GNU General Public License, Version 3 any later version published by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL-3.

                                                                                                                                                                              FATRESIZE(1)
