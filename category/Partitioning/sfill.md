SFILL(1)                                                               General Commands Manual                                                              SFILL(1)

NAME
       sfill - secure free disk and inode space wiper (secure_deletion toolkit)

SYNOPSIS
       sfill [-f] [-i] [-I] [-l] [-l] [-v] [-z] directory/mountpoint

DESCRIPTION
       sfill  is  designed  to  delete data which lies on available diskspace on mediums in a secure manner which can not be recovered by thiefs, law enforcement or
       other threats.  The wipe algorithm is based on the paper "Secure Deletion of Data from Magnetic and Solid-State Memory" presented at the 6th Usenix  Security
       Symposium by Peter Gutmann, one of the leading civilian cryptographers.

       The secure data deletion process of sfill goes like this:

       *      1 pass with 0xff

       *      5 random passes. /dev/urandom is used for a secure RNG if available.

       *      27 passes with special values defined by Peter Gutmann.

       *      5 random passes. /dev/urandom is used for a secure RNG if available.

       afterwards as many temporary files as possible are generated to wipe the free inode space. After no more temporary files can be created, they are removed and
       sfill is finnished.

COMMANDLINE OPTIONS
       -f     fast (and insecure mode): no /dev/urandom, no synchronize mode.

       -i     wipe only free inode space, not free disk space

       -I     wipe only free disk space, not free inode space

       -l     lessens the security. Only two passes are written: one mode with 0xff and a final mode with random values.

       -l     -l for a second time lessons the security even more: only one random pass is written.

       -v     verbose mode

       -z     wipes the last write with zeros instead of random data

       directory/mountpoint this is the location of the file created in your filesystem. It should lie on the partition you want to write.

LIMITATIONS
       FILESYSTEM INTELLIGENCE
              Most filesystems (ext2, ffs, etc.) have several features included to enhance performance, which will result in that sfill might not receive all avail‐
              able free space. Sad but true. Nothing can be done about that ...

       NFS    Beware of NFS. You can't ensure you really completely wiped your data from the remote disks. (especially because of caching)

       Raid   Raid Systems use stripped disks and have got large caches. It's hard to wipe them.

       swap   Some of your data might have a copy in your swapspace.  sswap is available for this task.

BUGS
       No  bugs.  There  was  never a bug in the secure_deletion package (in contrast to my other tools, whew, good luck ;-) Send me any that you find.  Patches are
       nice too :)

AUTHOR
       van Hauser / THC <vh@thc.org>

DISTRIBUTION
       The newest version of the secure_deletion package can be obtained from http://www.thc.org

       sfill and the secure_deletion package is (C) 1997-2003 by van Hauser / THC (vh@thc.org)

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the  Free  Software
       Foundation; Version 2.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
       A PARTICULAR PURPOSE. See the GNU General Public License for more details.

SEE ALSO
       srm (1), sswap (1), sdmem (1)

                                                                                                                                                            SFILL(1)
