MKFS.NILFS2(8)                                                                    System Manager's Manual                                                                   MKFS.NILFS2(8)

NAME
       mkfs.nilfs2 - create a NILFS2 filesystem

SYNOPSIS
       mkfs  -t nilfs2 [ -b block-size ] [ -B blocks-per-segment ] [ -c ] [ -f ] [ -K ] [ -L volume-label ] [ -m reserved-segments-percentage ] [ -n ] [ -O feature[,...]  ] [ -h ] [ -q ]
       [ -v ] [ -V ] device

       mkfs.nilfs2 [ -b block-size ] [ -B blocks-per-segment ] [ -c ] [ -f ] [ -K ] [ -L volume-label ] [ -m reserved-segments-percentage ] [ -n ] [ -O feature[,...]  ] [ -h ] [ -q  ]  [
       -v ] [ -V ] device

DESCRIPTION
       mkfs.nilfs2  is used to create a nilfs2 filesystem (usually in a disk partition).  device is the special file corresponding to the device (e.g.  /dev/sdXX). Usually mkfs.nilfs2 is
       invoked from the mkfs(8) front-end program.

       The exit code returned by mkfs.nilfs2 is 0 on success and 1 on failure.

OPTIONS
       -b block-size
              Specify the size of blocks in bytes.  The valid block size is 1024, 2048, 4096, 8192 bytes, ..., and the maximum block size is restricted to the system page size.  For most
              machines, it is 4096 bytes.  The default block size is 4096 bytes.

       -B blocks-per-segment
              Specify the number of blocks in a segment, where the segment (also called full segment) is an allocation unit of disk space of NILFS.  This parameter gives the size of seg‐
              ment and consequently determines how many segments are aligned in the specified device.  The default number of blocks per segment is 2048 (= 8MB with 4KB blocks).

       -c     Check the device for bad blocks before building the filesystem.

       -f     Force overwrite when an existing filesystem is detected on the device.  By default, mkfs.nilfs2 will not write to the device if it suspects  that  there is a filesystem  on
              the device already.

       -h     Display help message and exit.

       -K     Keep, do not attempt to discard blocks at mkfs time (discarding blocks initially is useful on solid state drives and sparse / thinly-provisioned storage).

       -L new-volume-label
              Set the volume label for the filesystem to new-volume-label.  The maximum length of the volume label is 80 bytes.

       -m reserved-segments-percentage
              Specify the percentage of the segments reserved for garbage collection.  The default percentage is 5%.

       -n     Cause mkfs.nilfs2 to not actually create a filesystem, but display what it would be do if it were to create a filesystem.

       -O feature[,...]
              Create a filesystem with the given features (filesystem options), overriding the default filesystem options.

              The  filesystem  feature  set  is comprised of a list of features, separated by commas, that are to be enabled.  To disable a feature, simply prefix the feature name with a
              caret ('^') character.  The pseudo-filesystem feature "none" will clear all filesystem features.

              block_count
                     Enable block count per checkpoint.

       -q     Quiet execution.  Useful if mkfs.nilfs2 is run in a script.

       -v     Verbose execution.

       -V     Print the version number of mkfs.nilfs2 and exit.

AUTHOR
       This version of mkfs.nilfs2 has been written by Ryusuke Konishi <konishi.ryusuke@gmail.com>.

AVAILABILITY
       mkfs.nilfs2 is part of the nilfs-utils package and is available from https://nilfs.sourceforge.io.

SEE ALSO
       nilfs(8), mkfs(8), badblocks(8).

nilfs-utils version 2.2                                                                  Apr 2014                                                                           MKFS.NILFS2(8)
