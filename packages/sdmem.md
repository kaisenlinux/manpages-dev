SDMEM(1)                                                                          General Commands Manual                                                                         SDMEM(1)

NAME
       sdmem - secure memory wiper (secure_deletion toolkit)

SYNOPSIS
       sdmem [-f] [-l] [-l] [-v]

DESCRIPTION
       sdmem  is  designed  to  delete data which may lie still in your memory (RAM) in a secure manner which can not be recovered by thiefs, law enforcement or other threats.  Note that
       with the new SDRAMs, data will not wither away but will be kept static - it is easy to extract the necessary information!  The wipe algorythm is based on the paper  "Secure  Dele‐
       tion of Data from Magnetic and Solid-State Memory" presented at the 6th Usenix Security Symposium by Peter Gutmann, one of the leading civilian cryptographers.

       The secure data deletion process of sdmem goes like this:

       *      1 pass with 0x00

       *      5 random passes. /dev/urandom is used for a secure RNG if available.

       *      27 passes with special values defined by Peter Gutmann.

       *      5 random passes. /dev/urandom is used for a secure RNG if available.

COMMANDLINE OPTIONS
       -f     fast (and insecure mode): no /dev/urandom.

       -l     lessens the security. Only two passes are written: the first with 0x00 and a final random one.

       -l     -l for a second time lessons the security even more: only one pass with 0x00 is written.

       -v     verbose mode

NOTE
       This utility was originally called
              smem but was renamed for debian to avoid name clashes with another package.

BEWARE
       SLOW   Wiping the memory is very slow. You might use sdmem with the -ll option. (tip)

       BETA!  sdmem is still beta.

BUGS
       No bugs. There was never a bug in the secure_deletion package (in contrast to my other tools, whew, good luck ;-) Send me any that you find.  Patches are nice too :)

AUTHOR
       van Hauser / THC <vh@thc.org>

DISTRIBUTION
       The newest version of the secure_deletion package can be obtained from http://www.thc.org

       sdmem and the secure_deletion package is (C) 1997-2003 by van Hauser / THC (vh@thc.org)

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; Version 2.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
       See the GNU General Public License for more details.

SEE ALSO
       srm (1), sfill (1), sswap (1)

                                                                                                                                                                                  SDMEM(1)
