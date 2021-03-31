WAKEONLAN(1)                                                                  User Contributed Perl Documentation                                                                  WAKEONLAN(1)

NAME
       wakeonlan - Perl script to wake up computers

SYNOPSIS
       wakeonlan [-h] [-v] [-i IP_address] [-p port] [-f file] [[hardware_address] ...]

DESCRIPTION
       This script sends 'magic packets' to wake-on-lan enabled ethernet adapters and motherboards, in order to switch on the called PC. Be sure to connect the NIC with the motherboard if
       neccesary, and enable the WOL function in the BIOS.

       The 'magic packet' consists of 6 times 0xFF followed by 16 times the hardware address of the NIC. This sequence can be encapsulated in any kind of packet. This script uses UDP packets.

OPTIONS
       -h  Displays the help information.

       -v  Displays the script version.

       -i ip_address
           Destination IP address. Unless you have static ARP tables you should use some kind of broadcast address (the broadcast address of the network where the computer resides or the
           limited broadcast address). Default: 255.255.255.255 (the limited broadcast address).

       -p port
           Destination port. Default: 9 (the discard port).

       -f file
           File with hardware addresses of wakeable computers. For an example check the file lab001.wol in the examples subdirectory.

EXAMPLES
       Using the limited broadcast address (255.255.255.255):

           $ wakeonlan 01:02:03:04:05:06
           $ wakeonlan 01:02:03:04:05:06 01:02:03:04:05:07

       Using a subnet broadcast address:

           $ wakeonlan -i 192.168.1.255 01:02:03:04:05:06

       Using another destination port:

           $ wakeonlan -i 192.168.1.255 -p 1234 01:02:03:04:05:06

       Using a file as source of hardware and IP addresses:

           $ wakeonlan -f examples/lab001.wol
           $ wakeonlan -f examples/lab001.wol 01:02:03:04:05:06

AUTHOR
       José Pedro Oliveira <jpo@di.uminho.pt> maintaining and expanding original work done by Ico Doornekamp <ico@edd.dhs.org>.

COPYRIGHT
       Copyright (c) 2000-2005 José Pedro Oliveira.

       This is free software.  You may modify it and distribute it under Perl's Artistic Licence.  Modified versions must be clearly indicated.

SEE ALSO
       For more information regarding this script and Wakeonlan technology just check the following address http://gsd.di.uminho.pt/jpo/software/wakeonlan/.

POD ERRORS
       Hey! The above document had some coding errors, which are explained below:

       Around line 250:
           Non-ASCII character seen before =encoding in 'José'. Assuming CP1252

perl v5.32.0                                                                               2021-01-01                                                                              WAKEONLAN(1)
