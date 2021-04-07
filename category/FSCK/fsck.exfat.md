EXFATFSCK(8)                                                                      System Manager's Manual                                                                     EXFATFSCK(8)

NAME
       exfatfsck - check an exFAT file system

SYNOPSIS
       exfatfsck [ -a | -n | -p | -y ] device
       exfatfsck [ -V ]

DESCRIPTION
       exfatfsck checks an exFAT file system for errors. It can repair some of them.

COMMAND LINE OPTIONS
       Command line options available:

       -a     Automatically repair the file system. No user intervention required.

       -n     No-operation mode: non-interactively check for errors, but don't write anything to the file system.

       -p     Same as -a for compatibility with other *fsck.

       -V     Print version and copyright.

       -y     Same as -a for compatibility with other *fsck.

EXIT CODES
       Zero is returned if errors were not found. Any other code means an error.

AUTHOR
       Andrew Nayenko

SEE ALSO
       fsck(8)

                                                                                      September 2018                                                                          EXFATFSCK(8)
