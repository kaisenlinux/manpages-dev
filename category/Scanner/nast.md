NAST(8)                                                                System Manager's Manual                                                               NAST(8)

NAME
       nast - Network Analyzer Sniffer Tool

SYNOPSIS
       nast [-G] [-i interface] [-l filename] [-f filter] [--ld filename] [-pdxPmsgrSMLbcCBVh]

DESCRIPTION
       Nast is a packet sniffer and a LAN analyzer based on Libnet and Libpcap.

       It  can  sniff in normal mode or in promiscuous mode the packets on a network interface and log it.  It dumps the headers of packets and the payload in ascii
       or ascii-hex format.  You can apply a filter. The sniffed data can be saved in a separated file.

       As analyzer tool, it has many features like:
              * Build LAN hosts list
              * Follow a TCP-DATA stream
              * Find LAN Internet gateways
              * Discover promiscuous nodes
              * Reset an established connection
              * Perform a single half-open portscanner
              * Perform a multi half-open portscanner
              * Find link type (hub or switch)
              * Catch daemon banner of LAN nodes
              * Control ARP answers to discover possible ARP-spoofing
              * Byte counting with an optional filter
              * Write reports logging

       It also provides a new ncurses interface.

CMDLINE SNIFFER OPTIONS
       -i, --interface
              Select the Interface, if not specified will be auto-detected.

       -p, --promisc
              Disable promiscuous mode on NIC.

       -d, --ascii-data
              Print data in ascii format.

       -x, --ascii-hex-data
              Print data in ascii-hex format.

       -f, --filter <"filter">
              Apply <"filter"> to sniffer (see "FILTER SYNTAX" section below for syntax)

           --ld <filename>
              Log captured data to <filename> (only payload). Use -l to log all packet instead, useful with -B

       -T, --tcpdump-log <filename>
              Log all packets in tcpdump format to <filename>

       -R, --tcpdump-log-read <filename>
              Read all packets saved in tcpdump format from <filename>

ANALYZER FEATURES
       -P, --check-promisc <ip>
              Check other NIC on the LAN with the promiscuous flag set.
              By performing a fake ARP broadcast, we can determine if a NIC is in promiscuous mode or not.  If the checked host is in promiscuous mode it  will  re‐
              sponds with an ARP response otherwise it drop the packet.
              Note: This method doesn't work with all OS
              Use -P all to query all network NIC

              eg: root@localhost:~/$ nast -P 192.168.1.2

              NAST "NETWORK ANALYZER SNIFFER TOOL"

              192.168.1.2 (localhost.org)             Found!!

              We can check all nodes by using:
              root@localhost:~/$ nast -P all

       -m, --host-list
              Map the LAN by performing a series of ARP request to sequential subnet IP addresses.

              eg: root@localhost:~/$ nast -m

              NAST "NETWORK ANALYZER SNIFFER TOOL"

              Mapping the Lan for 255.255.255.0 subnet ... please wait

              MAC address             IP address (hostname)
              ===========================================================
              00:4R:BR:3E:21:12       192.168.1.1(nast.experiment.net)
              00:50:BA:80:AC:11       192.168.1.2 (localhost.org) (*)

              (*) This is localhost

       -s, --tcp-stream
              Follow a TCP/IP connection printing all data in payload. You must specify the IP addresses of the ends.

              eg of a ftp connection:
              root@localhost:~/$ nast -s

              NAST "NETWORK ANALYZER SNIFFER TOOL"

              Type connection extremes
              ------------------------
              1st ip : 192.168.1.1
              1st port : 1041
              2nd : 192.168.1.2
              2nd port : 21

              NAST TCP STREAM LOG
              192.168.1.1->mistaya.neverland.org
              PASV
              192.168.1.1<-mistaya.neverland.org
              227 Entering Passive Mode (192,168,1,2,4,12).
              192.168.1.1->mistaya.neverland.org
              LIST
              (...)

       -g, --find-gateway
              Try to find possible Internet-gateways.
              We send a SYN packet to a public host on port 80 through sequential host-lan and if a SYN-ACK return we have find the gateway.

       -r, --reset-connection
              Destroy  an  established  connection. You must specify the IP addresses of the ends and at least one port .  Please, pay attention when use this func‐
              tion.

              eg: root@localhost:~/$ nast -r

              NAST "NETWORK ANALYZER SNIFFER TOOL"

              Type connection extremes
              ------------------------
              1 ip / hostname : 192.168.1.1
              1 port (0 to autodetect) : 0
              2 ip / hostname : 192.168.1.2
              2 port (0 to autodetect) : 21

              - Waiting for SEQ ACK (192.168.1.1 -> 192.168.1.2:21)
              - Stoled SEQ (247656261) ACK (3764364876)...
              - Connection has been reset

              This feature works only if we can read SEQ and ACK numbers, because RST mechanism works with them.

       -S, --port-scanner
              Performs a half-open port scanning on the selected host. It tries also to determine some firewall (just iptables) rules.
              About this technique NMAP says: This technique is often referred to as "half-open" scanning, because you don't open a full TCP  connection.  You  send
              a  SYN  packet, as if you are going to open a real connection and you wait for a response. A SYN|ACK indicates the port is listening. A RST is indica‐
              tive of a non-listener.  If a SYN|ACK is received, a RST is immediately sent to tear down  the  connection  (actually  our OS  kernel  does  this  for
              us).   The primary advantage to this scanning technique is that fewer sites will log it.  Unfortunately you need root privileges to build these custom
              SYN packets.

              eg: root@localhost:~/$ nast -S
              NAST "NETWORK ANALYZER SNIFFER TOOL"
              Port Scanner extremes
              Insert IP to scan   : 192.168.1.3
              Insert Port range   : 1-100

              Wait for scanning...

              State           Port            Services                Notes
              Open            22              ssh                     None
              Open            27              nsw-fe                  None

              All the other 98 ports are in state closed
              Scanning terminated on Apr 14 21:46:55

              The Port range could be in the following style:
              eg: 1-100       (means from port 1 to 100)
                  1,3,5,1000  (means ports 1,3,5 and 1000)
                  1-50,60     (means from port 1 to 50 and port 60)

       -M, --multi-port-scanner
              Same as above but done on all hosts of the lan.

       -L, --find-link
              Tries to determine what type of link is used in the LAN (Hub or switch).
              In the LAN segment is there a HUB or a SWITCH? We can find it by sending a spoofed ICMP echo-request (to work there must be at least 3 host in LAN and
              at least one of them must reply with a ICMP echo-replay)

       -b, --daemon-banner
              Checks the most famous daemon banner on the LAN's hosts.
              You can customize ports database adding them to ports[] variable in main.c

       -c, --check-arp-poisoning
              Control ARP answers to discover possible ARP spoofing attacks like man-in-the-middle
              When run, Nast make a database of all network node (IP and MAC address), then sniff ARP response and verify the correctness of IP-mac address associa‐
              tion.  Remember to execute Nast when you are sure that nobody is making ARP-poisoning, than have fun and relax and check program output:).

       -C, --byte-counting <"filter">
              Apply traffic counting to <"filter"> (see FILTER SYNTAX section below for syntax)
              Use -C any if you don't want to use a filter.

              eg: root@localhost:~/$ nast -C any

              NAST "NETWORK ANALYZER SNIFFER TOOL"

              Reading from "eth0"

              Packets         Total           Current speed           Average speed
              ----------------------------------------------------------------
              - 24            1008B           18B/s                   21B/s

GENERAL OPTIONS
       -G, --ncurses
              Run Nast with the ncurses interfaces (only if compiled with ncurses support)

       -l, --log-file <filename>
              Log reports to <filename>. Work with many features.

       -B, --daemon
              Run in background like daemon and turn off stdout (very useful for sniffer/stream/ARP control logging)

       -V, --version
              Show version information

NCURSES INTERFACE NOTE
       Versions later 0.2.0 have a new ncurses interface which has many improvements regarding the correspondent command line version. For example  you  can  select
       the connection interactively for tcp stream and reset features and byte counting module show much more information (packets type and connections load).

       Please read NCURSES_README file before using the ncurses interface!

FILTER SYNTAX, WHAT PCAP GIVE US!
       Important: this section has been copied from Tcpdump 3.7.1 manpage and "expression" here stand from "filter".
       Remeber to enclose filter between apexes ("something like this")

        expression
              selects which packets will be dumped.  If no expression is given, all packets on the net will be dumped.  Otherwise, only packets for which expression
              is `true' will be dumped.

              The expression consists of one or more primitives.  Primitives usually consist of an id (name or number) preceded by one or  more  qualifiers.   There
              are three different kinds of qualifier:

              type   qualifiers  say  what  kind  of  thing the id name or number refers to.  Possible types are host, net and port.  E.g., `host foo', `net 128.3',
                     `port 20'.  If there is no type qualifier, host is assumed.

              dir    qualifiers specify a particular transfer direction to and/or from id.  Possible directions are src, dst, src or dst and  src  and  dst.   E.g.,
                     `src  foo',  `dst  net  128.3', `src or dst port ftp-data'.  If there is no dir qualifier, src or dst is assumed.  For `null' link layers (i.e.
                     point to point protocols such as slip) the inbound and outbound qualifiers can be used to specify a desired direction.

              proto  qualifiers restrict the match to a particular protocol.  Possible protos are: ether, fddi, tr, ip, ip6, arp, rarp, decnet, tcp and udp.   E.g.,
                     `ether  src  foo',  `arp net 128.3', `tcp port 21'.  If there is no proto qualifier, all protocols consistent with the type are assumed.  E.g.,
                     `src foo' means `(ip or arp or rarp) src foo' (except the latter is not legal syntax), `net bar' means `(ip or arp or rarp) net bar' and  `port
                     53' means `(tcp or udp) port 53'.

              [`fddi'  is  actually  an  alias for `ether'; the parser treats them identically as meaning ``the data link level used on the specified network inter‐
              face.''  FDDI headers contain Ethernet-like source and destination addresses, and often contain Ethernet-like packet types, so you can filter on these
              FDDI  fields  just as with the analogous Ethernet fields.  FDDI headers also contain other fields, but you cannot name them explicitly in a filter ex‐
              pression.

              Similarly, `tr' is an alias for `ether'; the previous paragraph's statements about FDDI headers also apply to Token Ring headers.]

              In addition to the above, there are some special `primitive' keywords that don't follow the pattern: gateway, broadcast, less, greater and  arithmetic
              expressions.  All of these are described below.

              More  complex filter expressions are built up by using the words and, or and not to combine primitives.  E.g., `host foo and not port ftp and not port
              ftp-data'.  To save typing, identical qualifier lists can be omitted.  E.g., `tcp dst port ftp or ftp-data or domain' is exactly the same as `tcp  dst
              port ftp or tcp dst port ftp-data or tcp dst port domain'.

              Allowable primitives are:

              dst host host
                     True if the IPv4/v6 destination field of the packet is host, which may be either an address or a name.

              src host host
                     True if the IPv4/v6 source field of the packet is host.

              host host
                     True  if either the IPv4/v6 source or destination of the packet is host.  Any of the above host expressions can be prepended with the keywords,
                     ip, arp, rarp, or ip6 as in:
                          ip host host
                     which is equivalent to:
                          ether proto \ip and host host
                     If host is a name with multiple IP addresses, each address will be checked for a match.

              ether dst ehost
                     True if the ethernet destination address is ehost.  Ehost may be either a name from /etc/ethers or a number (see ethers(3N)  for  numeric  for‐
                     mat).

              ether src ehost
                     True if the ethernet source address is ehost.

              ether host ehost
                     True if either the ethernet source or destination address is ehost.

              gateway host
                     True if the packet used host as a gateway.  I.e., the ethernet source or destination address was host but neither the IP source nor the IP des‐
                     tination was host.  Host must be a name and must be found both by the machine's host-name-to-IP-address resolution mechanisms (host name  file,
                     DNS, NIS, etc.) and by the machine's host-name-to-Ethernet-address resolution mechanism (/etc/ethers, etc.).  (An equivalent expression is
                          ether host ehost and not host host
                     which can be used with either names or numbers for host / ehost.)  This syntax does not work in IPv6-enabled configuration at this moment.

              dst net net
                     True  if  the  IPv4/v6 destination address of the packet has a network number of net.  Net may be either a name from /etc/networks or a network
                     number (see networks(4) for details).

              src net net
                     True if the IPv4/v6 source address of the packet has a network number of net.

              net net
                     True if either the IPv4/v6 source or destination address of the packet has a network number of net.

              net net mask netmask
                     True if the IP address matches net with the specific netmask.  May be qualified with src or dst.  Note that this syntax is not valid  for  IPv6
                     net.

              net net/len
                     True if the IPv4/v6 address matches net with a netmask len bits wide.  May be qualified with src or dst.

              dst port port
                     True  if the packet is ip/tcp, ip/udp, ip6/tcp or ip6/udp and has a destination port value of port.  The port can be a number or a name used in
                     /etc/services (see tcp(4P) and udp(4P)).  If a name is used, both the port number and protocol are checked.  If a number or ambiguous  name  is
                     used,  only  the  port  number is checked (e.g., dst port 513 will print both tcp/login traffic and udp/who traffic, and port domain will print
                     both tcp/domain and udp/domain traffic).

              src port port
                     True if the packet has a source port value of port.

              port port
                     True if either the source or destination port of the packet is port.  Any of the above port expressions can be prepended with the keywords, tcp
                     or udp, as in:
                          tcp src port port
                     which matches only tcp packets whose source port is port.

              less length
                     True if the packet has a length less than or equal to length.  This is equivalent to:
                          len <= length.

              greater length
                     True if the packet has a length greater than or equal to length.  This is equivalent to:
                          len >= length.

              ip proto protocol
                     True  if  the  packet  is an IP packet (see ip(4P)) of protocol type protocol.  Protocol can be a number or one of the names icmp, icmp6, igmp,
                     igrp, pim, ah, esp, vrrp, udp, or tcp.  Note that the identifiers tcp, udp, and icmp are also keywords and must be escaped via  backslash  (\),
                     which is \\ in the C-shell.  Note that this primitive does not chase the protocol header chain.

              ip6 proto protocol
                     True if the packet is an IPv6 packet of protocol type protocol.  Note that this primitive does not chase the protocol header chain.

              ip6 protochain protocol
                     True if the packet is IPv6 packet, and contains protocol header with type protocol in its protocol header chain.  For example,
                          ip6 protochain 6
                     matches  any  IPv6  packet  with TCP protocol header in the protocol header chain.  The packet may contain, for example, authentication header,
                     routing header, or hop-by-hop option header, between IPv6 header and TCP header.  The BPF code emitted by this primitive is complex and  cannot
                     be optimized by BPF optimizer code in tcpdump, so this can be somewhat slow.

              ip protochain protocol
                     Equivalent to ip6 protochain protocol, but this is for IPv4.

              ether broadcast
                     True if the packet is an ethernet broadcast packet.  The ether keyword is optional.

              ip broadcast
                     True  if  the  packet  is an IP broadcast packet.  It checks for both the all-zeroes and all-ones broadcast conventions, and looks up the local
                     subnet mask.

              ether multicast
                     True if the packet is an ethernet multicast packet.  The ether keyword is optional.  This is shorthand for `ether[0] & 1 != 0'.

              ip multicast
                     True if the packet is an IP multicast packet.

              ip6 multicast
                     True if the packet is an IPv6 multicast packet.

              ether proto protocol
                     True if the packet is of ether type protocol.  Protocol can be a number or one of the names ip, ip6, arp, rarp, atalk, aarp, decnet, sca,  lat,
                     mopdl, moprc, iso, stp, ipx, or netbeui.  Note these identifiers are also keywords and must be escaped via backslash (\).

                     [In  the case of FDDI (e.g., `fddi protocol arp') and Token Ring (e.g., `tr protocol arp'), for most of those protocols, the protocol identifi‐
                     cation comes from the 802.2 Logical Link Control (LLC) header, which is usually layered on top of the FDDI or Token Ring header.

                     When filtering for most protocol identifiers on FDDI or Token Ring, tcpdump checks only the protocol ID field of an  LLC  header  in  so-called
                     SNAP format with an Organizational Unit Identifier (OUI) of 0x000000, for encapsulated Ethernet; it doesn't check whether the packet is in SNAP
                     format with an OUI of 0x000000.

                     The exceptions are iso, for which it checks the DSAP (Destination Service Access Point) and SSAP (Source Service Access Point)  fields  of  the
                     LLC  header,  stp  and  netbeui, where it checks the DSAP of the LLC header, and atalk, where it checks for a SNAP-format packet with an OUI of
                     0x080007 and the Appletalk etype.

                     In the case of Ethernet, tcpdump checks the Ethernet type field for most of those protocols; the exceptions are  iso,  sap,  and  netbeui,  for
                     which  it  checks for an 802.3 frame and then checks the LLC header as it does for FDDI and Token Ring, atalk, where it checks both for the Ap‐
                     pletalk etype in an Ethernet frame and for a SNAP-format packet as it does for FDDI and Token Ring, aarp, where it checks for the Appletalk ARP
                     etype  in  either  an  Ethernet frame or an 802.2 SNAP frame with an OUI of 0x000000, and ipx, where it checks for the IPX etype in an Ethernet
                     frame, the IPX DSAP in the LLC header, the 802.3 with no LLC header encapsulation of IPX, and the IPX etype in a SNAP frame.]

              decnet src host
                     True if the DECNET source address is host, which may be an address of the form ``10.123'', or a DECNET host name.  [DECNET host name support is
                     only available on Ultrix systems that are configured to run DECNET.]

              decnet dst host
                     True if the DECNET destination address is host.

              decnet host host
                     True if either the DECNET source or destination address is host.

              ip, ip6, arp, rarp, atalk, aarp, decnet, iso, stp, ipx, netbeui
                     Abbreviations for:
                          ether proto p
                     where p is one of the above protocols.

              lat, moprc, mopdl
                     Abbreviations for:
                          ether proto p
                     where p is one of the above protocols.  Note that tcpdump does not currently know how to parse these protocols.

              vlan [vlan_id]
                     True if the packet is an IEEE 802.1Q VLAN packet.  If [vlan_id] is specified, only true is the packet has the specified vlan_id.  Note that the
                     first vlan keyword encountered in expression changes the decoding offsets for the remainder of expression on the assumption that the packet  is
                     a VLAN packet.

              tcp, udp, icmp
                     Abbreviations for:
                          ip proto p or ip6 proto p
                     where p is one of the above protocols.

              iso proto protocol
                     True if the packet is an OSI packet of protocol type protocol.  Protocol can be a number or one of the names clnp, esis, or isis.

              clnp, esis, isis
                     Abbreviations for:
                          iso proto p
                     where p is one of the above protocols.  Note that tcpdump does an incomplete job of parsing these protocols.

EXAMPLES
       Here are some examples of the use of NAST:

          nast -f "src 192.168.1.2"
       In this example with the help of the filter we choose to see only the traffic from 192.168.1.2

          nast -p -B --ld logfile.txt
       Here we run nast in background mode and log all data that pass through our NIC.

          nast -S -l logfile.txt
       In this other case we log the results of the port scanner in the file "logfile.txt"

          nast -c -B
       This is a very useful options. We run in background mode nast that checks if someone is arp-poisoning.

SUPPORTED PLATFORMS
       Tested:
       * Linux 2.4.x
       * Linux 2.6.x
       * FreeBSD 5.x
       * FreeBSD 4.x

       Not tested yet:
       * Linux 2.2.x

AVAILABILITY
       Official web site: http://nast.berlios.de
       Newsletter: http://lists.berlios.de/mailman/listinfo/nast-news

KNOWN BUGS
       * Promiscuous mode scanner many times returns wrong results
       * Sometimes the port scanner generates false results

       Please report bugs to authors

AUTHORS
       Embyte <embyte@madlab.it>
       Snifth <snifth@box.it>

LICENSE
       GNU GENERAL PUBLIC LICENSE Version 2, June 1991
       See COPYING for details.

NAST 0.2.0                                                                    20040216                                                                       NAST(8)
