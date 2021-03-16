DRIFTNET(1)                                                            General Commands Manual                                                           DRIFTNET(1)

NAME
       driftnet - capture images from network traffic and display them in an X window; optionally, capture audio streams and play them.

SYNOPSIS
       driftnet [options] [filter code]

DESCRIPTION
       Driftnet  watches network traffic, and picks out and displays JPEG and GIF images for display. It is an horrific invasion of privacy and shouldn't be used by
       anyone anywhere. It has been described as `a graphical tcpdump(8)', `EtherPeg for Unix', and called all sorts of nasty names by people on  Freshmeat.  It  is
       also possible to use driftnet to capture MPEG audio data from the network and play it through a player such as mpg123(1).

       Images may be saved by clicking on them.

OPTIONS
       -h     Print a summary of usage.

       -v     Print additional details of packets captured to the terminal.

       -b     Beep when a new image is displayed.

       -i interface
              Listen  to  packets  on  interface.  By  default,  driftnet will try to pick up traffic on all interfaces, but this does not work with all versions of
              pcap(3); on such systems, an interface must be specified. On some systems, driftnet can only use promiscuous mode if an interface is specified.

       -f file
              Instead of listening on an interface, read captured packets from a pcap(3); dump file; file can be a named pipe for use with Kismet or similar.

       -p     Do not put the interface into promiscuous mode.

       -a     Operate in `adjunct mode', where driftnet gathers images for use by another program, such as Jamie Zawinski's webcollage. In this mode, no  window  is
              displayed; images are captured and saved in a temporary directory, and their names written on standard output.

       -m number
              In  adjunct mode, silently drop images if there are more than number in the temporary directory. It is assumed that another process will delete images
              which it has processed.

       -x prefix
              The filename prefix to use when saving images, by default `driftnet-'.

       -d directory
              Use directory to store temporary files. Driftnet will clear this directory of its own temporary files on exit, but will not delete  the  directory  or
              any other files.

       -s     Attempt  to  capture  streamed  audio data from the network, and either play it or, in adjunct mode, save it in files. At present this only works with
              MPEG data.

       -S     Capture streamed audio data only, ignoring images.

       -M command
              Use the named command to play MPEG audio data. The command, which is executed using the shell, should accept MPEG frames on standard input.   The  de‐
              fault is `mpg123 -'.

       -Z username
              Drop privileges to user username after starting pcap.

       -l     List the system capture interfaces.

       -r     Put the interface in monitor mode (not supported on all interfaces).

       -g     Enable GTK display (this is the default).

       -w     Enable the HTTP server to display images.

       -W     Port number for the HTTP server (implies -w). Default: 9090.

       filter code
              Additional filter code to restrict the packets captured, in the libpcap syntax. User filter code is evaluated as `tcp and (filter code)'.

SEE ALSO
       tcpdump(8), pcap(3), webcollage(1), mpg123(1),
       http://www.etherpeg.org/,
       http://freshmeat.net/projects/driftnet/,
       http://www.ex-parrot.com/~chris/driftnet/.

AUTHOR
       Chris Lightfoot <chris@ex-parrot.com>
       David Suárez <david.sephirot@gmail.com>

1.3.0
       Driftnet, version 1.3.0.
       $Id: driftnet.1.in,v 1.7 2004/04/26 14:42:36 chris Exp $

COPYING
       This  program  is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software
       Foundation; either version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
       A PARTICULAR PURPOSE. See the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 675 Mass Ave,
       Cambridge, MA 02139, USA.

                                                                                                                                                         DRIFTNET(1)
