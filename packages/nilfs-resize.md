NILFS-RESIZE(8)                                                                     System Manager's Manual                                                                     NILFS-RESIZE(8)

NAME
       nilfs-resize - resize NILFS file system volume size

SYNOPSIS
       nilfs-resize [options] device [size]

DESCRIPTION
       The  nilfs-resize  program  will resize NILFS2 file systems.  It can be used to enlarge or shrink a mounted file system located on device.  This feature is only available on the kernel
       supporting on-line resizing.  Resizing for unmounted file systems are not supported at present.

       The size parameter specifies the requested new size of the filesystem.  The size of the filesystem may never be larger than the size of the partition.  Optionally, the  size  parameter
       may  be  suffixed by one of the following units designators: ´s´, ´K´, ´M´, ´G´, or ´T´, for 512 byte sectors, kilobytes, megabytes, gigabytes, or terabytes, respectively.  If size pa‐
       rameter is not specified, it will default to the size of the partition.

       This program does not manipulate the size of partitions.  If you wish to enlarge a filesystem, you must make sure you can expand the size of the underlying partition first.   This  can
       be done using fdisk(8) by deleting the partition and recreating it with a larger size or using lvextend(8), if you are using the logical volume manager lvm(8)

       If  you  wish to shrink a nilfs2 partition, first use nilfs-resize to shrink the size of filesystem.  Then you may use fdisk(8) to shrink the size of the partition.  When shrinking the
       size of the partition, make sure you do not make it smaller than the new size of the nilfs2 filesystem.

       This command is valid only for mounted NILFS2 file systems, and will fail if the device has no active mounts.

OPTIONS
       -y, --yes, --assume-yes
              Assume Yes to all queries and do not prompt.

       -h, --help
              Display help message and exit.

       -v, --verbose
              Verbose mode.

       -V, --version
              Display version and exit.

AUTHOR
       Ryusuke Konishi <konishi.ryusuke@gmail.com>

AVAILABILITY
       nilfs-resize is part of the nilfs-utils package and is available from https://nilfs.sourceforge.io.

SEE ALSO
       nilfs(8), nilfs-tune(8), fdisk(8), lvextend(8), lvm(8).

nilfs-utils version 2.2                                                                     Apr 2014                                                                            NILFS-RESIZE(8)
