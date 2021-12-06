ecryptfs-migrate-home(8)                                                                 eCryptfs                                                                 ecryptfs-migrate-home(8)

NAME
       ecryptfs-migrate-home - migrate a user's home directory to an encrypted home setup

SYNOPSIS
       ecryptfs-migrate-home [-u|--user USER]

OPTIONS
       -u, --user USER
              Migrate USER's home directory to an encrypted home directory

DESCRIPTION
       WARNING: Make a complete backup copy of the non-encrypted data to another system or external media. This script is dangerous and in case of an error, could result in data lost, or
       USER locked out of the system!

       This program must be executed by root.

       This program will attempt to migrate a user's home directory to an encrypted home directory.

       This program requires free disk space 2.5x the current size of the home directory to be migrated.  Once successful, you can recover most of this space by  deleting  the  cleartext
       directory.

       The USER must be logged out of all sessions in order to perform the migration, and have no open files according to lsof(1).

       Once the migration has completed, the USER must login immediately, BEFORE THE NEXT REBOOT in order to complete the migration.

       After  logging  in,  if  USER  can  read and write files in their home directory successfully, then the migration has completed successfully and can remove the cleartext backup in
       /home/.

       After a successful migration, the USER really must run ecryptfs-unwrap-passphrase(1) or zescrow(1) and record their randomly generated mount passphrase.

       If swap is not already encrypted, it is highly recommended that your administrator setup encrypted swap using ecryptfs-setup-swap(1).

SEE ALSO
       ecryptfs-unwrap-passphrase(1), ecryptfs-setup-private(1), ecryptfs-setup-swap(1), lsof(1), rsync(1), zescrow(1)

       http://ecryptfs.org/

AUTHOR
       This manpage was written by Dustin Kirkland <kirkland@ubuntu.com> for Ubuntu systems (but may be used by others).  Permission is granted to copy,  distribute  and/or  modify  this
       document under the terms of the GNU General Public License, Version 2 or any later version published by the Free Software Foundation.

       On Debian and Ubuntu systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

ecryptfs-utils                                                                          2012-01-24                                                                ecryptfs-migrate-home(8)
