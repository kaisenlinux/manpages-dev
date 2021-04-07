BACKUP2L(8)                                                                       System Manager's Manual                                                                      BACKUP2L(8)

NAME
       backup2l -  low-maintenance backup/restore tool

SYNOPSIS
       backup2l [ -c conffile ] [ -t backup-ID ] command

DESCRIPTION
       backup2l  is  a  tool for generating, maintaining and restoring backups on a mountable file system (e. g. hard disk). The main design goals are low maintenance effort, efficiency,
       transparency and robustness.  It features differential backups at multiple hierarchical levels and provides rollback functionality.

       All control files are stored together with the archives on the backup device, and their contents are mostly self-explaining. Hence, in the case of an emergency, a  user  does  not
       only have to rely on the restore functionality of backup2l, but can - if necessary - browse the files and extract archives manually.

       An  open  driver  architecture allows one to use virtually any archiving program as a backend.  Built-in drivers support .tar.gz, .tar.bz2, or .afioz files. Further drivers can be
       added by the user. When restoring data, an appropriate driver is selected automatically for each archive depending on the suffix of the archive file.

       The method of hierarchical differential backups is a generalization to the concept of the "daily", "weekly" and "monthly" backups.  Each backup has a level and  a  serial  number.
       Maximum-level  backups  are  comparable  with daily differential backups, level-0 backups are full backups. For example, let MAX_LEVEL be 4 and MAX_PER_LEVEL be 5. After 5 level-4
       backups (e. g. after 5 days), a new level-3 backup is made.  After 5 level-3 backups (and 5*5 at level-4), a new level-2 backup is made, and so on.  Each differential backup  con‐
       tains the changes towards the previous backup of the same or a lower level.

       This  scheme  allows one to efficiently generate small incremental backups at short intervals.  At the same time, the total number of archives that have to be stored (or processed
       in the case of a restore) only increases logarithmically with the number of backups since the last full backup. Time-consuming full backups are only sparsely needed.  In the exam‐
       ple above, a new full backup is only necessary after 780 (=5^4+5^3+5*5+5) days, while only at most 20 (=4*5) archives have to be processed.

       For  backup2l, each backup archive is identified by its backup ID (BID). The number of digits determines the level. Level-0 (full) backups have a 1-digit BID, level-n backups have
       a BID of n+1 digits.  The last digit is a serial number, the prefix identifies the lower-level backups on which a given backup is based on. For example, the archive  235  contains
       the  differences  towards archive 234, and to restore the file system state of the time it was generated, the full backup 2, the level-1 backups 21, 22, 23 and the level-2 backups
       231, ..., 235 have to be processed.  All serial numbers are between 1 and 9, a zero in the BID indicates that no archive of the respective level is contained in the chain. For ex‐
       ample, the level-3 backup 1201 is immediately based on the level-1 backup 12.

       For  deciding  whether a file is new or modified, backup2l looks at its name, modification time, size, ownership and permissions. Unlike other backup tools, the i-node is not con‐
       sidered in order to avoid problems with non-Unix file systems like FAT32.

OPTIONS
       -c, --conf conffile
              This argument specifies the configuration file (default: etc/backup2l.conf).

       -t, --time BID
              If present, this option selects a certain backup for the --locate and --restore commands.  E. g., the latter will restore files and directories exactly as they were on  the
              system at the time when the specified backup was made. If not present, the latest available backup is selected.

COMMANDS
       -h, --help
              Display the usage info.

       -e, --estimate [ level ]
              Prints  the  number of files, estimated amount of data and other information on the backup that would be generated next. No backup archives are actually created or removed.
              If specified, the parameter level overrides the MAX_LEVEL setting.

       -b, --backup [ level ]
              Creates a new backup and removes old archives based on the given configuration file.  If specified, the parameter level overrides the MAX_LEVEL setting. This is  useful  e.
              g.  shortly before or after major changes are performed with the file system. In this case, a lower level should be specified in order to avoid that a large number of files
              are backed up multiple times again.

       -s, --get-summary
              Shows a table describing each backup (date, size, files, ...) and the file system usage of the backup device.

       -a, --get-available [ pattern list ]
              Shows all files removed and added for all backups. A '+' in the output indicates that the file is new and thus contained in the archive file. A '-' indicates that the  file
              has  been  removed (or replaced).  If one or several patterns are supplied, grep(1) is used to filter the list. All status messages go to stderr, so that the generated file
              list can easily be redirected.

              Note: The search pattern is not just applied to the file names, but to the whole entry in the .list.gz file. This allows one to not only search for file names but also  for
              other attributes like ownership, modification time etc. . In order to apply a search pattern to file names only, precede it by "<space>/.*".

       -l, --locate [ pattern list ]
              Shows  most recent backup location for active files. If one or several patterns are supplied, grep(1) is used to filter the list in the same way as for --get-available (see
              above) . All status messages go to stderr, so that the generated file list can easily be redirected.

              Active files are files that have been on the system at the time of the selected backup, which is either the latest backup or the one specified by --time (see above).  Files
              that were removed at that time but are still stored in some later archive will not be shown.

              Altogether, this command tells you, which files have to be extracted from which archive in order to restore the state of the system at the time of the selected backup.

       -r, --restore [ pattern list ]
              Performs the same steps like --locate and then restores the respective files. All files are restored relative to the current directory. They can be restored to their origi‐
              nal location by cd'ing into / before, but this is not recommended.

       -p, --purge BID list
              Removes the specified backup archive(s) and all depending backups.

       -m, --make-check [ BID list ]
              Creates (a) check file(s) for the specified archive(s) using md5sum(1).  If no BID is specified, check files are created wherever missing.

       -v, --verify [ BID list ]
              Verifies the specified backup archive(s). If no BID is specified, all existing archives are checked.  If a check file exists, this allows one a comprehensive test including
              e. g. media failures. If the check file is missing, only the existence of all files and the immediate base archive are verified.

       -x, --extract capacity max-free BID-list
              Split  and  collect  files  to be stored on removable media (e. g. CDs). capacity is the medium capacity in MB. max-free is the maximum amount of empty space on each medium
              (except for the last one, of course). BID-list specifies the archives and may contain wildcards, e. g.: 1 '2*'.  The operation generates enumbered subdirectories represent‐
              ing the media contents.  Some more files are generated that may be useful, e. g. to print labels.

              While  guaranteeing a minimum waste of max-free MB per medium, the collection procedure preserves the ordering of files and keeps all control files of an archive always to‐
              gether on the same medium.  Large archive files are split into multiple files with serial numbers appended to their names.

              The operation is interactive. Just run it and look what it is about to do.  If that is not what you want, you can stop it.

CONFIGURATION
       In the configuration file (/etc/backup2l.conf by default), the following variables have to be set, following the bash(1) syntax:

       FOR_VERSION=version
              Defines the backup2l version for which the configuration file is written. This way, future versions can automatically print a warning if the syntax has changed.

       SRCLIST=( source list )
              This is a blank-separated list of all top-level directories to make backups of.  Directory names with spaces have to be quoted, e.  g.:  SRCLIST=("/my  dir"  /another/dir).
              The last elements of the list may be options for find(1), for example -xdev in order to skip subdirs on other file systems like /dev or /proc.

       SKIPCOND=( find condition )
              Files for which this condition is 'true' are not considered for backup.  See find(1) for information on how to formulate possible conditions.  Special characters ("(", ")",
              "!", ...) must be quoted by a leading backslash ("\(", "\)", " \!", ...). An empty condition (i. e. if you do not want any files to be skipped)  must  be  specified  as  "(
              -false )".

       [ BACKUP_DEV="mount_point" ]
              If defined, backup2l mounts the backup device before any operation.  Afterwards, it is unmounted unless it was already mounted before.

       BACKUP_DIR="backup dir"
              Destination directory for backup files. This must be different from MOUNT_POINT, i. e.  a subdirectory on the device.

       VOLNAME="volname"
              This is a common prefix for all backup and control files. Multiple backup volumes are possible if for each volume a separate configuration file is written.

       MAX_LEVEL=max_level
              Maximum backup level. Possible values are 1..9.

       MAX_PER_LEVEL=max_per_level
              Number of differential backups per level. Possible values are 1..9.

       MAX_FULL=max_full
              Number of full backups kept. Possible values are 1..8.

       GENERATIONS=generations
              Number  of backup generations to keep for each non-zero level. Old backups are automatically removed as long as at least GENERATIONS * MAX_PER_LEVEL backups for the respec‐
              tive level remain.

              For example, with MAX_LEVEL=3, MAX_PER_LEVEL=5, GENERATIONS=2 it is always possible to access the last 10 level-3 (e. g. daily) backups, the last 10 level-2 backups (e.  g.
              5, 10, 15, ..., 50 days old), and so on.

       PRE_BACKUP () { do something }
              This  function is called before writing the backup. It can be used to dump some important system information, e. g. the HD's partition table, to a file which is then backed
              up.

       POST_BACKUP () { do something }
              This function is called after writing the backup. Together with PRE_BACKUP it can be used to stop and restart e. g. database or mail services  which  may  frequently  alter
              some files that have to be backed up.

       [ AUTORUN=1 ]
              If set to 1, backup2l performs the --backup operation when invoked without arguments.  Otherwise, the usage information is shown.

       [ SIZE_UNITS= B | K | M | G ]
              Sets  the units for archive sizes in summary listings to bytes, KB, MB, or GB.  If unset, a user-readable format is chosen automatically. If set, the units are the same for
              the whole table, which may be even more user-friendly.

       [ CREATE_DRIVER="archive driver" ]
              Selects an archive driver for creating backups. An archive driver is responsible for managing backup files. If unset, the default driver "DRIVER_TAR_GZ" is used. The --help
              operation lists all available drivers. More drivers can be defined in the configuration file (see below).

       [ USER_DRIVER_LIST="user-defined drivers" ]
              Declares  additional,  user-defined archive drivers which are implemented in the configuration file.  The sample configuration file contains a commented example. Read it in
              order to learn how to implement your own driver.

FILES
       /etc/backup2l.conf
              Configuration file.

       VOLNAME.BID.tar.gz, VOLNAME.BID.afioz, ...
              Archive files.

       VOLNAME.BID.list.gz
              List of all active files when the backup was made. Each file is preceded with its size, modification time, and other information.

       VOLNAME.BID.new.gz
              List of all new ore modified files when the backup was made (pathnames only). Unless an error occurred, this list reflects the contents of the archive.

       VOLNAME.BID.obsolete.gz
              List of all obsolete files when the backup was made (pathnames only).

       VOLNAME.BID.skipped.gz
              Complete list of all files that were skipped according to SKIPMASK.

       VOLNAME.BID.error.gz
              This file is generated by comparing the .new.gz file with the actual archive contents using diff(1). If the error file is non-empty, something may have gone wrong.

       VOLNAME.BID.check
              MD5 check sums of all files of the present archive and the .list.gz file of the base archive.  This file is optional and may be used by the --verify operation.

INVOCATION BY CRON
       backup2l is designed to be run autonomously as a cron job.  If the variable AUTORUN is set, it generates a backup if invoked without any parameters, and you can  simply  create  a
       symlink, e. g. by:

                                                                       ln -s `which backup2l` /etc/cron.daily/zz-backup2l

       The  "zz-"  prefix causes the backup job to be the last one executed, so that other jobs are not delayed if the backup takes somewhat longer. The status output is e-mailed to root
       by the cron daemon.

MANIPULATING FILES AND CONFIGURATIONS
       backup2l has been designed to be robust with respect to errors and configuration changes.  If the backup process is interrupted, e. g. because of a shutdown while it  is  running,
       no serious data corruption can occur. Some temporary files may remain which are cleaned up during the next run. If file is changed during the backup generation, it may not be con‐
       tained in the current backup. However, it is guaranteed that it is considered modified during the next backup.

       In order to save disk space, e. g. after some archives have been copied to external media, archive files (.tar.gz or .afioz, for example) can safely be removed from the backup di‐
       rectory.   As  long  as all control files are kept, backup2l retains full functionality as far as possible.  The --restore command prompts for eventually missing archive files for
       the respective request (and only those). The --extract command completely ignores all backups with missing archive files.

       The configuration, especially the settings for MAX_LEVEL,  MAX_PER_LEVEL, MAX_FULL and the specification of source files, can be arbitrarily changed without having to expect  data
       corruption. backup2l will gracefully adapt the new settings during the next run.

BUGS
       After a restore operation, the modification time of directories is equal to the restoration time while for files it is equal to the original modification time.

AUTHOR
       backup2l was written by Gundolf Kiefer <gundolfk at web.de>.

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either ver‐
       sion 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
       See the GNU General Public License for more details.

SEE ALSO
       tar(1), afio(1), find(1), grep(1), md5sum(1)

backup2l v1.6                                                                         April 17, 2016                                                                           BACKUP2L(8)
