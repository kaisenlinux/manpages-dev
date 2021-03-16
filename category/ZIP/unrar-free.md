UNRAR-FREE(1)                                                          General Commands Manual                                                         UNRAR-FREE(1)

NAME
       unrar-free — extract files from rar archives

SYNOPSIS
       unrar-free  [-xtfp?V]   [--extract]   [--list]   [--force]   [--extract-newer]   [--extract-no-paths]  [--password]  [--help]  [--usage]  [--version] ARCHIVE
       [FILE ...]       [DESTINATION]

DESCRIPTION
       unrar-free is a program for extracting files from rar archives.

OPTIONS
       These programs follow the usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options is included below.

       -x   --extract
                 Extract files from archive (default).

       -t   --list
                 List files in archive.

       -f   --force
                 Overwrite files when extracting.

       --extract-newer
                 Only extract newer files from the archive.

       --extract-no-paths
                 Don't create directories while extracting.

       -p   --password
                 Decrypt archive using a password.

       -?   --help
                 Show program help.

       --usage   Show short program usage message.

       -V           --version
                 Show version of program.

NON-FREE UNRAR COMPATIBLE SYNOPSIS
       unrar-free [elvx]  [-ep]  [-o+]  [-o-]  [-ppassword]  [-u]  [--] ARCHIVE  [FILE ...]          [DESTINATION]

       This syntax should only be used in front-end programs which are using non-free unrar as a back-end. It is recommended to use this program by GNU command line
       syntax.

       e         Extract files from archive without full path.

       l         List files in archive.

       v         Verbose list files in archive.

       x         Extract files from archive with full path.

       -ep       Don't create directories while extracting.

       -o+       Overwrite files when extracting.

       -o-       Don't overwrite files when extracting.

       -p        Decrypt archive using a password.

       -u        Only extract newer files from the archive.

       --        Disable further switch processing. Any switch after the -- are treated as filenames and destination.

BUGS
       Advanced features of version 3.0 archives are not currently supported.

AUTHORS
       unrar-free was written by Ben Asselstine based on UniquE RAR File Library by Christian Scheurer and Johannes Winkelmann.

       This  manual page was written by Niklas Vainio <niklas.vainio@iki.fi> for the Debian system (but may be used by others).  Permission is granted to copy, dis‐
       tribute and/or modify this document under the terms of the GNU General Public License, Version 2 any later version published by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

                                                                                                                                                       UNRAR-FREE(1)
