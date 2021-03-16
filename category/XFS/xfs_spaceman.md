xfs_spaceman(8)                                                        System Manager's Manual                                                       xfs_spaceman(8)

NAME
       xfs_spaceman - show free space information about an XFS filesystem

SYNOPSIS
       xfs_spaceman [ -c cmd ] file
       xfs_spaceman -V

DESCRIPTION
       xfs_spaceman reports and controls free space usage in an XFS filesystem.

OPTIONS
       -c cmd    xfs_spaceman  commands may be run interactively (the default) or as arguments on the command line. Multiple -c arguments may be given. The commands
                 are run in the sequence given, then the program exits.

COMMANDS
       freesp [ -dgrs ] [-a agno]... [ -b | -e bsize | -h bsize | -m factor ]
              With no arguments, freesp shows a histogram of all free space extents in the filesystem.  The command takes the following options:

                 -a agno
                     Collect free space information from this allocation group.  This option can be specified multiple times to collect from multiple groups.

                 -b  This argument establishes that the histogram bin sizes are successive powers of two.  This is the default, and is mutually exclusive  with  the
                     -e, -h, and -m options.

                 -d  Print debugging information such as the raw free space extent information.

                 -g  Print the free space block and extent counts for each AG.

                 -e bsize
                     Set all histogram bin sizes to a specific value.  This option is mutually exclusive with the -b, -h, and -m options.

                 -h bsize
                     Create a histogram bin with a lower bound of this value.  The upper bound of this bin will be one less than the lower bound of the next highest
                     histogram bin.  This option can be given multiple times to control the exact bin sizes.  This option is mutually exclusive with the -b, -e, and
                     -m options.

                 -m factor
                     Create  each histogram bin with a size that is this many times the size of the prvious bin created.  This option is mutually exclusive with the
                     -b, -e, and -h options.

                 -r  Query the realtime device for free space information.

                 -s  Display a summary of the free space information found.

       info   Displays selected geometry information about the filesystem.  The opened file must be a mount point of a XFS filesystem.  The  output  will  have  the
              same format that xfs_info(8) prints when querying a filesystem.

       health [ -a agno] [ -c ] [ -f ] [ -i inum ] [ -q ] [ paths ]
              Reports the health of the given group of filesystem metadata.
                 -a agno
                     Report on the health of the given allocation group.
                 -c  Scan all inodes in the filesystem and report each file's health status.  If the -a option is given, scan only the inodes in that AG.
                 -f  Report on the health of metadata that affect the entire filesystem.
                 -i inum
                     Report on the health of a specific inode.
                 -q  Report only unhealthy metadata.
                 paths
                     Report on the health of the files at the given path.

       help [ command ]
              Display a brief description of one or all commands.

       prealloc [ -u id ] [ -g id ] [ -p id ] [ -m minlen ] [ -s ]
              Removes speculative preallocation.  If no -u, -g, or -p options are given, this command acts on all files.  The command takes the following options:

                 -u uid
                     Clear all speculative preallocations for files with this user id.  This option can be given in combination with the -g  and  -p options.

                 -g gid
                     Clear all speculative preallocations for files with this group id.  This option can be given in combination with the -u  and  -p options.

                 -p pid
                     Clear all speculative preallocations for files with this project id.  This option can be given in combination with the -u  and  -g options.

                 -m minlen
                     Ignore all files smaller than this size.  Units can be supplied for this argument.

                 -s  Wait for removal to complete.

       print  Display a list of all open files.

       quit   Exit xfs_spaceman.

       trim ( -a agno | -f | offset length ) [ -m minlen ]
              Instructs  the underlying storage device to release all storage that may be backing free space in the filesystem.  The command takes the following op‐
              tions: (One of -a, -f, or the offset/length pair are required.)

                 -a agno
                     Trim free space extents in the given allocation group.  This option is mutually exclusive with the -f option and the offset/length options.

                 -f  Trim all free space in the filesystem.  This option is mutually exclusive with the -a option and the offset/length options.

                 option, length
                     Trim all free space within the physical range defined by the offset and length from this filesystem.  Units can be appended to these arguments.
                     This option is mutually exclusive with the -a and -f options.

                 -m minlen
                     Do not trim free space extents shorter than this length.  Units can be appended to this argument.

                                                                                                                                                     xfs_spaceman(8)
