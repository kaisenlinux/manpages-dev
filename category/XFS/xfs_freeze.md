xfs_freeze(8)                                                          System Manager's Manual                                                         xfs_freeze(8)

NAME
       xfs_freeze - suspend access to an XFS filesystem

SYNOPSIS
       xfs_freeze [ -f | -u ] mount-point
       xfs_freeze -V

DESCRIPTION
       xfs_freeze suspends and resumes access to an XFS filesystem (see xfs(5)).

       xfs_freeze  halts  new access to the filesystem and creates a stable image on disk.  xfs_freeze is intended to be used with volume managers and hardware RAID
       devices that support the creation of snapshots.

       The mount-point argument is the pathname of the directory where the filesystem is mounted.  The filesystem must be mounted to be frozen (see mount(8)).

       The -f flag requests the specified XFS filesystem to be frozen from new modifications.  When this is selected, all ongoing transactions in the filesystem are
       allowed to complete, new write system calls are halted, other calls which modify the filesystem are halted, and all dirty data, metadata, and log information
       are written to disk.  Any process attempting to write to the frozen filesystem will block waiting for the filesystem to be unfrozen.

       Note that even after freezing, the on-disk filesystem can contain information on files that are still in the process of unlinking.  These files will  not  be
       unlinked until the filesystem is unfrozen or a clean mount of the snapshot is complete.

       The -u flag is used to un-freeze the filesystem and allow operations to continue.  Any filesystem modifications that were blocked by the freeze are unblocked
       and allowed to complete.

       The -V flag prints the version number and exits.

       Unless -V is specified, one of -f or -u must be supplied to xfs_freeze.

NOTES
       A copy of a frozen XFS filesystem will usually have the same universally unique identifier (UUID) as the original, and  thus  may  be  prevented  from  being
       mounted.  The XFS nouuid mount option can be used to circumvent this issue.

       In  Linux kernel version 2.6.29, the interface which XFS uses to freeze and unfreeze was elevated to the VFS, so that this tool can now be used on many other
       Linux filesystems.

SEE ALSO
       xfs(5), lvm(8), mount(8).

                                                                                                                                                       xfs_freeze(8)
