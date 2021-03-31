jfs_mkfs(8)                                                                         JFS file system creation                                                                        jfs_mkfs(8)

NAME
       jfs_mkfs - create a JFS formatted partition

SYNOPSIS
       jfs_mkfs [options] device [ blocks ]

DESCRIPTION
       jfs_mkfs is used to create (format) a JFS partition.  jfs_mkfs must be run as root.

       device is the special file name corresponding to the actual device (e.g. /dev/hdb1) on which a JFS file system and/or JFS journal will be created.  blocks is the number of blocks to be
       used for the file system.  If omitted, jfs_mkfs automatically figures the file system size.

       The default block size is 4096.

WARNING
       jfs_mkfs will destroy all data on the specified device!

OPTIONS
       -c     Check the device for bad blocks before building the file system.

       -j journal_device
              Create the external JFS journal on journal_device , create the JFS file system on device , and attach the external journal to the file system.

       -J journal-options
              Create the JFS journal on its own device or attach an external JFS journal to the JFS file system using options specified on the command-line.  The following journal options are
              supported:

                   journal_dev
                          Create an external JFS journal on the given device.

                   device=external-journal
                          Attach  an  existing  external JFS journal located on external-journal to the JFS file system that will be created on device.  The external journal must already have
                          been created using the command

                          jfs_mkfs -J journal_dev external-journal

                          Attach the external journal to the file system being created by using the command

                          jfs_mkfs -J device=external-journal device

                          Instead of specifying a device name directly, external-journal can also be specified by either LABEL=label or UUID=UUID to locate the external journal by either  the
                          volume  label  or  UUID  stored in the JFS external log superblock at the start of the journal.  Use jfs_tune(8) to display a journal device's volume label and UUID.
                          (See the -l, -L, and -U options of jfs_tune(8).)

              Only one of the journal_dev or device= options can be given per jfs_mkfs issuance.

       -L volume_label
              Set the volume label for the newly formatted device.

              If -L volume_label is used along with -J journal_device, the volume label of the specified external journal device will be set to volume_label.  Otherwise, the volume  label  of
              the JFS file system will be set to volume_label.

       -O     Provide case-insensitive support for compatibility with OS/2.

       -q     Quiet execution - do not ask for confirmation before creating the file system.

       -s log_size
              Set the log size (in megabytes) of the inline log.  If the -s option is not used, the default log size is 0.4% of the aggregate size.

       -V     Print version information and exit (regardless of any other chosen options).

EXAMPLES
       Format 3rd partition on 2nd hard disk with the volume label "JFS_hdb3":

              jfs_mkfs -L JFS_hdb3 /dev/hdb3

       Format 5th partition on 1st hard disk, verifying each block created:

              jfs_mkfs -c /dev/hda5

       Format 3rd partition on 2nd hard disk as external journal, format 4th partition on 1st hard disk as JFS file system, and attach the external journal to the file system:

              jfs_mkfs -j /dev/hdb3 /dev/hda4

REPORTING BUGS
       If you find a bug in JFS or jfs_mkfs, please report it via the bug tracking system ("Report Bugs" section) of the JFS project web site:
       http://jfs.sourceforge.net/

       Please send as much pertinent information as possible including any error messages resulting from running jfs_mkfs.

SEE ALSO
       mkfs(8), jfs_fsck(8), jfs_fscklog(8), jfs_tune(8), jfs_logdump(8), jfs_debugfs(8)

AUTHORS
       Barry Arndt  (barndt@us.ibm.com)
       William Braswell, Jr.

       jfs_mkfs is maintained by IBM.
       See the JFS project web site for more details:
       http://jfs.sourceforge.net/

                                                                                         March 9, 2005                                                                              jfs_mkfs(8)
