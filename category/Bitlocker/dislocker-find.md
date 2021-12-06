DISLOCKER-FIND(1)                                                                     DISLOCKER-FIND                                                                     DISLOCKER-FIND(1)

NAME
       Dislocker-find - Find BitLocker-encrypted volumes.

SYNOPSIS
       dislocker-find [-h] [files...]

DESCRIPTION
       The program try to find BitLocker-encrypted volumes or check that provided files are BitLocker-encrypted.

       It will print every file it find to be BitLocker-encrypted, one per line. Each file/line can be passed to the dislocker suite to be decrypted (`-V' option).

OPTIONS
       Program's options are described below:

       -h     print the help and exit

       files  check for BitLocker-encrypted partitions among these files instead of trying to find them alone

RETURN VALUES
       -1 means an error occurred, other numbers are the number of BitLocker-encrypted volumes found. For example, 0 means no volume has been found, 42 means 42 volumes have been found.

EXAMPLES
       No volume is found automatically, the program returns 0 volume found (the last line comes from the echo):

              # dislocker-find.rb ; echo $?
              No BitLocker volume found.
              0

       Two volumes are found, the program returns this number (the last line comes from the echo):

              # dislocker-find.rb ; echo $?
              /dev/sda3
              /dev/sda7
              2

AUTHOR
       This tool is developed by Romain Coltel on behalf of HSC (http://www.hsc.fr/)

       Feel free to send bugs report to <dislocker __AT__ hsc __DOT__ fr>

Linux                                                                                   2011-09-07                                                                       DISLOCKER-FIND(1)
