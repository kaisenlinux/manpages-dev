  DUMP
 
## NAME
        dump - ext2/3/4 filesystem backup
 
## SYNOPSIS
        dump [-level#] [-ackMnqSuv] [-A file] [-B records] [-b blocksize] [-d density] [-D file] [-e inode numbers] [-E file] [-f file] [-F script] [-h level] [-I nr
        errors] [-jcompression level] [-L label] [-Q file] [-s feet] [-T date] [-y] [-zcompression level] files-to-dump
 
        dump [-W | -w]
 
## DESCRIPTION
        Dump examines files on an ext2/3/4 filesystem and determines which files need to be backed up. These files are copied to the given disk, tape or other  stor‐
        age medium for safe keeping (see the -f option below for doing remote backups). A dump that is larger than the output medium is broken into multiple volumes.
        On most media the size is determined by writing until an end-of-media indication is returned.
 
        On media that cannot reliably return an end-of-media indication (such as some cartridge tape drives), each volume is of a fixed size; the actual size is  de‐
        termined  by  specifying  cartridge  media, or via the tape size, density and/or block count options below. By default, the same output file name is used for
        each volume after prompting the operator to change media.
 
        files-to-dump is either a mountpoint of a filesystem or a list of files and directories to be backed up as a subset of a filesystem. In the former case,  ei‐
        ther  the  path  to  a  mounted  filesystem  or the device of an unmounted filesystem can be used. In the latter case, certain restrictions are placed on the
        backup: -u is not allowed, the only dump level that is supported is 0 and all the files and directories must reside on the same filesystem.
 
## OPTIONS
        The following options are supported by dump:
 
        -level#
               The dump level (any integer). A level 0, full backup, specified by -0 guarantees the entire file system is copied (but see also the -h option  below).
               A level number above 0, incremental backup, tells dump to copy all files new or modified since the last dump of a lower level. The default level is 0.
               Historically only levels 0 to 9 were usable in dump, this version is able to understand any integer as a dump level.
 
        -a     “auto-size”. Bypass all tape length calculations, and write until an end-of-media indication is returned.   This  works  best  for  most  modern  tape
               drives,  and  is  the  default. Use of this option is particularly recommended when appending to an existing tape, or using a tape drive with hardware
               compression (where you can never be sure about the compression ratio).
 
        -A archive_file
               Archive a dump table-of-contents in the specified archive_file to be used by restore(8) to determine whether a file is in the dump file that is  being
               restored.
 
        -b blocksize
               The number of kilobytes per dump record. The default blocksize is 10, unless the -d option has been used to specify a tape density of 6250BPI or more,
               in which case the default blocksize is 32. Th maximal value is 1024.  Note however that, since the IO system slices all requests into chunks of  MAXB‐
               SIZE (which can be as low as 64kB), you can experience problems with dump(8) and restore(8) when using a higher value, depending on your kernel and/or
               libC versions.
 
        -B records
               The number of 1 kB blocks per volume. Not normally required, as dump can detect end-of-media. When the specified size is reached, dump waits  for  you
               to  change  the  volume.  This option overrides the calculation of tape size based on length and density. If compression is on this limits the size of
               the compressed output per volume.  Multiple values may be given as a single argument separated by commas.  Each value will be used for one dump volume
               in the order listed; if dump creates more volumes than the number of values given, the last value will be used for the remaining volumes. This is use‐
               ful for filling up already partially filled media (and then continuing with full size volumes on empty media) or mixing media of different sizes.
 
        -c     Change the defaults for use with a cartridge tape drive, with a density of 8000 bpi, and a length of 1700 feet. Specifying a cartridge drive overrides
               the end-of-media detection.
 
        -d density
               Set tape density to density.  The default is 1600BPI. Specifying a tape density overrides the end-of-media detection.
 
        -D file
               Set the path name of the file storing the information about the previous full and incremental dumps. The default location is /var/lib/dumpdates.
 
        -e inodes
               Exclude inodes from the dump. The inodes parameter is a comma separated list of inode numbers (you can use stat(1) to find the inode number for a file
               or directory).
 
        -E file
               Read list of inodes to be excluded from the dump from the text file file.  The file file should be an ordinary file containing inode numbers separated
               by newlines.
 
        -f file
               Write  the  backup  to  file; file may be a special device file like /dev/st0 (a tape drive), /dev/rsd1c (a floppy disk drive), an ordinary file, or -
               (the standard output). Multiple file names may be given as a single argument separated by commas. Each file will be used for one dump  volume  in  the
               order listed; if the dump requires more volumes than the number of names given, the last file name will used for all remaining volumes after prompting
               for media changes. If the name of the file is of the form host:file or user@host:file dump writes to the named file on the remote host  (which  should
               already exist, dump doesn't create a new remote file) using rmt(8).  The default path name of the remote rmt(8) program is /etc/rmt; this can be over‐
               ridden by the environment variable RMT.
 
        -F script
               Run script at the end of each tape (except for the last one).  The device name and the current volume number are  passed  on  the  command  line.  The
               script  must  return  0  if  dump should continue without asking the user to change the tape, 1 if dump should continue but ask the user to change the
               tape. Any other exit code will cause dump to abort. For security reasons, dump reverts back to the real user ID and the real group ID  before  running
               the script.
 
        -h level
               Honor  the user nodump flag UF_NODUMP only for dumps at or above the given level.  The default honor level is 1, so that incremental backups omit such
               files but full backups retain them.
 
        -I nr errors
               By default, dump will ignore the first 32 read errors on the file system before asking for operator intervention. You can change this using this  flag
               to  any  value.  This  is  useful when running dump on an active filesystem where read errors simply indicate an inconsistency between the mapping and
               dumping passes.
 
               A value of 0 means that all read errors will be ignored.
 
        -jcompression level
               Compress every block to be written on the tape using bzlib library. This option will work only when dumping to a file or pipe or, when  dumping  to  a
               tape  drive,  if the tape drive is capable of writing variable length blocks. You will need at least the 0.4b24 version of restore in order to extract
               compressed tapes. Tapes written using compression will not be compatible with the BSD tape format. The (optional) parameter specifies the  compression
               level  bzlib  will  use. The default compression level is 2. If the optional parameter is specified, there should be no white space between the option
               letter and the parameter.
 
        -k     Use Kerberos authentication to talk to remote tape servers. (Only available if this option was enabled when dump was compiled.)
 
        -L label
               The user-supplied text string label is placed into the dump header, where tools like restore(8) and file(8) can access it. Note  that  this  label  is
               limited to be at most LBLSIZE (currently 16) characters, which must include the terminating \0.
 
        -m     If this flag is specified, dump will optimise the output for inodes having been changed but not modified since the last dump ('changed' and 'modified'
               have the meaning defined in stat(2) ). For those inodes, dump will save only the metadata, instead of saving the entire inode contents.  Inodes  which
               are either directories or have been modified since the last dump are saved in a regular way. Uses of this flag must be consistent, meaning that either
               every dump in an incremental dump set have the flag, or no one has it.
 
               If you use this option, be aware that many programs that unpack files from archives (e.g. tar, rpm, unzip, dpkg) may set files' mtimes to dates in the
               past.  Files installed in this way may not be dumped correctly using "dump -m" if the modified mtime is earlier than the previous level dump.
 
               Tapes written using such 'metadata only' inodes will not be compatible with the BSD tape format or older versions of restore.
 
        -M     Enable  the  multi-volume  feature. The name specified with f is treated as a prefix and dump writes in sequence to <prefix>001, <prefix>002 etc. This
               can be useful when dumping to files on an ext2/3/4 partition, in order to bypass the 2GB file size limitation.
 
        -n     Whenever dump requires operator attention, notify all operators in the group operator by means similar to a wall(1).
 
        -q     Make dump abort immediately whenever operator attention is required, without prompting in case of write errors, tape changes etc.
 
        -Q file
               Enable the Quick File Access support. Tape positions for each inode are stored into the file file which is used by restore (if called  with  parameter
               -Q  and  the  filename)  to  directly position the tape at the file restore is currently working on. This saves hours when restoring single files from
               large backups, saves the tapes and the drive's head.
 
               It is recommended to set up the st driver to return logical tape positions rather than physical before calling dump/restore with parameter -Q.   Since
               not  all  tape devices support physical tape positions those tape devices return an error during dump/restore when the st driver is set to the default
               physical setting.  Please see the st(4) man page, option MTSETDRVBUFFER , or the mt(1) man page, on how to set the driver to return logical tape posi‐
               tions.
 
               Before calling restore with parameter -Q, always make sure the st driver is set to return the same type of tape position used during the call to dump.
               Otherwise restore may be confused.
 
               This option can be used when dumping to local tapes (see above) or to local files.
 
        -s feet
               Attempt to calculate the amount of tape needed at a particular density. If this amount is exceeded, dump prompts for a new tape. It is recommended  to
               be a bit conservative on this option. The default tape length is 2300 feet. Specifying the tape size overrides end-of-media detection.
 
        -S     Size  estimate.  Determine the amount of space that is needed to perform the dump without actually doing it, and display the estimated number of bytes
               it will take. This is useful with incremental dumps to determine how many volumes of media will be needed.
 
        -T date
               Use the specified date as the starting time for the dump instead of the time determined from looking in /var/lib/dumpdates .  The format  of  date  is
               the  same as that of ctime(3) followed by an rfc822 timezone specification: either a plus or minus sign followed by two digits for the number of hours
               and two digits for the minutes.  For example, -0800 for eight hours west of Greenwich or +0230 for two hours and a half east of Greenwich. This  time‐
               zone offset takes into account daylight savings time (if applicable to the timezone): UTC offsets when daylight savings time is in effect will be dif‐
               ferent than offsets when daylight savings time is not in effect. For backward compatibility, if no timezone is specified, a  local  time  is  assumed.
               This option is useful for automated dump scripts that wish to dump over a specific period of time. The -T option is mutually exclusive from the -u op‐
               tion.
 
        -u     Update the file /var/lib/dumpdates after a successful dump. The format of /var/lib/dumpdates is readable by people,  consisting  of  one  free  format
               record per line: filesystem name, increment level and ctime(3) format dump date followed by a rfc822 timezone specification (see the -u option for de‐
               tails). If no timezone offset is specified, times are interpreted as local. Whenever the file is written, all dates in the file are converted  to  the
               local  time  zone, without changing the UTC times. There may be only one entry per filesystem at each level. The file /var/lib/dumpdates may be edited
               to change any of the fields, if necessary.
 
        -v     The -v (verbose) makes dump to print extra information which could be helpful in debug sessions.
 
        -W     Dump tells the operator what file systems need to be dumped. This information is gleaned from the files /var/lib/dumpdates and /etc/fstab.  The -W op‐
               tion  causes dump to print out, for all file systems in /var/lib/dumpdates , and recognized file systems in /etc/mtab and /etc/fstab.  the most recent
               dump date and level, and highlights those that should be dumped. If the -W option is set, all other options are ignored, and dump exits immediately.
 
        -w     Is like -W, but prints only recognized filesystems in /etc/mtab and /etc/fstab which need to be dumped.
 
        -y     Compress every block to be written to the tape using the lzo library.  This doesn't compress as well as the zlib library but it's much  faster.   This
               option will work only when dumping to a file or pipe or, when dumping to a tape drive, if the tape drive is capable of writing variable length blocks.
               You will need at least the 0.4b34 version of restore in order to extract compressed tapes. Tapes written using compression will not be compatible with
               the BSD tape format.
 
        -zcompression level
               Compress  every  block  to  be written on the tape using zlib library. This option will work only when dumping to a file or pipe or, when dumping to a
               tape drive, if the tape drive is capable of writing variable length blocks. You will need at least the 0.4b22 version of restore in order  to  extract
               compressed  tapes. Tapes written using compression will not be compatible with the BSD tape format. The (optional) parameter specifies the compression
               level zlib will use. The default compression level is 2. If the optional parameter is specified, there should be no white  space  between  the  option
               letter and the parameter.
 
        Dump  requires  operator  intervention  on these conditions: end of tape, end of dump, tape write error, tape open error or disk read error (if there is more
        than a threshold of nr errors). In addition to alerting all operators implied by the -n key, dump interacts with the operator on dump's control  terminal  at
        times when dump can no longer proceed, or if something is grossly wrong. All questions dump poses must be answered by typing “yes” or “no”, appropriately.
 
        Since  making a dump involves a lot of time and effort for full dumps, dump checkpoints itself at the start of each tape volume. If writing that volume fails
        for some reason, dump will, with operator permission, restart itself from the checkpoint after the old tape has been rewound and removed, and a new tape  has
        been mounted.
 
        Dump tells the operator what is going on at periodic intervals, including usually low estimates of the number of blocks to write, the number of tapes it will
        take, the time to completion, and the time to the tape change. The output is verbose, so that others know that the terminal controlling  dump  is  busy,  and
        will be for some time.
 
        In  the event of a catastrophic disk event, the time required to restore all the necessary backup tapes or files to disk can be kept to a minimum by stagger‐
        ing the incremental dumps. An efficient method of staggering incremental dumps to minimize the number of tapes follows:
 
        —      Always start with a level 0 backup, for example:
                      /sbin/dump -0u -f /dev/st0 /usr/src
 
               This should be done at set intervals, say once a month or once every two months, and on a set of fresh tapes that is saved forever.
 
        —      After a level 0, dumps of active file systems are taken on a daily basis, with this sequence of dump levels:
                      3 2 5 4 7 6 9 8 9 9 ...
 
               For the daily dumps, it should be possible to use a fixed number of tapes for each day, used on a weekly basis. Each week, a level 1  dump  is  taken,
               and the daily Hanoi sequence repeats beginning with 3. For weekly dumps, another fixed set of tapes per dumped file system is used, also on a cyclical
               basis.
 
        After several months or so, the daily and weekly tapes should get rotated out of the dump cycle and fresh tapes brought in.
 
        Another backup strategy is the Tower of Hanoi sequence, which reuses older tapes in a way that for newer dates the available restore  points  are  more  fre‐
        quent, then for older dates (see http://en.wikipedia.org/wiki/Backup_rotation_scheme for additional information).
 
        (The 4.3BSD option syntax is implemented for backward compatibility but is not documented here.)
 
## ENVIRONMENT
        TAPE   If  no  -f  option was specified, dump will use the device specified via TAPE as the dump device.  TAPE may be of the form tapename, host:tapename, or
               user@host:tapename.
 
        RMT    The environment variable RMT will be used to determine the pathname of the remote rmt(8) program.
 
        RSH    Dump uses the contents of this variable to determine the name of the remote shell command to use when doing remote backups (rsh, ssh  etc.).  If  this
               variable is not set, rcmd(3) will be used, but only root will be able to do remote backups.
 
## FILES
        /dev/st0
               default tape unit to dump to
 
        /var/lib/dumpdates
               dump date records
 
        /etc/fstab
               dump table: file systems and frequency
 
        /etc/mtab
               dump table: mounted file systems
 
        /etc/group
               to find group operator
 
## SEE ALSO
        fstab(5), restore(8), rmt(8)
 
 DIAGNOSTICS
        Many, and verbose.
 
 COMPATIBILITY
        The  format of the /var/lib/dumpdates file has changed in release 0.4b34, however, the file will be read correctly with either pre-0.4b34 or 0.4b34 and later
        versions of dump provided that the machine on which dump is run did not change timezones (which should be a fairly rare occurrence).
 
## EXIST STATUS
        Dump exits with zero status on success. Startup errors are indicated with an exit code of 1; abnormal termination is indicated with an exit code of 3.
 
## BUGS
        It might be considered a bug that this version of dump can only handle ext2/3/4 filesystems.  Specifically, it does not work with FAT filesystems.
 
        Fewer than 32 read errors (change this with -I) on the filesystem are ignored. If noticing read errors is important, the output from dump can  be  parsed  to
        look for lines that contain the text 'read error'.
 
        When a read error occurs, dump prints out the corresponding physical disk block and sector number and the ext2/3/4 logical block number. It doesn't print out
        the corresponding file name or even the inode number. The user has to use debugfs(8), commands ncheck and icheck to translate the ext2blk number printed  out
        by dump into an inode number, then into a file name.
 
        Each reel requires a new process, so parent processes for reels already written just hang around until the entire tape is written.
 
        The estimated number of tapes is not correct if compression is on.
 
        It  would  be  nice if dump knew about the dump sequence, kept track of the tapes scribbled on, told the operator which tape to mount when, and provided more
        assistance for the operator running restore.
 
        Dump cannot do remote backups without being run as root, due to its security history.  Presently, it works if you set it setuid (like it  used  to  be),  but
        this might constitute a security risk. Note that you can set RSH to use a remote shell program instead.
 
## AUTHOR
        The  dump/restore backup suite was ported to Linux's Second Extended File System by Remy Card <card@Linux.EU.Org>. He maintained the initial versions of dump
        (up and including 0.4b4, released in January 1997).
 
        Starting with 0.4b5, the new maintainer is Stelian Pop <stelian@popies.net>.
 
 AVAILABILITY
        The dump/restore backup suite is available from <http://dump.sourceforge.net>
 
 HISTORY
        A dump command appeared in Version 6 AT&T UNIX.
 
 BSD                                                                      version 0.4b46 of                                                                   DUMP(8)
