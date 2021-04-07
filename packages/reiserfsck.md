REISERFSCK(8)                                                                     System Manager's Manual                                                                    REISERFSCK(8)

NAME
       reiserfsck - The checking tool for the ReiserFS filesystem.

SYNOPSIS
       reiserfsck  [  -aprVy  ]  [ --rebuild-sb | --check | --fix-fixable | --rebuild-tree | --clean-attributes ] [ -j | --journal device ] [ -z | --adjust-size ] [ -n | --nolog ] [ -B |
       --badblocks file ] [ -l | --logfile file ] [ -q | --quiet ] [ -y | --yes ] [ -f | --force ] [ -S | --scan-whole-partition ] [ --no-journal-available ] device

DESCRIPTION
       Reiserfsck searches for a Reiserfs filesystem on a device, replays any necessary transactions, and either checks or repairs the file system.

       device is the special file corresponding to a device or to a partition (e.g /dev/hdXX for an IDE disk partition or /dev/sdXX for a SCSI disk partition).

OPTIONS
       --rebuild-sb
              This option recovers the superblock on a Reiserfs partition.  Normally you only need this option if mount reports "read_super_block: can't find a reiserfs file system"  and
              you are sure that a Reiserfs file system is there. But remember that if you have used some partition editor program and now you cannot find a filesystem, probably something
              has gone wrong while repartitioning and the start of the partition has been changed. If so, instead of rebuilding the super block on a wrong place you should find the  cor‐
              rect start of the partition first.

       --check
              This default action checks filesystem consistency and reports, but does not repair any corruption that it finds. This option may be used on a read-only file system mount.

       --fix-fixable
              This  option  recovers  certain  kinds  of corruption that do not require rebuilding the entire file system tree (--rebuild-tree). Normally you only need this option if the
              --check option reports "corruption that can be fixed with --fix-fixable". This includes: zeroing invalid data-block pointers, correcting st_size and st_blocks for  directo‐
              ries, and deleting invalid directory entries.

       --rebuild-tree
              This  option  rebuilds  the entire filesystem tree using leaf nodes found on the device.  Normally you only need this option if the reiserfsck --check reports "Running with
              --rebuild-tree is required". You are strongly encouraged to make a backup copy of the whole partition before attempting the --rebuild-tree  option.  Once  reiserfsck  --re‐
              build-tree  is  started  it  must finish its work (and you should not interrupt it), otherwise the filesystem will be left in the unmountable state to avoid subsequent data
              corruptions.

       --clean-attributes
              This option cleans reserved fields of Stat-Data items. There were days when there were no extended attributes in reiserfs. When they were implemented old partitions  needed
              to  be cleaned first -- reiserfs code in the kernel did not care about not used fields in its strutures. Thus if you have used one of the old (pre-attrbutes) kernels with a
              ReiserFS filesystem and you want to use extented attribues there, you should clean the filesystem first.

       --journal device , -j device
              This option supplies the device name of the current file system journal.  This option is required when the journal resides on a separate device from the  main  data  device
              (although it can be avoided with the expert option --no-journal-available).

       --adjust-size, -z
              This  option  causes reiserfsck to correct file sizes that are larger than the offset of the last discovered byte.  This implies that holes at the end of a file will be re‐
              moved.  File sizes that are smaller than the offset of the last discovered byte are corrected by --fix-fixable.

       --badblocks file, -B  file
              This option sets the badblock list to be the list of blocks specified in the given `file`. The filesystem badblock list is cleared before the new list is added. It  can  be
              used with --fix-fixable to fix the list of badblocks (see debugreiserfs -B). If the device has bad blocks, every time it must be given with the --rebuild-tree option.

       --logfile file, -l  file
              This option causes reiserfsck to report any corruption it finds to the specified log file rather than to stderr.

       --nolog, -n
              This option prevents reiserfsck from reporting any kinds of corruption.

       --quiet, -q
              This option prevents reiserfsck from reporting its rate of progress.

       --yes, -y
              This option inhibits reiserfsck from asking you for confirmation after telling you what it is going to do. It will assuem you confirm. For safety, it does not work with the
              --rebuild-tree option.

       -a, -p These options are usually passed by fsck -A during the automatic checking of those partitions listed in /etc/fstab. These options cause reiserfsck to print some information
              about  the specified filesystem, to check if error flags in the superblock are set and to do some light-weight checks. If these checks reveal a corruption or the flag indi‐
              cating a (possibly fixable) corruption is found set in the superblock, then reiserfsck switches to the fix-fixable mode. If the flag indicating a fatal corruption is  found
              set in the superblock, then reiserfsck finishes with an error.

       --force, -f
              Force checking even if the file system seems clean.

       -V     This option prints the reiserfsprogs version and then exit.

       -r     This option does nothing at all; it is provided only for backwards compatibility.

EXPERT OPTIONS
       DO NOT USE THESE OPTIONS UNLESS YOU KNOW WHAT YOU ARE DOING.  WE ARE NOT RESPONSIBLE IF YOU LOSE DATA AS A RESULT OF THESE OPTIONS.

       --no-journal-available
              This  option allows reiserfsck to proceed when the journal device is not available. This option has no effect when the journal is located on the main data device. NOTE: af‐
              ter this operation you must use reiserfstune to specify a new journal device.

       --scan-whole-partition, -S
              This option causes --rebuild-tree to scan the whole partition but not only the used space on the partition.

AN EXAMPLE OF USING reiserfsck
       1. You think something may be wrong with a reiserfs partition on /dev/hda1 or you would just like to perform a periodic disk check.

       2. Run reiserfsck --check --logfile check.log /dev/hda1. If reiserfsck --check exits with status 0 it means no errors were discovered.

       3. If reiserfsck --check exits with status 1 (and reports about fixable corruptions) it means that you should run reiserfsck --fix-fixable --logfile fixable.log /dev/hda1.

       4. If reiserfsck --check exits with status 2 (and reports about fatal corruptions) it means that you need to run reiserfsck --rebuild-tree.  If reiserfsck --check  fails  in  some
       way you should also run reiserfsck --rebuild-tree, but we also encourage you to submit this as a bug report.

       5. Before running reiserfsck --rebuild-tree, please make a backup of the whole partition before proceeding. Then run reiserfsck --rebuild-tree --logfile rebuild.log /dev/hda1.

       6.  If the reiserfsck --rebuild-tree step fails or does not recover what you expected, please submit this as a bug report. Try to provide as much information as possible including
       your platform and Linux kernel version. We will try to help solve the problem.

EXIT CODES
       reiserfsck uses the following exit codes:
          0 - No errors.
          1 - File system errors corrected.
          2 - Reboot is needed.
          4 - File system fatal errors left uncorrected,
              reiserfsck --rebuild-tree needs to be launched.
          6 - File system fixable errors left uncorrected,
              reiserfsck --fix-fixable needs to be launched.
          8 - Operational error.
          16 - Usage or syntax error.

AUTHOR
       This version of reiserfsck has been written by Vitaly Fertman <vitaly@namesys.com>.

BUGS
       Please report bugs to the ReiserFS developers <reiserfs-devel@vger.kernel.org>, providing as much information as possible--your hardware, kernel, patches,  settings,  all  printed
       messages, the logfile; check the syslog file for any related information.

TODO
       Faster recovering, signal handling.

SEE ALSO
       mkreiserfs(8), reiserfstune(8) resize_reiserfs(8), debugreiserfs(8),

Reiserfsprogs-3.6.27                                                                   January 2009                                                                          REISERFSCK(8)
