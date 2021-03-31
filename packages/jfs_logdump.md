jfs_logdump(8)                                                                   JFS utility - journal log dump                                                                  jfs_logdump(8)

NAME
       jfs_logdump - dump a JFS formatted device's journal log

SYNOPSIS
       jfs_logdump [ -a ] device

DESCRIPTION
       jfs_logdump dumps the contents of the journal log from the specified JFS formatted device into output file ./jfslog.dmp.

       device is the special file name corresponding to the actual device from which the journal log will be dumped (e.g.  /dev/hdb1 ).

       jfs_logdump must be run as root.

OPTIONS
       -a     Dump the entire contents of the journal log instead of just the committed transactions since the last synch point.

EXAMPLE
       Dump the entire JFS journal log from the 3rd partition of the 2nd hard disk into ./jfslog.dmp:

              jfs_logdump -a /dev/hdb3

REPORTING BUGS
       If you find a bug in JFS or jfs_logdump, please report it via the bug tracking system ("Report Bugs" section) of the JFS project web site:
       http://jfs.sourceforge.net/

       Please send as much pertinent information as possible, including any jfs_logdump error messages and the complete output of running jfs_fsck with the -v option on the JFS device.

SEE ALSO
       jfs_fsck(8), jfs_mkfs(8), jfs_fscklog(8), jfs_tune(8), jfs_debugfs(8)

AUTHORS
       Barry Arndt  (barndt@us.ibm.com)
       William Braswell, Jr.

       jfs_logdump is maintained by IBM.
       See the JFS project web site for more details:
       http://jfs.sourceforge.net/

                                                                                        October 29, 2002                                                                         jfs_logdump(8)
