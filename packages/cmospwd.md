  CMOSPWD
 
## NAME
        cmospwd - a cmos/bios password recovery tool
 
## SYNOPSIS
        cmospwd [options]...
 
## DESCRIPTION
        This manual page documents briefly the cmospwd command.
 
## OPTIONS
        A summary of options is included below.
 
        -h, --help
               Usage information.
 
        /kfr, -kfr
               french AZERTY keyboard.
 
        /kde, -kde
               German QWERTZ keyboard.
 
        /d, -d Dump cmos.
 
        /k, -k Kill cmos.
 
        /R, -R Force mode.
 
        /w <cmos_backup_file>, -w <cmos_backup_file>, /s <cmos_backup_file>, -s <cmos_backup_file>
               Write cmos_backup_file.
 
        /l <cmos_backup_file>, -l <cmos_backup_file>
               Load cmos_backup_file.
 
        /r <cmos_backup_file>, -r <cmos_backup_file>
               Restore cmos_backup_file.
 
        /m0010011, -m0010011
               Execute module 3, 6 and 7.
 
## SEE ALSO
        dmidecode(8).
 
## AUTHOR
        cmospwd was written by GRENIER Christophe, grenier@cgsecurity.org.
 
        This manual page was written by Michael Prokop <mika@grml.org>, for the Debian project (but may be used by others).
 
                                                                             July 6, 2006                                                                  CMOSPWD(8)
