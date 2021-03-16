NTFSUSERMAP(8)                                                         System Manager's Manual                                                        NTFSUSERMAP(8)

NAME
       ntfsusermap - NTFS Building a User Mapping File

SYNOPSIS
       ntfsusermap windows-system-device [other-ntfs-device...]

       Where windows-system-device is the device containing the Windows system whose users are to be mapped to current Linux system.

       And other-ntfs-device is another device containing files which are to be accessed both by the Windows mentioned above and current Linux system.

       the ntfsusermap command must be started as root, and the designated devices must not be mounted.

       Typing ntfsusermap with no args will display a summary of command arguments.

DESCRIPTION
       ntfsusermap  creates the file defining the mapping of Windows accounts to Linux logins for users who owns files which should be visible from both Windows and
       Linux.

       It relies on existing files which were created on Windows, trying to locate significant files and asking which Linux user or group should own  them.  When  a
       Linux owner or group is requested, the reply may be :

       - the uid or gid (numeric or symbolic) of Linux owner or group of the file.
              In that situation, no more file with the same Windows owner will be selected.
       - or no answer, when not able to define the owner or group.
              In that situation another file owned by the same Windows user or group may be selected later so that a mapping can be defined.

       The  mappings  for standard Windows users, such as "Administrator" or "All Users" are defined implicitly. As a consequence a user mapping should never be de‐
       fined as Linux root.

       When there are no more significant files, ntfsusermap create the mapping file into the file UserMapping in the current directory. This file has to  be  moved
       to  the  hidden  directory  .NTFS-3G  in  the  root  of all the NTFS file systems to be shared between Windows and Linux. This requires the file system to be
       mounted, but the created file will not be taken into account if not present at mount time, which means the file system has to be unmounted and mounted  again
       for the new mapping file to be taken into account.

OPTIONS
       No option is defined for ntfsusermap.

EXAMPLES
       Map the users defined on the Windows system present on /dev/sda1 :

              ntfsusermap /dev/sda1

       A detailed example, with screen displays is available on http://jp-andre.pagesperso-orange.fr/ntfsusermap.html

EXIT CODES
       ntfsusermap exits with a value of 0 when no error was detected, and with a value of 1 when an error was detected.

KNOWN ISSUES
       Please see

              http://www.tuxera.com/community/ntfs-3g-faq/

       for  common questions and known issues.  If you would find a new one in the latest release of the software then please send an email describing it in detail.
       You can contact the development team on the ntfs-3g-devel@lists.sf.net address.

AUTHORS
       ntfs-3g.secaudit has been developed by Jean-Pierre André.

THANKS
       Several people made heroic efforts, often over five or more years which resulted the ntfs-3g driver. Most importantly they are  Anton  Altaparmakov,  Richard
       Russon, Szabolcs Szakacsits, Yura Pakhuchiy, Yuval Fledel, and the author of the groundbreaking FUSE filesystem development framework, Miklos Szeredi.

SEE ALSO
       ntfsprogs(8), attr(5), getfattr(1)

ntfsusermap 1.2.0                                                           February 2016                                                             NTFSUSERMAP(8)
