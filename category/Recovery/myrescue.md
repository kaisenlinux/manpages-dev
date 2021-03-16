myrescue(2)                                                              System Calls Manual                                                             myrescue(2)

NAME
       myrescue - Harddisc Rescue

SYNOPSIS
       myrescue  [-b block-size] [-B bitmap-file] [-A] [-S] [-r retry-count] [-f skip-failed] [-s start-block] [-e end-block] [-R] [-G good-range] [-F failed-range]
       [-T] [-J jump-after-blocks] [-U usb-device-file] input-file output-file

DESCRIPTION
       myrescue is a program to rescue the still-readable data from a damaged harddisk. It is similar in purpose to dd_rescue, but it can be run in multiple  passes
       and has options to avoid damaged areas to first handle the not yet damaged part of the disk.

       The program tries to copy the device blockwise to a file and keeps a table ("block bitmap") noting whether a block has been successfully copied, not yet han‐
       dled or has had errors. This block bitmap is used in successive passes to only read the not yet rescued blocks.

       The program has a special skip mode to handle read errors. Usually harddisk surface defects cover more than just one block and continuous reading  in  defect
       areas  can  damage the surface, the heads and (by permanent recalibration) the drive mechanics. If this happens, the chances of rescuing the remaining undam‐
       aged data drop dramatically. So in skip mode, myrescue tries to get out of damaged areas quickly by exponentially increasing the stepsize. The skipped blocks
       are marked as unhandled in the block bitmap and can be retried later.

       As  another  alternative,  the  program  can jump around on the disc, trying random blocks to first get an overview of the damage. In case of regular defects
       (e.g. an entire failed head) this can be used to determine the physical disc structure and to avoid these regions in the first run.

       Also there are options to avoid getting close to already recognized defects or stay in the proximity of good regions.

       Finally, the program has an option to multiply try to read a block before considering it damaged.

NOTE
       This tools is no replacement for a professional data recovery service!  If you do have the latter option, don't even think of using myrescue, as it may  fur‐
       ther  damage  your  disk. This tool is provided only for the case that you are absolutely desperate and definitely cannot afford a professional data recovery
       and know what you are doing.

       Data recovery - whether professional or DIY - is always careful detective work. Damaged drives deteriorate rapidly and behave nondeterministically,  you  may
       not get a second chance once you made a mistake. So you have to be fully aware of what you're doing and understand precisely what's happening. If you are un‐
       sure it's probably best to stop right now and ask a linux guru for assistance.

       In any case do not expect too much. While complete restores have been witnessed, you should not take them for granted. A better attitude is to consider  your
       data lost and be glad for any survivors that turn up.

       The  usual GPL disclaimer applies. Especially the NON-WARRANTY OF FITNESS FOR A PARTICULAR PURPOSE. Don't blame (or sue) me if it fails to recover or further
       damages your data.

       And a final word you probably don't want to hear in this situation: For the future consider a routinely backup to avoid a "next time".

OPTIONS
       -b block-size
              The size of the blocks (in bytes). Set this to your harddiscs error detection/correction unit size. Usually this is 4096, which happens to be the  de‐
              fault.

       -B bitmap-file
              The  file  containing  the status table of all blocks. Nice (or frightening...) to view with hexdump. 01 means OK; 02 means that the block was OK, but
              took a long time to read; 00 means not yet done; negative values mean the number of failed read attempts. If not given, defaults to output-file.bitmap

       -A     Abort when encountering errors.

       -S     Activate skip mode: When encountering errors increase the stepsize exponentially until a readable block is found.

       -f skip-failed
              Skip blocks that have already had skip-failed failures. Useful to avoid scratching the same block over and over again.

       -r retry-count
              The number of times to read a block before it is declared bad for this run. (You can still retry it on the next run.) Default: 1

       -s start-block
              The number of the block to start with. Default: 0

       -e end-block
              The number of the block, where reading stops (not included!).  Default: size of input-file divided by block-size.

       -R     Reverse reading direction, i.e. from end-block (excluded) to start-block

       -G good-range
              Only try to read blocks within good-range blocks from an already successfully read block.

       -F failed-range
              Extends -f to also skip any block within failed-range blocks of a block to be skipped as specified by -f.

       -T     Also avoid blocks, that were successfully read, but took an unusually long time to read. In case of growing defects, these blocks can mark the  bound‐
              aries of defective regions. This options makes -A, -S and -F treat such blocks as defective.

       -J jump-after-blocks
              Randomly  jump  across  the disc after reading jump-after-blocks blocks in both directions. This might be useful to scan discs with scattered defects.
              In jump mode -S causes myrescue to jump to a new block upon the first failed sector or upon hitting a sector to be skipped as specified by -f,  -G  or
              -F.

       -U usb-device-file
              (Linux-specific  feature)  Perform a bus reset for the specified usb-device-file after every failed read attempt.  Certain faulty SD cards will disap‐
              pear completely from the bus after a read error occurs and the USB reader has to be reset completely in order to continue.

       -h, -? Display usage information.

RECOMMENDED PROCEDURE
       NOTE: In data recovery every case needs special consideration and a specific approach - mindlessly running procedures is a bad idea. So consider the  follow‐
       ing  an  example,  keep a close eye on the process and be prepared to stop and reconsider if anything unusual happens. And once again: If you are feeling un‐
       sure, stop and ask someone experienced for assistance.

       •      Make sure you have sufficient disk space for twice the whole partition (complete partition size, not just the used amount of data) plus some space for
              the block bitmap (1 byte per block). Of course this should NOT be on the damaged disc.

       •      Determine  the  hardware block size (CRC/ECC unit) of your harddisk. This may be found out from hdparm, some entries in /proc/ide/hd? or on the web. I
              have not yet checked whether this is possible with an ioctl. If you have, please let me know.

       •      Start a skip mode run with one retry per block to first copy the undamaged area.

       •      Start a normal run with one retry per block to copy the remaining skipped blocks. You may try to use -f 1 to skip the damaged blocks  from  the  first
              run.

       •      Repeat until the number of errors seems to have converged.  Try waiting a couple of hours between the retries.

       •      Repeat this with higher retry counts and wait for convergence.

       •      Make  a  copy  of  the  rescued  data and run fsck on it. The copy is important! Running fsck is risky if blocks containing filesystem structures (su‐
              perblocks, directories, inodes, journal, ...) are missing. Sometimes the well-meant attempt to correct the filesystem can damage the  image  file,  so
              always work on a copy.

       •      Mount  the  filesystem (if copied to a file: via loopback) and check your data. If directory information has been destroyed, fsck moves unidentifiable
              file fragments to lost+found, so you should also check this location.

       It may help to try reading non-defect areas in between to allow the drive to recalibrate.

       The developers are glad to hear about your experiences. Please post them to the Experiences forum on the Sourceforge Project page. Thank you!

KNOWN BUGS
       The handling of the bitmap-file currently relies on the filesystem semantics, that when lseek(2) ing beyond the end of file and then writing,  the  space  in
       between is filled with zero-bytes.

       The block bitmap maxes out after 127 failed read attempts.

AUTHORS
       Kristof Koehler <kristofk@users.sourceforge.net>, Peter Schlaile <schlaile@users.sourceforge.net>

SEE ALSO
       dd(1), dd_rescue(no manpage?)

       http://www.google.de/search?q=data+recovery

       http://myrescue.sourceforge.net/

myrescue 0.9.6                                                              February 2018                                                                myrescue(2)
