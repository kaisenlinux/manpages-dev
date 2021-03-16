NTFSCMP(8)                                                             System Manager's Manual                                                            NTFSCMP(8)

NAME
       ntfscmp - compare two NTFS filesystems and tell the differences

SYNOPSIS
       ntfscmp [OPTIONS] DEVICE1 DEVICE2

DESCRIPTION
       The ntfscmp program makes a comparison between two NTFS filesystems from all aspects and reports all variances it finds.  The filesystems can be on block de‐
       vices or images files. Ntfscmp can be used for volume verification however its primary purpose was to be an efficient development tool, used to  quickly  lo‐
       cate, identify and check the correctness of the metadata changes made to NTFS.

       If one is interested only in the NTFS metadata changes then it could be useful to compare the metadata images created by using the --metadata option of ntfs‐
       clone(8) to eliminate the usually uninteresting timestamp changes.

       The terse output of ntfscmp is intentional because the provided information is enough in each case to determine the exact differences. This can be  achieved,
       for instance, if one compares the verbose outputs of ntfsinfo(8) for each reported inodes by the diff(1) utility.

OPTIONS
       Below is a summary of the options that ntfscmp accepts.

       -P, --no-progress-bar
              Don't show progress bars.

       -v, --verbose
              More informational output.

       -h, --help
              Display help and exit.

EXIT CODES
       The exit code is 0 on success, non-zero otherwise.

KNOWN ISSUES
       No problem is known. If you would find otherwise then please send your report to the development team: ntfs-3g-devel@lists.sf.net

AUTHOR
       ntfscmp was written by Szabolcs Szakacsits.  It was ported to ntfs-3g by Erik Larsson.

AVAILABILITY
       ntfscmp is part of the ntfs-3g package and is available from:
       http://www.tuxera.com/community/

SEE ALSO
       ntfsinfo(8), ntfscat(8), diff(1), ntfsclone(8), ntfsprogs(8)

ntfs-3g 2017.3.23AR.3                                                        April 2006                                                                   NTFSCMP(8)
