fsck.ocfs2(8)                                                                          OCFS2 Manual Pages                                                                         fsck.ocfs2(8)

NAME
       fsck.ocfs2 - Check an OCFS2 file system.

SYNOPSIS
       fsck.ocfs2 [ -pafFGnuvVy ] [ -b superblock block ] [ -B block size ] device

DESCRIPTION
       fsck.ocfs2 is used to check an OCFS2 file system.

       device is the file where the file system is stored (e.g. /dev/sda1).  It will almost always be a device file but a regular file will work as well.

OPTIONS
       -a     This option does the same thing as the -p option.  It is provided for backwards compatibility only: it is suggested that people use the -p option whenever possible.

       -b superblock block
              Normally,  fsck.ocfs2 will read the superblock from the first block of the device.  This option specifies an alternate block that the superblock should be read from. (Use -r in‐
              stead of this option.)

       -B blocksize
              The block size, specified in bytes, can range from 512 to 4096.  A value of 0, the default, is used to indicate that the blocksize should be automatically detected.

       -D     Optimize directories in filesystem. This option causes fsck.ocfs2 to coalesce the directory entries in order to improve the filesystem performance.

       -f     Force checking even if the file system is clean.

       -F     By default fsck.ocfs2 will check with the cluster services to ensure that the volume is not in-use (mounted) on any node in the cluster before proceeding.  -F skips  this  check
              and  should only be used when it can be guaranteed that the volume is not mounted on any node in the cluster. WARNING: If the cluster check is disabled and the volume is mounted
              on one or more nodes, file system corruption is very likely. If unsure, do not use this option.

       -G     Usually fsck.ocfs2 will silently assume inodes whose generation number does not match the generation number of the super block are unused inodes.  This option causes  fsck.ocfs2
              to ask the user if these inodes should in fact be marked unused.

       -n     Give  the  'no'  answer  to  all questions that fsck will ask.  This guarantees that the file system will not be modified and the device will be opened read-only.  The output of
              fsck.ocfs2 with this option can be redirected to produce a record of a file system's faults.

       -p     Automatically repair ("preen") the file system.  This option will cause fsck.ocfs2 to automatically fix any problem that can be safely corrected without human intervention.   If
              there  are  problems that require intervention, the descriptions will be printed and fsck.ocfs2 will exit with the value 4 logically or'd into the exit code.  (See the EXIT CODE
              section.)  This option is normally used by the system's boot scripts.

       -P     Show progress.

       -r backup-number
              mkfs.ocfs2 makes up to 6 backup copies of the superblock at offsets 1G, 4G, 16G, 64G, 256G and 1T depending on the size of the volume.  Use this option to specify the backup,  1
              thru 6, to use to recover the superblock.

       -t     Show I/O statistics. If this option is specified twice, it shows the statistics on a pass by pass basis.

       -y     Give  the 'yes' answer to all questions that fsck will ask.  This will repair all faults that fsck.ocfs2 finds but will not give the operator a chance to intervene if fsck.ocfs2
              decides that it wants to drastically repair the file system.

       -v     This option causes fsck.ocfs2 to produce a very large amount of debugging output.

       -V     Print version information and exit.

EXIT CODE
       The exit code returned by fsck.ocfs2 is the sum of the following conditions:
            0    - No errors
            1    - File system errors corrected
            2    - File system errors corrected, system should
                   be rebooted
            4    - File system errors left uncorrected
            8    - Operational error
            16   - Usage or syntax error
            32   - fsck.ocfs2 canceled by user request
            128  - Shared library error

SEE ALSO
       debugfs.ocfs2(8) fsck.ocfs2.checks(8) mkfs.ocfs2(8) mount.ocfs2(8) mounted.ocfs2(8) o2cluster(8) o2image(8) o2info(1) tunefs.ocfs2(8)

AUTHORS
       Oracle Corporation.  This man page entry derives some text, especially the exit code summary, from e2fsck(8) by Theodore Y. Ts'o <tytso@mit.edu>.

COPYRIGHT
       Copyright © 2004, 2012 Oracle. All rights reserved.

Version 1.8.6                                                                             January 2012                                                                            fsck.ocfs2(8)
