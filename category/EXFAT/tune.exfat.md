tune.exfat(8)                                                                     System Manager's Manual                                                                    tune.exfat(8)

NAME
       tune.exfat - adjust tunable filesystem parameters on an exFAT filesystem

SYNOPSIS
       tune.exfat [ -l print-label ] [ -L set-label ] [ -i print-serial ] [ -I set-serial ] [ -v ] device
       tune.exfat -V

DESCRIPTION
       tune.exfat adjust tunable ondisk parameters of an existing exFAT filesystem.

OPTIONS
       -l print-label
              Print the volume label of the exFAT filesystem.

       -L set-label
              Set the volume label of the filesystem to the provided argument.

       -i print-serial
              Print the volume serial of the exFAT filesystem.

       -I set-serial
              Set the volume serial of the filesystem to the provided argument.

       -v     Prints verbose debugging information while extracting or tuning parameters of the exFAT filesystem.

       -V     Prints the version number and exits.

                                                                                                                                                                             tune.exfat(8)
