MACCHANGER(1)                                                                       General Commands Manual                                                                       MACCHANGER(1)

NAME
       macchanger - MAC Changer

SYNOPSIS
       macchanger [options] device

DESCRIPTION
       macchanger is a GNU/Linux utility for viewing/manipulating the MAC address for network interfaces.

OPTIONS
       macchanger accepts the following options:

       -h, --help
              Show summary of options.

       -V, --version
              Show version of program.

       -s, --show
              Prints the current MAC. This is the default action when no other option is specified.

       -e, --ending
              Don't change the vendor bytes.

       -a, --another
              Set random vendor MAC of the same kind.

       -A     Set random vendor MAC of any kind.

       -r, --random
              Set fully random MAC.

       -p, --permanent
              Reset MAC address to its original, permanent hardware value.

       -l, --list[=keyword]
              Print known vendors (with keyword in the vendor's description string).

       -b, --bia
              When setting fully random MAC pretend to be a burned-in-address. If not used, the MAC will have the locally-administered bit set.

       -m, --mac XX:XX:XX:XX:XX:XX, --mac=XX:XX:XX:XX:XX:XX
              Set the MAC XX:XX:XX:XX:XX:XX.

EXAMPLE
       macchanger -A eth1

SEE ALSO
       ifconfig (8)

AUTHOR
       Alvaro Lopez Ortega <alvaro@alobbs.com>.

                                                                                         April 10, 2013                                                                           MACCHANGER(1)
