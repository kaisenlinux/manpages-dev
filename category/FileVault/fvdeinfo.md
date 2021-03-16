fvdeinfo                                                                        LOCAL                                                                       fvdeinfo

NAME
     fvdeinfo — determines information about a FileVault Drive Encrypted (FVDE) volume

SYNOPSIS
     fvdeinfo [-e filename] [-o offset] [-p password] [-r password] [-hvV] source

DESCRIPTION
     fvdeinfo is a utility to determine information about a FileVault Drive Encrypted (FVDE) volume

     fvdeinfo is part of the libfvde package.  libfvde is a library to access the FileVault Drive Encryption (FVDE) format

     source is the source file.

     The options are as follows:

     -e filename
             specify the name of the EncryptedRoot.plist.wipekey file

     -h      shows this help

     -o offset
             specify the volume offset

     -p password
             specify the password

     -r password
             specify the recovery password

     -v      verbose output to stderr

     -V      print version

ENVIRONMENT
     None

FILES
     None

EXAMPLES
     # fvdeinfo -p Password /dev/sda1
     fvdeinfo 20121112

     Core Storage information:

     Physical volume:
             Size:                           262103040 bytes
             Encryption method:              AES XTS

     Logical volume:
             Size:                           224346112 bytes

DIAGNOSTICS
     Errors, verbose and debug output are printed to stderr when verbose output -v is enabled.  Verbose and debug output are only printed when enabled at compila‐
     tion.

BUGS
     Please report bugs of any kind to <joachim.metz@gmail.com> or on the project website: http://code.google.com/p/libfvde/

AUTHOR
     These man pages were written by Joachim Metz.

COPYRIGHT
     Copyright (C) 2011-2019, Joachim Metz <joachim.metz@gmail.com>.  This is free software; see the source for copying conditions. There is NO warranty; not even
     for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
     fvdemount(1)

libfvde                                                                   January 12, 2014                                                                   libfvde
