bdeinfo                                                                                      LOCAL                                                                                      bdeinfo

NAME
     bdeinfo — determines information about a BitLocker Drive Encrypted (BDE) volume

SYNOPSIS
     bdeinfo [-k keys] [-o offset] [-p password] [-r password] [-s filename] [-hvV] source

DESCRIPTION
     bdeinfo is a utility to determine information about a BitLocker Drive Encrypted (BDE) volume

     bdeinfo is part of the libbde package.  libbde is a library to access the BitLocker Drive Encryption (BDE) format

     source is the source file.

     The options are as follows:

     -h      shows this help

     -k keys
             the full volume encryption key and tweak key formatted in base16 and separated by a : character e.g. FKEV:TWEAK

     -o offset
             specify the volume offset in bytes

     fl p password
             specify the password

     -r password
             specify the recovery password

     -s filename
             specify the file containing the startup key.  typically this file has the extension .BEK

     -v      verbose output to stderr

     -V      print version

ENVIRONMENT
     None

FILES
     None

EXAMPLES
     # bdeinfo -p Password /dev/sda1
     bdeinfo 20140403

     BitLocker Drive Encryption information:
             Encryption method:              AES 128-bit
             Volume identifier:              a31a8153-5dc1-4bc3-a5b8-e6d77a17c4c0
             Creation time:                  Aug 05, 2011 11:04:38.739926900 UTC
             Description                     :MYPC BDE TEST 8/5/2011
             Number of key protectors:       2

     Key protector 0:
             Identifier:                     240c5287-d4a5-4f2d-8d38-06a2e563257f
             Type:                           Password

     Key protector 1:
             Identifier:                     e70fad99-e63f-45c1-92e0-1cadabe08ae9
             Type:                           Recovery password

DIAGNOSTICS
     Errors, verbose and debug output are printed to stderr when verbose output -v is enabled.  Verbose and debug output are only printed when enabled at compilation.

BUGS
     Please report bugs of any kind to <joachim.metz@gmail.com> or on the project website: https://github.com/libyal/libbde/

AUTHOR
     These man pages were written by Joachim Metz.

COPYRIGHT
     Copyright (C) 2011-2019, Joachim Metz <joachim.metz@gmail.com>.  This is free software; see the source for copying conditions. There is NO warranty; not even for MERCHANTABILITY or FIT‐
     NESS FOR A PARTICULAR PURPOSE.

SEE ALSO
     bdemount(1)

libbde                                                                                  August 31, 2014                                                                                  libbde
