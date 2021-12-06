ecryptfs-verify(1)                                                                       eCryptfs                                                                       ecryptfs-verify(1)

NAME
       ecryptfs-verify - validate an eCryptfs encrypted home or encrypted private configuration

SYNOPSIS
       ecryptfs-verify [-h|--home] [-p|--private] [-e|--filenames-encrypted] [-n|--filenames-not-encrypted] [-u|--user USER] [--help]

OPTIONS
       -h, --home
              True if HOME is correctly configured for encryption, False otherwise

       -p, --private
              True if a non-HOME directory is correctly configured for encryption, False otherwise

       -e, --filenames-encrypted
              True if filenames are set for encryption, False otherwise

       -n, --filenames-not-encrypted
              True if filenames are not encrypted, False otherwise

       -u, --user USER
              By default, the current user's configuration is checked, override with this option

       --help This usage information

DESCRIPTION
       Note that options are additive.  ALL checks must pass in order for this program to exit 0.  Any failing check will cause this program to exit non-zero.

SEE ALSO
       http://ecryptfs.org/

AUTHOR
       This  manpage  was  written  by Dustin Kirkland <kirkland@ubuntu.com> for Ubuntu systems (but may be used by others).  Permission is granted to copy, distribute and/or modify this
       document under the terms of the GNU General Public License, Version 2 or any later version published by the Free Software Foundation.

       On Debian and Ubuntu systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

ecryptfs-utils                                                                          2012-01-24                                                                      ecryptfs-verify(1)
