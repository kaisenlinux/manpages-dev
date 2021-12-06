WONDERSHAPER(8)                                                                   System Manager's Manual                                                                  WONDERSHAPER(8)

NAME
       wondershaper - simple traffic shaping script

SYNOPSIS
       wondershaper [interface]
       wondershaper clear [interface]
       wondershaper [interface] [downlink] [uplink]

DESCRIPTION
       This manual page documents briefly the wondershaper script.  This manual page was written for the Debian distribution because the original script does not have a manual page.

       wondershaper  is  a traffic shaping script that provides low latency, prioritizes bulk transfers below normal web traffic, prioritizes interactive shells above normal web traffic,
       and attempts to prevent upload and download traffic from affecting each other's ack packets.  Put simply, the wondershaper makes your internet connection more "responsive"

SYNTAX
       A summary of wondershaper syntax is included below.  For a complete description, see the files in /usr/share/doc/wondershaper.

       wondershaper [ interface ]
              Shows the status of traffic shaping on that interface.

       wondershaper clear [ interface ]
              Removes all traffic shaping from that interface.

       wondershaper [ interface ] [ downlink ] [ uplink ]
              Configures the wondershaper on the specified interface, given the specified downlink speed in kilobits per second, and the specified uplink speed in kilobits per second.

SEE ALSO
       The programs are documented fully by:

       /usr/share/doc/wondershaper/README.Debian.gz

       /usr/share/doc/wondershaper/README.gz

AUTHOR
       This manual page was written by Vince Mulhollon <vlm@debian.org>, for the Debian project (but may be used by others).

                                                                                       May  30, 2004                                                                       WONDERSHAPER(8)
