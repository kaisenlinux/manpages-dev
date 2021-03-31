jfs_fsck(8)                                                                     JFS utility - file system check                                                                     jfs_fsck(8)

NAME
       jfs_fsck - initiate replay of the JFS transaction log, and check and repair a JFS formatted device

SYNOPSIS
       jfs_fsck [ -afnpvV ] [ -j journal_device ] [ --omit_journal_replay ] [ --replay_journal_only ] device

DESCRIPTION
       jfs_fsck is used to replay the JFS transaction log, check a JFS formatted device for errors, and fix any errors found.

       device is the special file name corresponding to the actual device to be checked (e.g. /dev/hdb1).

       jfs_fsck must be run as root.

WARNING
       jfs_fsck should only be used to check an unmounted file system or a file system that is mounted READ ONLY.  Using jfs_fsck to check a file system mounted other than READ ONLY could se‐
       riously damage the file system!

OPTIONS
       If no options are selected, the default is -p.

       -a     Autocheck mode - Replay the transaction log.  Do not continue fsck processing unless the aggregate state is dirty or the log replay failed.  Functionally equivalent to -p.   Au‐
              tocheck mode is typically the default mode used when jfs_fsck is called at boot time.

       -f     Replay the transaction log and force checking even if the file system appears clean.  Repair all problems automatically.

       -j journal_device
              Specify the journal device.

       -n     Open the file system read only.  Do not replay the transaction log.  Report errors, but do not repair them.

       --omit_journal_replay
              Omit  the replay of the transaction log.  This option should not be used unless as a last resort (i.e.  the log has been severely corrupted and replaying it causes further prob‐
              lems).

       -p     Automatically repair ("preen") the file system.  Replay the transaction log.  Do not continue fsck processing unless the aggregate state is  dirty  or  the  log  replay  failed.
              Functionally equivalent to -a.

       --replay_journal_only
              Only  replay  the  transaction log.  Do not continue with a full file system check if the replay fails or if the file system is still dirty even after a journal replay.  In gen‐
              eral, this option should only be used for debugging purposes as it could leave the file system in an unmountable state.  This option cannot be used with -f, -n, or  --omit_jour‐
              nal_replay.

       -v     Verbose messaging - print details and debug statements to stdout.

       -V     Print version information and exit (regardless of any other chosen options).

EXAMPLES
       Check  the 3rd partition on the 2nd hard disk, print extended information to stdout, replay the transaction log, force complete jfs_fsck checking, and give permission to repair all er‐
       rors:

              jfs_fsck -v -f /dev/hdb3

       Check the 5th partition on the 1st hard disk, and report, but do not repair, any errors:

              jfs_fsck -n /dev/hda5

EXIT CODE
       The exit code returned by jfs_fsck represents one of the following conditions:

        0     No errors

        1     File system errors corrected and/or transaction log replayed successfully

        2     File system errors corrected, system should be rebooted if file system was mounted

        4     File system errors left uncorrected

        8     Operational error

        16    Usage or syntax error

        128   Shared library error

REPORTING BUGS
       If you find a bug in JFS or jfs_fsck, please report it via the bug tracking system ("Report Bugs" section) of the JFS project web site:
       http://jfs.sourceforge.net/

       Please send as much pertinent information as possible, including the complete output of running jfs_fsck with the -v option on the JFS device.

SEE ALSO
       fsck(8), jfs_mkfs(8), jfs_fscklog(8), jfs_tune(8), jfs_logdump(8), jfs_debugfs(8)

AUTHORS
       Barry Arndt  (barndt@us.ibm.com)
       William Braswell, Jr.

       jfs_fsck is maintained by IBM.
       See the JFS project web site for more details:
       http://jfs.sourceforge.net/

                                                                                        October 29, 2002                                                                            jfs_fsck(8)
