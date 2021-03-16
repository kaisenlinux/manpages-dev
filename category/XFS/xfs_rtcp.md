xfs_rtcp(8)                                                            System Manager's Manual                                                           xfs_rtcp(8)

NAME
       xfs_rtcp - XFS realtime copy command

SYNOPSIS
       xfs_rtcp [ -e extsize ] [ -p ] source ... target
       xfs_rtcp -V

DESCRIPTION
       xfs_rtcp  copies a file to the realtime partition on an XFS filesystem.  If there is more than one source and target, the final argument (the target) must be
       a directory which already exists.

OPTIONS
       -e extsize
              Sets the extent size of the destination realtime file.

       -p     Use if the size of the source file is not an even multiple of the block size of the destination filesystem. When -p is specified xfs_rtcp will pad the
              destination  file to a size which is an even multiple of the filesystem block size.  This is necessary since the realtime file is created using direct
              I/O and the minimum I/O is the filesystem block size.

       -V     Prints the version number and exits.

SEE ALSO
       xfs(5), mkfs.xfs(8), mount(8).

CAVEATS
       Currently, realtime partitions are not supported under the Linux version of XFS, and use of a realtime partition WILL CAUSE CORRUPTION on the data partition.
       As such, this command is made available for curious DEVELOPERS ONLY at this point in time.

                                                                                                                                                         xfs_rtcp(8)
