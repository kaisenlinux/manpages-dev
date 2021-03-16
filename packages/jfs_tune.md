  jfs_tune
 
## NAME
        jfs_tune - adjust tunable file system parameters on JFS
 
## SYNOPSIS
        jfs_tune [options] device
 
## DESCRIPTION
        jfs_tune adjusts tunable parameters on a Linux JFS file system or external journal.  jfs_tune must be run as root.
 
        device is the special file name corresponding to the actual device (e.g. /dev/hdb1) on which a JFS file system or JFS external journal has been created.
 
## OPTIONS
        -J device=external-journal
               Attach the JFS external journal located on external-journal to the JFS file system on device.
 
               The external journal must already have been created using the command.  More than one file system may share the same external journal.
 
               mkfs.jfs -J journal_dev external-journal
 
               Attach the external journal to the file system by using the command
 
               jfs_tune -J device=external-journal device
 
               Instead  of  specifying  a  device name directly, external-journal can also be specified by either LABEL=label or UUID=UUID (Use jfs_tune -l device to
               display a journal device's volume label and UUID.)
 
        -l     List the contents of the JFS file system or external journal superblock that resides on device.
 
        -L volume-label
               Set the volume label of the JFS file system or external journal.  JFS labels can be at most 16 characters long; if  volume-label  is  longer  than  16
               characters, jfs_tune will truncate it and print a warning.  The volume label can be used by mount(8), fsck(8), and /etc/fstab(5) (and possibly others)
               by specifying LABEL=volume_label instead of a block special device name like /dev/hda5.
 
        -U UUID
               Set the universally unique identifier (UUID) of the file system or external journal device to UUID.  The format of the UUID is a series of hex  digits
               separated by hyphens, like this: "c1b9d5a2-f162-11cf-9ece-0020afc76f16".  The UUID parameter may also be one of the following:
 
                    clear  clear the file system UUID
 
                    random generate a new randomly-generated UUID
 
                    time   generate a new time-based UUID
 
               The UUID may be used by mount(8), fsck(8), and /etc/fstab(5) (and possibly others) by specifying UUID=uuid instead of a block special device name like
               /dev/hda1.
 
               See uuidgen(8) for more information.
 
        -V     Print version information and exit (regardless of any other chosen options).
 
## EXAMPLES
        Set a randomly-generated UUID for the JFS file system on the 3rd partition of the 2nd hard disk, and view the resultant superblock:
 
               jfs_tune -l -U random /dev/hdb3
 
        Attach an already existing external journal on a device labeled JFSLog to a JFS file system on /dev/hda8:
 
               jfs_tune -J device=LABEL=JFSLog /dev/hda8
 
 REPORTING## BUGS
        If you find a bug in JFS or jfs_tune, please report it via the bug tracking system ("Report Bugs" section) of the JFS project web site:
        http://jfs.sourceforge.net/
 
        Please send as much pertinent information as possible including any error messages resulting from running jfs_tune.
 
## SEE ALSO
        jfs_fsck(8), jfs_mkfs(8), jfs_fscklog(8), jfs_logdump(8), jfs_debugfs(8)
 
## AUTHOR
        Barry Arndt  (barndt@us.ibm.com)
 
        jfs_tune is maintained by IBM.
        See the JFS project web site for more details:
        http://jfs.sourceforge.net/
 
                                                                           October 28, 2002                                                               jfs_tune(8)
