MKREISERFS(8)                                                                     System Manager's Manual                                                                    MKREISERFS(8)

NAME
       mkreiserfs - The create tool for the Linux ReiserFS filesystem.

SYNOPSIS
       mkreiserfs  [ -dfV ] [ -b | --block-size N ] [ -h | --hash HASH ] [ -u | --uuid UUID ] [ -l | --label LABEL ] [ --format FORMAT ] [ -q | --quiet ] [ -j | --journal-device FILE ] [
       -s | --journal-size N ] [ -o | --journal-offset N ] [ -t | --transaction-max-size N ] [ -B | --badblocks file ]  device [ filesystem-size ]

DESCRIPTION
       mkreiserfs creates a Linux ReiserFS filesystem on a device (usually a disk partition).

       device is the special file corresponding to a device or to a partition (e.g /dev/hdXX for an IDE disk partition or /dev/sdXX for a SCSI disk partition).

       filesystem-size
              is the size in blocks of the filesystem. If omitted, mkreiserfs will automatically set it.

OPTIONS
       -b | --block-size N
              N is block size in bytes. It may only be set to a power of 2 within the 512-8192 interval.

       -h | --hash HASH
              HASH specifies which hash function will sort the names in the directories.  Choose from r5, rupasov, or tea. r5 is the default one.

       --format FORMAT
              FORMAT specifies the format for the new filsystem. Choose format 3.5 or 3.6. If none is specified mkreiserfs will create format 3.6 if running kernel is 2.4 or higher,  and
              format 3.5 if kernel 2.2 is running, and will refuse creation under all other kernels.

       -u | --uuid UUID
              Sets   the   Universally  Unique  IDentifier  of  the  filesystem  to  UUID (see  also  uuidgen(8)).  The  format  of  the  UUID  is  a  series of  hex  digits separated by
              hypthens, e.g.: "c1b9d5a2-f162-11cf-9ece-0020afc76f16".  If  the option  is skipped,  mkreiserfs  will by default generate a new UUID.

       -l | --label LABEL
              Sets  the  volume  label  of  the filesystem. LABEL can at most be 16 characters long; if it is longer than 16 characters, mkreiserfs will truncate it.

       -q | --quiet
              Sets mkreiserfs to work quietly without producing messages, progress or questions. It is useful, but only for use by end users, if you run mkreiserfs in a script.

       -j | --journal-device FILE
              FILE is the name of the block device on which is to be places the filesystem journal.

       -o | --journal-offset N
              N is the offset where the journal starts when it is to be on a separate device. Default is 0. N has no effect when the journal is to be on the host device.

       -s | --journal-size N
              N is the size of the journal in blocks. When the journal is to be on a separate device, its size defaults to the number of blocks that the device has.  When journal  is  to
              be  on  the  host device, its size defaults to 8193 and the maximal possible size is 32749 (for blocksize 4k). The minimum size is 513 blocks (whether the journal is on the
              host or on a separate device).

       -t | --transaction-max-size N
              N is the maximum transaction size parameter for the journal. The default, and max possible, value is 1024 blocks. It should be less than half the size of  the  journal.  If
              specified incorrectly, it will automatically be adjusted.

       -B | --badblocks file
              File is the file name of the file that contains the list of blocks to be marked as bad on the filesystem. This list can be created by /sbin/badblocks -b block-size device.

       -f     Forces  mkreiserfs  to  continue  even  when the device is the whole disk, looks mounted, or is not a block device. If -f is specified more than once, it allows the user to
              avoid asking for confirmation.

       -d     Sets mkreiserfs to print debugging information during mkreiserfs.

       -V     Prints the version and then exits.

AUTHOR
       This version of mkreiserfs has been written by Edward Shishkin <edward@namesys.com>.

BUGS
       Please report bugs to the ReiserFS developers <reiserfs-devel@vger.kernel.org>, providing as much information as possible--your hardware, kernel, patches,  settings,  all  printed
       messages; check the syslog file for any related information.

SEE ALSO
       reiserfsck(8), debugreiserfs(8), reiserfstune(8)

Reiserfsprogs-3.6.27                                                                   January 2009                                                                          MKREISERFS(8)
