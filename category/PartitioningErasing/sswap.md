SSWAP(1)                                                                          General Commands Manual                                                                         SSWAP(1)

NAME
       sswap - secure swap wiper (secure_deletion toolkit)

SYNOPSIS
       sswap [-f] [-l] [-l] [-v] [-z] swapdevice

DESCRIPTION
       sswap  is designed to delete data which may lie still on your swapspace in a secure manner which can not be recovered by thieves, law enforcement or other threats.  The wipe algo‐
       rithm is based on the paper "Secure Deletion of Data from Magnetic and Solid-State Memory" presented at the 6th Usenix Security Symposium by Peter  Gutmann,  one  of  the  leading
       civilian cryptographers.

       The secure data deletion process of sswap goes like this:

       *      1 pass with 0xff

       *      5 random passes. /dev/urandom is used for a secure RNG if available.

       *      27 passes with special values defined by Peter Gutmann.

       *      5 random passes. /dev/urandom is used for a secure RNG if available.

COMMANDLINE OPTIONS
       -f     fast (and insecure mode): no /dev/urandom, no synchronize mode.

       -l     lessens the security. Only two passes are written: one mode with 0xff and a final mode with random values.

       -l     -l for a second time lessons the security even more: only one pass with random values is written.

       -v     verbose mode

       -z     wipes the last write with zeros instead of random data

BEWARE
       swapoff
              unmount your swapspace before using this tool! Otherwise your system might crash!

       BETA!  sswap is still beta. It was only tested on Linux but on this system it performed it's work all of the time.

BUGS
       No bugs. There was never a bug in the secure_deletion package (in contrast to my other tools, whew, good luck ;-) Send me any that you find.  Patches are nice too :)

AUTHOR
       van Hauser / THC <vh@thc.org>

DISTRIBUTION
       The newest version of the secure_deletion package can be obtained from http://www.thc.org

       sswap and the secure_deletion package is (C) 1997-2003 by van Hauser / THC (vh@thc.org)

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; Version 2.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
       See the GNU General Public License for more details.

SEE ALSO
       srm (1), sfill (1), sdmem (1)

                                                                                                                                                                                  SSWAP(1)
