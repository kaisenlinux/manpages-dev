ETHSTATUS(1)                                                                        General Commands Manual                                                                        ETHSTATUS(1)

NAME
       ethstatus - Console-based ethernet statistics monitor

SYNOPSIS
       ethstatus [ -h ] [ -i interface ] [ -v videomode ] [ -S bps[k|m|g] ] [ -s speed ] (backward compatibility)

DESCRIPTION
       ethstatus is a console-based monitoring utility for displaying statistical data of the ethernet interface on a quantity basis.

OPTIONS
       The following options can be provided:

       -i     Specify the ethernet interface which shall be monitored. Default is 'eth0'.

       -v     Set the video mode used by curses. Possible choices are 'vga' (the default) and 'mono' (useful for black-and-white monitors).

       -S     Set the maximum network speed in bits per second. ethstatus knows about the kilo (k), mega (m) and giga (g) modifiers. So you can specify the speed as e.g. 64k or 100m or 1g.

       -s     Set  the  maximum  network speed. Possible values are '10' (=10 Mbps), ´100' (=100 Mbps), '64' (=64 kbps), '128' (=128 kbps), 256 (=256 kbps), ´768' (=768 kbps) or '1540' (=1540
              kbps). This option is provided for backward compatibility to prior versions of ethstatus. Please use the -S parameter instead.

       AUTHORS
              The original program was written by Gabriel Montenegro <johnpetrucci@users.sourceforge.net>. Bug fixes, code cleanup, different improvements and this manual page  were  provided
              by Christoph Haas <email@christoph-haas.de> for the Debian GNU/Linux system.

                                                                                          May  1, 2003                                                                             ETHSTATUS(1)
