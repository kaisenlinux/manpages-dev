  SRM
 
## NAME
        srm - secure remove (secure_deletion toolkit)
 
## SYNOPSIS
        srm [-d] [-f] [-l] [-l] [-r] [-v] [-z] files
 
## DESCRIPTION
        srm  is  designed to delete data on mediums in a secure manner which can not be recovered by thiefs, law enforcement or other threats.  The wipe algorythm is
        based on the paper "Secure Deletion of Data from Magnetic and Solid-State Memory" presented at the 6th Usenix Security Symposium by Peter Gutmann, one of the
        leading civilian cryptographers.
 
        The secure data deletion process of srm goes like this:
 
        *      1 pass with 0xff
 
        *      5 random passes. /dev/urandom is used for a secure RNG if available.
 
        *      27 passes with special values defined by Peter Gutmann.
 
        *      5 random passes. /dev/urandom is used for a secure RNG if available.
 
        *      Rename the file to a random value
 
        *      Truncate the file
 
        As  an  additional measure of security, the file is opened in O_SYNC mode and after each pass an fsync() call is done.  srm writes 32k blocks for the purpose
        of speed, filling buffers of disk caches to force them to flush and overwriting old data which belonged to the file.
 
 COMMANDLINE## OPTIONS
        -d     ignore the two special dot files . and .. on the commandline. (so you can execute it like "srm -d .* *")
 
        -f     fast (and insecure mode): no /dev/urandom, no synchronize mode.
 
        -l     lessens the security. Only two passes are written: one mode with 0xff and a final mode random values.
 
        -l     -l for a second time lessons the security even more: only one random pass is written.
 
        -r     recursive mode, deletes all subdirectories.
 
        -v     verbose mode
 
        -z     wipes the last write with zeros instead of random data
 
 LIMITATIONS
        NFS    Beware of NFS. You can't ensure you really completely wiped your data from the remote disks.
 
        Raid   Raid Systems use stripped disks and have got large caches. It's hard to wipe them.
 
        swap, /tmp, etc.
               Some of your data might have a temporary (deleted) copy somewhere on the disk. You should use sfill which comes with the  secure_deletion  package  to
               ensure  to  wipe  also the free diskspace. However, If already a small file acquired a block with your precious data, no tool known to me can help you
               here. For a secure deletion of the swap space sswap is available.
 
## BUGS
        No bugs. There was never a bug in the secure_deletion package (in contrast to my other tools, whew, good luck ;-) Send me any that  you  find.   Patches  are
        nice too :)
 
## AUTHOR
        van Hauser / THC <vh@thc.org>
 
 DISTRIBUTION
        The newest version of the secure_deletion package can be obtained from http://www.thc.org
 
        srm and the secure_deletion package is (C) 1997-2003 by van Hauser / THC (vh@thc.org)
 
        This  program  is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software
        Foundation; Version 2.
 
        This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
        A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 
## SEE ALSO
        sfill (1), sswap (1), sdmem (1)
 
                                                                                                                                                               SRM(1)
