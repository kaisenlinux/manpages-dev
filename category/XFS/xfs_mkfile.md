xfs_mkfile(8)                                                          System Manager's Manual                                                         xfs_mkfile(8)

NAME
       xfs_mkfile - create an XFS file

SYNOPSIS
       xfs_mkfile [ -v ] [ -n ] [ -p ] size[k|b|m|g] filename ...
       xfs_mkfile -V

DESCRIPTION
       xfs_mkfile  creates  one or more files. The file is padded with zeroes by default.  The default size is in bytes, but it can be flagged as kilobytes, blocks,
       megabytes, or gigabytes with the k, b, m, or g suffixes, respectively.

OPTIONS
       -v     Verbose. Report the names and sizes of created files.

       -n     No bytes. Create a holey file - that is, do not write out any data, just seek to end of file and write a block.

       -p     Preallocate.  The file is preallocated, then overwritten with zeroes, then truncated to the desired size.

       -V     Prints the version number and exits.

                                                                                                                                                       xfs_mkfile(8)
