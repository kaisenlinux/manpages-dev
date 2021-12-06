fsck.exfat(8)                                                                     System Manager's Manual                                                                    fsck.exfat(8)

NAME
       fsck.exfat - check an exFAT filesystem

SYNOPSIS
       fsck.exfat [ -a ] [ -n ] [ -r ] [ -v ] [ -y ] [ -v ] device
       fsck.exfat -V

DESCRIPTION
       fsck.exfat checks an exFAT filesystem and repairs the filesystem depending on the options passed.

OPTIONS
       -a     This  option  does  the same thing as the -p option.  It is provided for backwards compatibility only;  it  is  suggested  that people use -p option whenever possible.

       -n     Check the filesystem but do not attempt to repair the filesystem.

       -p     Repair the filesystem without user interaction if it can be done safely.

       -r     Repair the filesystem interactively.

       -v     Prints verbose debugging information while checking the exFAT filesystem.

       -V     Prints the version number and exits.

       -y     Repair the filesystem answering yes to all questions.

SEE ALSO
       fsck(8), fstab(5),

                                                                                                                                                                             fsck.exfat(8)
