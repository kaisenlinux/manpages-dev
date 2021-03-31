OPHCRACK(1)                                                                              User Commands                                                                              OPHCRACK(1)

NAME
       Ophcrack - a Microsoft Windows password cracker using rainbow tables.

DESCRIPTION
       Ophcrack is a Windows password cracker based on a time-memory trade-off using rainbow tables.
       This is a new variant of Hellman's original trade-off, with better performance.
       It recovers 99.9% of alphanumeric passwords in seconds.

       Ophcrack works for Windows NT/2000/XP/Vista.

       Ophcrack can be used with command line using the options below, or can be run as a pure graphical software.

       If you have installed ophrack-cli package, graphical interface is not available.

SYNOPSIS
       ophcrack [options]

OPTIONS
       -a     disable audit mode (default)

       -A     enable audit mode

       -b     disable bruteforce

       -B     enable bruteforce (default)

       -c <file>
              specify the config file to use

       -D     display (lots of!) debugging information

       -d <dir>
              specify tables base directory

       -e     do not display empty passwords

       -f <file>
              load hashes from the specified file (pwdump or session)

       -g     disable GUI

       -h     display this information

       -i     hide usernames

       -I     show usernames (default)

       -l <file>
              log all output to the specified file

       -n <num>
              specify the number of threads to use

       -o <file>
              write cracking output to file in pwdump format

       -q     quiet mode

       -r     launch the cracking when ophcrack starts (GUI only)

       -s     disable session auto-saving

       -S <session_file>
              specify the file to use to automatically save the progress of the search

       -u     display statistics when cracking ends

       -t table1[,a[,b,...]][:table2[,a[,b,...]]]
              specify which table to use in the directory given by -d

       -v     verbose

       -w <dir>
              load hashes from encrypted SAM file in directory dir

       -x     export data in CSV format to the file specified by -o

EXAMPLES
       ophcrack -g -d /path/to/tables -t xp_free_fast,0,3:vista_free -f in.txt

       Launch ophcrack in command line using tables 0 and 3 in /path/to/tables/xp_free_fast and all tables in /path/to/tables/vista_free and cracks hashes from pwdump file in.txt

SEE ALSO
       Homepage: http://ophcrack.sourceforge.net/
       Free rainbow tables: http://ophcrack.sourceforge.net/tables.php

AUTHOR
       This manual page was written by Adam Cecile <gandalf@le-vert.net> for the Debian system (but may be used by others).
       Permission  is  granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 or any later version published by the Free Software
       Foundation
       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

3.2.0                                                                                      March 2009                                                                               OPHCRACK(1)
