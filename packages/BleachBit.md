BLEACHBIT(1)                                                                             User Commands                                                                             BLEACHBIT(1)

NAME
       bleachbit - Delete unnecessary files from the system

SYNOPSIS
       bleachbit [options] cleaner.option1 [cleaner.option2 ...]

DESCRIPTION
       BleachBit deletes unnecessary files to free valuable disk space, maintain privacy, and remove junk. Rid your system of old clutter including cache, temporary files, cookies, and broken
       shortcuts.  It wipes clean Bash, Beagle, Epiphany, Firefox, Flash, Java, KDE, OpenOffice.org, Opera, RealPlayer, rpmbuild, VIM, XChat, and more.

       This is the command line interface for BleachBit.

OPTIONS
       -h, --help
              show this help message and exit

       -l, --list-cleaners
              list cleaners

       -c, --clean
              run cleaners to delete files and make other permanent changes

       --debug
              set log level to verbose

       --debug-log=DEBUG_LOG
              log debug messages to file

       -s, --shred
              shred specific files or folders

       --sysinfo
              show system information

       --gui  launch the graphical interface

       -p, --preview
              preview files to be deleted and other changes

       --preset
              use options set in the graphical interface

       -w, --wipe-free-space
              wipe free space in the given paths

       -v, --version
              output version information and exit

       -o, --overwrite
              overwrite files to hide contents

COPYRIGHT
       This manual page is Copyright © 2019 Hugo Lefeuvre <hle@debian.org>.  Permission is granted to copy, distribute and/or modify this document under the terms of the  GNU  General  Public
       License, Version 3 or any later version published by the Free Software Foundation.

bleachbit                                                                                 October 2019                                                                             BLEACHBIT(1)
