PSENSOR(1)                                                                             User Commands                                                                            PSENSOR(1)

NAME
       psensor - Temperature monitoring application

SYNOPSIS
       psensor [OPTION]...

DESCRIPTION
       Psensor is a GTK+ application for monitoring hardware sensors, including temperatures and fan speeds.

OPTIONS
       -h, --help
              display this help and exit

       -v, --version
              display version information and exit

       -u, --url=URL
              the URL of the psensor-server, example: http://hostname:3131

       -n, --new-instance
              force the creation of a new Psensor application

       -d, --debug=LEVEL
              set the debug level, integer between 0 and 3

REPORTING BUGS
       Report bugs to: jeanfi@gmail.com

       psensor home page: <http://wpitchoune.net/psensor>

COPYRIGHT
       Copyright © 2010-2014 jeanfi@gmail.com License GPLv2: GNU GPL version 2 or later <http://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       psensor-server(1), sensors(1), sensors-detect(8), hddtemp(8)

psensor 1.2.1                                                                          November 2021                                                                            PSENSOR(1)
