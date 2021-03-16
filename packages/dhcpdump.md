  DHCPDUMP
 
## NAME
        dhcpdump - DHCP packet dumper
 
## SYNOPSIS
        dhcpdump [-h regular-expression] -i interface
 
## DESCRIPTION
        This command parses the output of tcpdump to display the dhcp-packets for easier checking and debugging.
 
## USAGE
        dhcpdump -i /dev/fxp0
 
        If you want to filter a specific Client Hardware Address (CHADDR), then you can specifiy it as a regular expressions:
 
        dhcpdump -i /dev/fxp0 -h ^00:c0:4f
 
        This will display only the packets with Client Hardware Addresses which start with 00:c0:4f.
 
 OUTPUT
          TIME: 15:45:02.084272
            IP: 0.0.0.0.68 (0:c0:4f:82:ac:7f) > 255.255.255.255.67 (ff:ff:ff:ff:ff:ff)
            OP: 1 (BOOTPREQUEST)
         HTYPE: 1 (Ethernet)
          HLEN: 6
          HOPS: 0
           XID: 28f61b03
          SECS: 0
         FLAGS: 0
        CIADDR: 0.0.0.0
        YIADDR: 0.0.0.0
        SIADDR: 0.0.0.0
        GIADDR: 0.0.0.0
        CHADDR: 00:c0:4f:82:ac:7f:00:00:00:00:00:00:00:00:00:00
         S## NAME: .
         F## NAME: .
        OPTION:  53 (  1) DHCP message type         3 (DHCPREQUEST)
        OPTION:  54 (  4) Server identifier         130.139.64.101
        OPTION:  50 (  4) Request IP address        130.139.64.143
        OPTION:  55 (  7) Parameter Request List      1 (Subnet mask)
                                                      3 (Routers)
                                                     58 (T1)
                                                     59 (T2)
 
        At the option field, the first field is the value of the option, the second one (between brackets) is the length of the option-datafield, the third field is
        the name of the option, the fourth field is the data of the option.
 
## RETURN_VALUES
        Always 0.
 
## NOTES
        Privileged access is often needed for accessing the interface.
 
## BUGS
        Not all the parameter options are printed verbose, because of lack of documentation. Not all the options are tested, because of lack of clients/servers with
        these options. If you have a dump of one of them, please send them to me and I'll incorperate them.
 
 THANKS TO
        Ralph Droms and Ted Lemons "The DHCP Handbook", ISBN 1-57870-137-6.
 
        Peter Apian-Bennewitz <apian@ise.fhg.de> for his Client Hardware Address filtering
 
## AUTHOR
        Edwin Groothuis, edwin@mavetju.org (http://www.mavetju.org)
 
## SEE ALSO
        dhcpd(8), tcpdump(1), RFC2132
 
 perl v5.28.1                                                                23 June 2008                                                                 DHCPDUMP(8)
