jfs_fscklog(8)                                                      Extract/Display JFS fsck Log                                                      jfs_fscklog(8)

NAME
       jfs_fscklog - extract a JFS fsck service log into a file and/or format and display the extracted file

SYNOPSIS
       jfs_fscklog [ -d ] [ -e device ] [ -f output.file ] [ -p ] [ -V ]

DESCRIPTION
       jfs_fscklog  with  option -e device extracts the contents of either the most recent or immediately prior (specified with option -p) JFS fsck service log from
       the specified device, and writes the output to a file.  The file name may be specified with the -f option, or the default file name is <pwd>fscklog.new.   If
       the -p option is used, the default file name is <pwd>fscklog.old.

       jfs_fscklog with option -d formats and displays the contents of the extracted file.

       jfs_fscklog with options -d and -e device extracts and displays the JFS fsck service log.

OPTIONS
       -d     Format and display a previously extracted JFS fsck service log.

       -e device
              Extract  the  JFS fsck service log from device and store it in a file.  (device is the special file name corresponding to the actual device from which
              the fsck log will be extracted (e.g.  /dev/hdb1 )).

       -f file.name
              Specify the file name, overriding the default file name.  When used with -e device, file.name specifies the name of the file into which the  JFS  fsck
              log will be extracted.  When used with -d, file.name specifies the name of the extracted file whose contents will be formatted and displayed.

              file.name must be 127 characters or less in length.

              file.name will be created in the present working directory unless it is fully qualified.

       -p     Extract the prior log (as opposed to the most recent log).

       -V     Print version information and exit (regardless of any other chosen options).

EXAMPLES
        Extract the most recent JFS fsck log on /dev/hda5 into <pwd>fscklog.new:

              jfs_fscklog -e /dev/hda5

       Extract the most recent JFS fsck log on /dev/hdb3 into /temp/l9651107.log:

              jfs_fscklog -e /dev/hdb3 -f /temp/l9651107.log

       Display the JFS fsck log that was extracted into /temp/l9651107.log:

              jfs_fscklog -d -f /temp/l9651107.log

       Extract and display the previous JFS fsck log from /dev/hda8:

              jfs_fscklog -e /dev/hda8 -d -p

REPORTING BUGS
       If you find a bug in JFS or jfs_fscklog, please report it via the bug tracking system ("Report Bugs" section) of the JFS project web site:
       http://jfs.sourceforge.net/

       Please  send  as much pertinent information as possible, including any jfs_fscklog error messages and the complete output of running jfs_fsck with the -v op‐
       tion on the JFS device.

SEE ALSO
       jfs_fsck(8), jfs_mkfs(8), jfs_tune(8), jfs_logdump(8), jfs_debugfs(8)

AUTHOR
       Barry Arndt  (barndt@us.ibm.com)

       jfs_fscklog is maintained by IBM.
       See the JFS project web site for more details:
       http://jfs.sourceforge.net/

                                                                          October 28, 2002                                                            jfs_fscklog(8)
