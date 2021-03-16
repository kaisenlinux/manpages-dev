xfs_scrub_all(8)                                                       System Manager's Manual                                                      xfs_scrub_all(8)

NAME
       xfs_scrub_all - scrub all mounted XFS filesystems

SYNOPSIS
       xfs_scrub_all [ -hV ]

DESCRIPTION
       xfs_scrub_all  attempts  to  read and check all the metadata on all mounted XFS filesystems.  The online scrub is performed via the xfs_scrub tool, either by
       running it directly or by using systemd to start it in a restricted fashion.  Mounted filesystems are mapped to physical storage devices so that scrub opera‐
       tions can be run in parallel so long as no two scrubbers access the same device simultaneously.

OPTIONS
       -h     Display help.

       -V     Prints the version number and exits.

EXIT CODE
       The exit code returned by xfs_scrub_all is the sum of the following conditions:
            0    - No errors
            4    - File system errors left uncorrected
            8    - Operational error
            16   - Usage or syntax error

       These are the same error codes returned by xfs_scrub.

SEE ALSO
       xfs_scrub(8).

                                                                                                                                                    xfs_scrub_all(8)
