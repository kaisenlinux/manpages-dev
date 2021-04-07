etherape(1)                                                                       General Commands Manual                                                                      etherape(1)

NAME
       etherape - graphical network traffic browser

SYNOPSIS
       etherape  [ -d ] [ -f filter ] [ --final-export outfile ] [ --glade-file interfacefile ] [ -i interface ] [ -l maxnodes ] [ -m operating mode ] [ --max-delay delay ] [ --min-delay
       delay ] [ -n ] [ -P column file ] [ -q ] [ -r inputfile ] [ -s ] [ --signal-export outfile ] [ -Z user ]

DESCRIPTION
       EtherApe is a network traffic browser. It displays network activity graphically. It uses GNOME libraries as its user interface, and libpcap, a packet  capture  and  filtering  li‐
       brary.

OPTIONS
       These options can be supplied to the command:

       -d, --diagram-only
              don't display any node text identification

       -f, --filter <capture filter>
              set capture filter

       --final-export <export file name>
              when replaying, export to named file at end of replay

       --glade-file <filename>
              loads interface definitions from the specified GtkBuilder file instead of the default one.

       -i, --interface <interface name>
              set interface to listen to

       -l, --node-limit <number>
              sets the maximum number of node visible

       -m, --mode <link|ip|tcp>
              set mode of operation (default is ip)

       --max-delay <delay in ms>
              caps timestamps to the provided delay when replaying a capture file.

       --min-delay <delay in ms>
              provides a minimum to inter-packet delay when replaying a capture file.

       -n, --numeric
              don't convert addresses to names, disables name resolution.

       -P, --positionfile with list of nodes and columns
              Activate column positioning with the named file.  Manually position nodes in virtual columns using the named file content.  See Column Positioning.

       -q     disables informational messages.

       -r, --replay-file <file name>
              sets input file to replay

       -s     Place nodes using an alternate algorithm.  Deprecated.

       --signal-export <export file name>
              if specified, enables signal USR1 handling. On receiving USR1, EtherApe will dump its state to the named XML file.

              Beware! the file will be overwritten without asking!

       -Z, --relinquish-privileges <user>
              run everything but privileged packet-capture operations under the user ID and group ID of the given user.

       -?, --help
              show a brief help message

COLUMN POSITIONING
       With option -P|--position EtherApe reads a file specifying positions of some nodes. The input file takes the format of:
         node.mydomain.com        1
         router1.mydomain.com     2
         router2.mydomain.com     2
         172.16.2.[0-9]*          1
         .*.mydomain.com          1
         ff02:.*                  2
         fe80:.*                  1

       The first column is a regex of either the FQDN or the IP address.

       The second column is a number indicating the "column" that the node will be positioned in the display with column 1 being on the far left. Up to 1000 columns are permitted.

       Instead  of  being  arranged in a circle the nodes are displayed in columns.  This is quite useful for arranging nodes so that you can see nodes on the "inside" of your network on
       the left and the public internet nodes (anything not specified in the config file) on the right.

       The input file above will cause 3 columns to display.  Nodes with FQDN containing mydomain.com, those in the 172.16.2.0/24 subnet, and link local IPv6 addresses  will  be  in  the
       left column.  2 "routers", and IPv6 multicast will be in the center column and everything else will be in the right column.

       Column locations are determined by the first match while searching from the top of the input.  Overlapping regex's can be used with the understanding that the first match will de‐
       termine the location.  The broadest regex's should be near the bottom of the position specification.

SIGNALS
       USR1   on receipt of signal USR1, and if enabled with --signal-export, EtherApe will dump its state to the chosen xml file.

              Beware! the file will be overwritten without asking!

ENVIRONMENT VARIABLES
       APE_DEBUG=normal|info|debug
              controls debug output verbosity. Debug information are printed on standard output.

FILES
       Etherape will use /etc/ethers if there is one to convert MAC addresses to names and /etc/services to associate TCP/UDP port numbers to protocol names.

SEE ALSO
       The EtherApe webpage at http://etherape.sourceforge.net/

AUTHORS
       Juan Toledo <toledo@users.sourceforge.net>

       Riccardo Ghetta <bchiara@users.sourceforge.net>

                                                                                   EtherApe Manual Page                                                                        etherape(1)
