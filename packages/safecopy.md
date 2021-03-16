  SAFECOPY
 
## NAME
        safecopy - rescue data from a source that causes IO errors
 
## SYNOPSIS
        safecopy [OPTION]... SOURCE DEST
 
## DESCRIPTION
        safecopy tries to get as much data from SOURCE as possible, even resorting to device specific low level operations if applicable.
 
        This is achieved by identifying problematic or damaged areas, skipping over them and continuing reading afterwards. The corresponding area in the destination
        file is either skipped (on initial creation that means padded with zeros) or deliberately filled with a recognizable pattern to later find affected files  on
        a corrupted device.
 
        Safecopy  uses  an  incremental  algorithm to identify the exact beginning and end of bad areas, allowing the user to trade minimum accesses to bad areas for
        thorough data resurrection.
 
        Multiple passes over the same file are possible, to first retrieve as much data from a device as possible with minimum harm, and then trying to retrieve some
        of the remaining data with increasingly aggressive read attempts.
 
        For  this  to work, the source device or file has to be seekable. For unseekable devices (like tapes) you can try to use an external script to execute a con‐
        trolled skip over the damaged part for you.
 
        (For example by using "mt seek" and "mt tell" on an SCSI tape device) See the "-S <seekscript>" parameter for details.
 
        Performance and success of this tool depend extremely on the device driver, firmware and underlying hardware.
 
        Currently safecopy supports RAW access to CDROM drives to read data directly of a CD, bypassing some driver dependent error correction.  This  can  speed  up
        data retrieval from CDs and reduce system load during recovery, as well as increase the success rate. Safecopy uses the disc status syscall to determine sec‐
        tor size and addressing of CDs. This fails on mixed-mode or multi-session CDs, since the sector layout can change within the disk, but would  still  work  on
        the  the  big  majority of disks. Other disks can still be recovered using normal high level data access. Safecopy auto-detects the disk type involved during
        scan for disk and block size.
 
        Some CD/DVD drives are known to cause the ATAPI bus to crash on errors, causing the device driver to freeze for times up to and beyond a  minute  per  error.
        Try to avoid using such drives for media recovery. Using safecopys low level access features might help under some circumstances.
 
        Some  drives  can read bad media better than others. Be sure to attempt data recovery of CDs and DVDs on several different drives and computers.  You can use
        safecopys incremental recovery feature to read previously unreadable sectors only.
 
 RELIABILITY
        Data recovery from damaged media is a delicate task, in the worst case its success or failure can safe or ruin whole companies and seal affected peoples per‐
        sonal fate. It is paramount that any tools written for that purpose are reliable and trustworthy.
 
        A  user  needs to know what exactly the software is doing to his hardware and data. The outcome of any operation needs to be both understandable and predict‐
        able.
 
        An "intelligent data resurrection wizard" with unknown complex internal behaviour may be a nifty tool, but does not meet the above requirements  of  predict‐
        able outcome, nor will the user know in advance what is done to his data.
 
        The  operation  sequence of safecopy has been kept relatively simple to assure this predictability. Unfortunately feature additions have risen the complexity
        and lead to undefined outcome in the past when include and exclude lists had been mixed, especially when mixing different block sizes. In the worst case this
        could have lead to overwritten data in the destination file on a later incremental run with the mark (-M) option.
 
        From  version  1.3  on, safecopy ships with a test suite that can be used to verify safecopys behaviour in a set of test cases, simulating the combination of
        bad blocks in input with different include and exclude lists, both with and without marking. Releases are only made if safecopy passes those test  cases  ac‐
        cording to the specification.
 
        This textual specification of behaviour of safecopy can be found in the file specification.txt shipped with safecopy.
 
## OPTIONS
        --stage1
               Preset to rescue most of the data fast, using no retries and avoiding bad areas.
 
               Presets: -f 10% -r 10% -R 1 -Z 0 -L 2 -M BaDbLoCk -o stage1.badblocks
 
        --stage2
               Preset to rescue more data, using no retries but searching for exact ends of bad areas.
 
               Presets: -f 128* -r 1* -R 1 -Z 0 -L 2 -I stage1.badblocks -o stage2.badblocks
 
        --stage3
               Preset to rescue everything that can be rescued using maximum retries, head realignment tricks and low level access.
 
               Presets: -f 1* -r 1* -R 4 -Z 1 -L 2 -I stage2.badblocks -o stage3.badblocks
 
        All stage presets can be overridden by individual options.
 
        -b <size>
               Blocksize for default read operations.  Set this to the physical sectorsize of your media.
 
               Default: 1*
               Hardware block size if reported by OS, otherwise 4096
 
        -f <size>
               Blocksize  in  bytes when skipping over badblocks.  Higher settings put less strain on your hardware, but you might miss good areas in between two bad
               ones.
 
               Default: 16*
 
        -r <size>
               Resolution in bytes when searching for the exact beginning or end of a bad area.  If you read data directly from a device there is no need to set this
               lower  than the hardware blocksize.  On mounted filesystems however, read blocks and physical blocks could be misaligned.  Smaller values lead to very
               thorough attempts to read data at the edge of damaged areas, but increase the strain on the damaged media.
 
               Default: 1*
 
        -R <number>
               At least that many read attempts are made on the first bad block of a damaged area with minimum resolution.  More retries can sometimes recover a weak
               sector, but at the cost of additional strain.
 
               Default: 3
 
        -Z <number>
               On  each error, force seek the read head from start to end of the source device as often as specified.  That takes time, creates additional strain and
               might not be supported by all devices or drivers.
 
               Default: 1
 
        -L <mode>
               Use low level device calls as specified:
 
               0    Do not use low level device calls
               1    Attempt low level device calls for error recovery only
               2    Always use low level device calls if available
 
               Supported low level features in this version are:
 
               SYSTEM  DEVICE TYPE   FEATURE
               Linux   cdrom/dvd     bus/device reset
               Linux   cdrom         read sector in raw mode
               Linux   floppy        controller reset, twaddle
 
               Default: 1
 
        --sync Use synchronized read calls (disable driver buffering).  Safecopy will use O_DIRECT if supported by the OS and O_SYNC otherwise.
 
               Default: Asynchronous read buffering by the OS is allowed
 
        --forceopen
               Keep trying to reopen the source after a read errer useful for USB drives that go away temporarily.
 
               Warning: This can cause safecopy to hang until aborted manually!
 
               Default:  Abort on fopen() error
 
        -s <blocks>
               Start position where to start reading.  Will correspond to position 0 in the destination file.
 
               Default: block 0
 
        -l <blocks>
               Maximum length of data to be read.
 
               Default: Entire size of input file
 
        -I <badblockfile>
               Incremental mode. Assume the target file already exists and has holes specified in the badblockfile.  It will be attempted to retrieve more data  from
               the listed blocks or from beyond the file size of the target file only.
 
               Warning: Without this option, the destination file will be emptied prior to writing.  Use -I /dev/null if you want to continue a previous run of safe‐
               copy without a badblock list.
 
               Implies: -c 0 if -c is not specified
 
               Default: none ( /dev/null if -c is given )
 
        -i <bytes>
               Blocksize to interpret the badblockfile given with -I.
 
               Default: Blocksize as specified by -b
 
        -c <blocks>
               Continue copying at this position.  This allows continuing if the output is a block device with a fixed size as opposed  to  a  growable  file,  where
               safecopy cannot determine how far it already got.  The blocksize used is the same as for the -I option.
               -c 0 will continue at the current destination size.
 
               Implies: -I /dev/null if -I is not specified
 
               Default: none ( 0 if -I is given )
 
        -X <badblockfile>
               Exclusion mode. If used together with -I, excluded blocks override included blocks. Safecopy will not read or write any data from areas covered by ex‐
               clude blocks.
 
               Default: none
 
        -x <bytes>
               Blocksize to interpret the badblockfile given with -X.
 
               Default: Blocksize as specified by -b
 
        -o <badblockfile>
               Write a badblocks/e2fsck compatible bad block file.
 
               Default: none
 
        -S <seekscript>
               Use external script for seeking in input file.  (Might be useful for tape devices and similar).  Seekscript must be an executable that takes the  num‐
               ber  of  blocks  to be skipped as argv1 (1-64) the blocksize in bytes as argv2 and the current position (in bytes) as argv3.  Return value needs to be
               the number of blocks successfully skipped, or 0 to indicate seek failure.  The external seekscript will only be used if lseek() fails and we  need  to
               skip over data.
 
               Default: none
 
        -M <string>
               Mark unrecovered data with this string instead of skipping it. This helps in later finding corrupted files on rescued file system images.  The default
               is to zero unreadable data on creation of output files, and leaving the data as it is on any later run.
 
               Warning: When used in combination with incremental mode (-I) this may overwrite data in any block that occurs in the -I file.  Blocks not  in  the  -I
               file, or covered by the file specified with -X are save from being overwritten.
 
               Default: none
 
        --debug <level>
               Enable debug output. Level is a bit field, add values together for more information:
                    program flow:       1
                    IO control:         2
                    badblock marking:   4
                    seeking:            8
                    incremental mode:   16
                    exclude mode:       32
               or for all debug output: 255
 
               Default: 0
 
        -T <timingfile>
               Write sector read timing information into this file for later analysis.
 
               Default: none
 
        -h, --help
               Show the program help text.
 
 PARAMETERS
        valid parameters for -f -r -b <size> options are:
 
        <integer>
               Amount in bytes - i.e. 1024
 
        <percentage>%
               Percentage of whole file/device size - e.g. 10%
 
        <number>*
               -b only, number times blocksize reported by OS
 
        <number>*
               -f and -r only, number times the value of -b
 
 OUTPUT
        description of output symbols:
 
        .      Between 1 and 1024 blocks successfully read.
 
        _      Read of block was incomplete. (possibly end of file) The blocksize is now reduced to read the rest.
 
        |/|    Seek failed, source can only be read sequentially.
 
        >      Read failed, reducing blocksize to read partial data.
 
        !      A low level error on read attempt of smallest allowed size leads to a retry attempt.
 
        [xx](+yy){
               Current block and number of bytes continuously read successfully up to this point.
 
        X      Read  failed on a block with minimum blocksize and is skipped.  Unrecoverable error, destination file is padded with zeros.  Data is now skipped until
               end of the unreadable area is reached.
 
        <      Successful read after the end of a bad area causes backtracking with smaller blocksizes to search for the first readable data.
 
        }[xx](+yy)
               current block and number of bytes of recent continuous unreadable data.
 
 HOWTO
        How do I...
 
        - resurrect a file from a mounted but damaged media, that copy will fail on:
               safecopy /path/to/problemfile ~/saved-file
 
        - create an filesystem image of a damaged disk/cdrom:
               safecopy /dev/device ~/diskimage
 
        - resurrect data as thoroughly as possible?
 
               safecopy source dest -f 1* -R 8 -Z 2
               (assuming logical misalignment of blocks to sectors)
 
               safecopy source dest -f 1* -r 1 -R 8 -Z 2
 
        - resurrect data as fast as possible, or
 
        - resurrect data with low risk of damaging the media further:
               (you can use even higher values for -f and -r)
 
               safecopy source dest -f 10% -R 0 -Z 0
 
        - resurrect some data fast, then read more data thoroughly later:
 
               safecopy source dest -f 10% -R 0 -Z 0 -o badblockfile
               safecopy source dest -f 1* -R 8 -Z 2 -I badblockfile
 
               Alternate approach using the new preset features:
 
               safecopy source dest --stage1
 
               safecopy source dest --stage2
 
               safecopy source dest --stage3
 
        - utilize some friends CD-ROM drives to complete the data from my damaged CD:
               safecopy /dev/mydrive imagefile <someoptions> -b <myblocksize> -o myblockfile
               safecopy /dev/otherdrive imagefile <someoptions> -b <otherblocksize> -I myblockfile -i <myblocksize> -o otherblockfile
               safecopy /dev/anotherdrive imagefile <someoptions> -b <anotherblocksize> -I otherblockfile -i <otherblocksize>
 
        - interrupt and later resume a data rescue operation:
               safecopy source dest
               <CTRL+C> (safecopy aborts)
               safecopy source dest -I /dev/null
 
        - interrupt and later resume a data rescue operation with correct badblocks output:
               safecopy source dest <options> -o badblockfile
               <CTRL+C> (safecopy aborts)
               mv badblockfile savedbadblockfile
               safecopy source dest -I /dev/null -o badblockfile
               cat badblockfile >>savedbadblockfile
 
        - interrupt and resume in incremental mode:
               (this needs a bit of bash scripting to get the correct badblock lists)
               safecopy source dest <options> -o badblockfile1
               safecopy source dest <options> -I badblockfile1 -o badblockfile2
               <CTRL+C> (safecopy aborts)
               latest=$( tail -n 1 badblockfile2 )
               if [ -z $latest ]; then latest=-1; fi;
               cat badblockfile1 | while read block; do
                    [ $block -gt $latest ] && echo $block >>badblockfile2;
               done;
               safecopy source dest <options> -I badblockfile2 -o badblockfile3
 
        - find the corrupted files on a partially successful rescued file system:
               safecopy /dev/filesystem image -M CoRrUpTeD
               fsck image
               mount -o loop image /mnt/mountpoint
               grep -R /mnt/mountpoint "CoRrUpTeD"
               (hint: this might not find all affected files if the unreadable parts are smaller in size than your marker string)
 
        - exclude the previously known badblocks list of a filesystem from filesystem image creation:
               dumpe2fs -b /dev/filesystem >badblocklist
               safecopy /dev/filesystem image -X badblocklist -x <blocksize of your fs>
 
        - create an image of a device that starts at X and is Y in size:
               safecopy /dev/filesystem -b <bsize> -s <X/bsize> -l <Y/bsize>
 
        - combine two partial images of rescued data without access to the actual (damaged) source data:
               (This is a bit tricky. You need to get badblocks lists for both files somehow to make safecopy know where the missing data is.  If  you  used  the  -M
               (mark)  feature you might be able to automatically compute these, however this feature is not provided by safecopy. Lets assume you have two badblocks
               files.
 
               you have:
               image1.dat
               image1.badblocks (blocksize1)
               image2.dat
               image2.badblocks (blocksize2)
 
               The file size of image1 needs to be greater or equal to that of image2. (If not, swap them) )
 
               cp image2.dat combined.dat
               safecopy image1.dat combined.dat -I image2.badblocks -i blocksize2 -X image1.badblocks -x blocksize1
               (This gets you the combined data, but no output badblocklist.  The resulting badblocks list would be the badblocks that are
               a: in both badblocks lists, or
               b: in image1.badblocks and beyond the file size of image2 It should be reasonably easy to solve this logic in a short shell script. One day this might
               be shipped with safecopy, until then consider this your chance to contribute to a random open source project.)
 
        - rescue data of a tape device:
               If  the  tape  device driver supports lseek(), treat it as any file, otherwise utilize the "-S" option of safecopy with a to be self-written script to
               skip over the bad blocks.  (for example using "mt seek") Make sure your tape device doesn't auto-rewind on close.  Send me feedback  if  you  had  any
               luck doing so, so I can update this documentation.
 
 FAQ
        Q:     Why create this tool if there already is something like dd-rescue and other tools for that purpose?
 
        A:     Because I didn't know of dd(-)rescue when I started, and I felt like it. Also I think safecopy suits the needs of a user in data loss peril better due
               to more readable output and more understandable options than some of the other tools.  (Then again I am biased. Compare them yourself) Meanwhile safe‐
               copy supports low level features other tools don't.
 
        Q:     What exactly does the -Z option do?
 
        A:     Remember  back in MS-DOS times when a floppy would make a "neek nark" sound 3 times every time when running into a read error?  This happened when the
               BIOS or DOS disk driver moved the IO head to its boundaries to possibly correct small cylinder misalignment, before it tried again.  Linux doesn't  do
               that  by default, neither do common CDROM drives or drivers.  Nevertheless forcing this behaviour can increase your chance of reading bad sectors from
               a CD __BIG__ time.  (Unlike floppies where it usually has little effect)
 
        Q:     Whats my best chance to resurrect a CD that has become unreadable?
 
        A:     Try making a backup image on many different computers and drives.  The abilities to read from bad media vary extremely. I have a 6 year  old  Lite  On
               CDRW  drive, that even reads deeply and purposely scratched CDs (as in with my key, to make it unreadable) flawlessly. A CDRW drive of the same age at
               work doesn't read any data from that part of the CD at all, while most DVD and combo drives have bad blocks every couple hundred bytes.  Make full use
               of safecopys RAW access features if applicable.  (-L 2 option)
 
               As a general guideline:
               -CDRW drives usually do better than read-only CD drives.
               -CD only drives sometimes do better on CDs than DVD drives.
               -PC drives are sometimes better than laptop ones.
               -A drive with a clean lens does better than a dirtball.
               -Cleaning up CDs helps.
               -Unless you use chemicals.
               -Using sticky tape on a CD will rip of the reflective layer permanently rendering the disk unreadable.
 
        Q:     Whats my best chance to resurrect a floppy that became unreadable?
 
        A:     Again  try  different floppy drives. Keep in mind that it might be easier to further damage data on a bad floppy than on a CD.  (Don't overdo read at‐
               tempts)
 
        Q:     What about BlueRay/HDDVD disks?
 
        A:     Hell if I knew, but generally they should be similar to DVDs.  It probably depends how the drives firmware acts up.
 
        Q:     My hard drive suddenly has many bad sectors, what should I do?
 
        A:     Speed is an essential factor when rescuing data from a bad hard drive.  Accesses to bad areas or even just time running can further damage  the  drive
               and make formerly readable areas unreadable, be it due to temperature rise, damaged heads scratching still good parts of the surface, bearings degrad‐
               ing due to vibration, etc.  Its advisable to shut the system down and remove the hard drive from the computer as soon as errors occur and as  fast  as
               possible without causing further damage.
 
               (Don't pull the plug! Press reset to force reboot and then power down via power button/ACPI)
 
               Set  up  a rescue system with enough disk space to store all the data from the damaged drive (and possibly multiple copies of it).  If you have an ex‐
               ternal hard drive case that connects via USB SATA or SCSI, allowing a hot plug of the drive into a running system, use it.  This allows you to prepare
               everything without the need for the drive to power up and possibly BIOS or operating system involuntarily accessing it.  You also get easier access to
               the drive to check temperature or noise during operation.
 
               When you rescue data, rescue good data first before attempting to access bad sectors. Safecopy allows you to skip known problem sectors using  a  bad‐
               block  exclude  file (-X) which you might be able to retrieve from system logs or from the drive internal logs, via smartmontools or similar software.
               Be aware that you might possibly need to convert physical sector numbers into logical block numbers depending on your source.
 
               Also you should tell safecopy to jump out of any problematic areas ASAP and continue somewhere else. Parameters "-f 10% -r 10% -R 0 -Z 0" would do the
               trick  by  making  safecopy  skip 10% of the device content and continue there without backtracking. You can always attempt to get the data in between
               later, first get the supposedly good data on the rest of the drive. Depending on the method of data recovery you plan on using, it may make  sense  to
               mark  the  bad  data  with the "-M" option.  This allows you to later find files affected by data corruption more easily.  Use the "-o" option to make
               safecopy write a badblock list with all blocks skipped or unreadable.
 
               When safecopy is done with this first run, you can attempt a second go trying to get more data. Using smaller values for "-f" and allowing safecopy to
               backtrack for the end of the affected area "-r 1*".  Be sure to use incremental mode "-I" to only read the blocks skipped in the first run.
 
               It  may make sense to let the drive cool down between runs.  Once you got all the data from the "good" areas of the drive you can risk more "thorough"
               access to it. Increase the numbers of retries "-R" in case of bad blocks, maybe together with a head realignment "-Z 1". "-f 1*" would  make  safecopy
               try to read on every single block, not skipping over bad areas at all.
 
               If your drive stops responding, power it down, let it cool down for a while, then try again.
 
               (I heard from people who brought dead drives back to live for a short time by cooling them to low temperatures with ice-packs.)
 
               !!!  If the data is really important, go to a professional data recovery specialist right away, before doing further damage to the drive.
 
## EXIST STATUS
        safecopy returns 0 (zero) if there were no unrecoverable errors.
        safecopy returns 1 if some data could not be recovered.
        safecopy returns 2 in case the copying was aborted due to error or signal.
 
## AUTHORS
        safecopy and its manpage have been designed and written by CorvusCorax.
 
## BUGS
        Please  use the project page on sourceforge <http://www.sf.net/projects/safecopy> to get in contact with project development if you encounter bugs or want to
        contribute to safecopy.
 
 COPYRIGHT
        Copyright © 2009 CorvusCorax
        This is free software.  You may redistribute copies of it under the terms of the GNU General Public License  version  2  or  above.   <http://www.gnu.org/li‐
        censes/gpl.html>.  There is NO WARRANTY, to the extent permitted by law.
 
## SEE ALSO
        Programs with a similar scope are among others
        ddrescue(1), dd-rescue(1), ...
 
                                                                              2012-03-10                                                                  SAFECOPY(1)
