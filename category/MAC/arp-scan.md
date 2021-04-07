ARP-SCAN(1)                                                                       General Commands Manual                                                                      ARP-SCAN(1)

NAME
       arp-scan - The ARP scanner

SYNOPSIS
       arp-scan [options] [hosts...]

       Target  hosts must be specified on the command line unless the --file option is given, in which case the targets are read from the specified file instead, or the --localnet option
       is used, in which case the targets are generated from the network interface IP address and netmask.

       You will need to be root, or arp-scan must be SUID root, in order to run arp-scan, because the functions that it uses to read and write packets require root privilege.

       The target hosts can be specified as IP addresses or hostnames.  You can also specify the target as IPnetwork/bits (e.g. 192.168.1.0/24) to specify all hosts in the given  network
       (network  and  broadcast  addresses  included),  IPstart-IPend  (e.g.  192.168.1.3-192.168.1.27)  to  specify  all  hosts  in  the  inclusive  range,  or  IPnetwork:NetMask  (e.g.
       192.168.1.0:255.255.255.0) to specify all hosts in the given network and mask.

DESCRIPTION
       arp-scan sends ARP packets to hosts on the local network and displays any responses that are received. The network interface to use can be specified with the  --interface  option.
       If  this  option is not present, arp-scan will search the system interface list for the lowest numbered, configured up interface (excluding loopback).  By default, the ARP packets
       are sent to the Ethernet broadcast address, ff:ff:ff:ff:ff:ff, but that can be changed with the --destaddr option.

       The target hosts to scan may be specified in one of three ways: by specifying the targets on the command line; by specifying a file containing the targets with the --file  option;
       or  by  specifying the --localnet option which causes all possible hosts on the network attached to the interface (as defined by the interface address and mask) to be scanned. For
       hosts specified on the command line, or with the --file option, you can use either IP addresses or hostnames.  You can also use  network  specifications  IPnetwork/bits,  IPstart-
       IPend, or IPnetwork:NetMask.

       The list of target hosts is stored in memory.  Each host in this list uses 28 bytes of memory, so scanning a Class-B network (65,536 hosts) requires about 1.75MB of memory for the
       list, and scanning a Class-A (16,777,216 hosts) requires about 448MB.

       arp-scan supports Ethernet and 802.11 wireless networks. It could also support token ring and FDDI, but they have not been tested. It does not support serial links such as PPP  or
       SLIP, because ARP is not supported on them.

       The ARP protocol is a layer-2 (datalink layer) protocol that is used to determine a host's layer-2 address given its layer-3 (network layer) address. ARP was designed to work with
       any layer-2 and layer-3 address format, but the most common use is to map IP addresses to Ethernet hardware addresses, and this is what arp-scan supports. ARP only operates on the
       local  network, and cannot be routed. Although the ARP protocol makes use of IP addresses, it is not an IP-based protocol and arp-scan can be used on an interface that is not con‐
       figured for IP.

       ARP is only used by IPv4 hosts. IPv6 uses NDP (neighbour discovery protocol) instead, which is a different protocol and is not supported by arp-scan.

       One ARP packet is sent for each for each target host, with the target protocol address (the ar$tpa field) set to the IP address of this host. If a host does not respond, then  the
       ARP  packet  will be re-sent once more.  The maximum number of retries can be changed with the --retry option.  Reducing the number of retries will reduce the scanning time at the
       possible risk of missing some results due to packet loss.

       You can specify the bandwidth that arp-scan will use for the outgoing ARP packets with the --bandwidth option.  By default, it uses a bandwidth of 256000 bits per second. Increas‐
       ing  the  bandwidth  will reduce the scanning time, but setting the bandwidth too high may result in an ARP storm which can disrupt network operation.  Also, setting the bandwidth
       too high can send packets faster than the network interface can transmit them, which will eventually fill the kernel's transmit buffer resulting in the error  message:  No  buffer
       space available.  Another way to specify the outgoing ARP packet rate is with the --interval option, which is an alternative way to modify the same underlying parameter.

       The time taken to perform a single-pass scan (i.e. with --retry=1) is given by:

       time = n*i + t + o

       Where  n  is the number of hosts in the list, i is the time interval between packets (specified with --interval, or calculated from --bandwidth), t is the timeout value (specified
       with --timeout) and o is the overhead time taken to load the targets into the list and read the MAC/Vendor mapping files.  For small lists of hosts, the timeout value  will  domi‐
       nate, but for large lists the packet interval is the most important value.

       With  65,536 hosts, the default bandwidth of 256,000 bits/second (which results in a packet interval of 2ms), the default timeout of 500ms, and a single pass ( --retry=1), and as‐
       suming an overhead of 1 second, the scan would take 65536*0.002 + 0.5 + 1 = 132.57 seconds, or about 2 minutes 13 seconds.

       Any part of the outgoing ARP packet may be modified through the use of the various --arpXXX options.  The use of some of these options may make the outgoing  ARP  packet  non  RFC
       compliant.  Different  operating  systems handle the various non standard ARP packets in different ways, and this may be used to fingerprint these systems.  See arp-fingerprint(1)
       for information about a script which uses these options to fingerprint the target operating system.

       The table below summarises the options that change the outgoing ARP packet. In this table, the Field column gives the ARP packet field name from RFC 826, Bits specifies the number
       of bits in the field, Option shows the arp-scan option to modify this field, and Notes gives the default value and any other notes.

       ┌───────────────────────────────────────────────────────────────┐
       │                 Outgoing ARP Packet Options                   │
       ├───────┬──────┬──────────┬─────────────────────────────────────┤
       │Field  │ Bits │ Option   │ Notes                               │
       ├───────┼──────┼──────────┼─────────────────────────────────────┤
       │ar$hrd │ 16   │ --arphrd │ Default is 1 (ARPHRD_ETHER)         │
       │ar$pro │ 16   │ --arppro │ Default is 0x0800                   │
       │ar$hln │ 8    │ --arphln │ Default is 6 (ETH_ALEN)             │
       │ar$pln │ 8    │ --arppln │ Default is 4 (IPv4)                 │
       │ar$op  │ 16   │ --arpop  │ Default is 1 (ARPOP_REQUEST)        │
       │ar$sha │ 48   │ --arpsha │ Default is interface h/w address    │
       │ar$spa │ 32   │ --arpspa │ Default is interface IP address     │
       │ar$tha │ 48   │ --arptha │ Default is zero (00:00:00:00:00:00) │
       │ar$tpa │ 32   │ None     │ Set to the target host IP address   │
       └───────┴──────┴──────────┴─────────────────────────────────────┘
       The  most  commonly used outgoing ARP packet option is --arpspa, which sets the source IP address in the ARP packet.  This option allows the outgoing ARP packet to use a different
       source IP address from the outgoing interface address.  With this option it is possible to use arp-scan on an interface with no IP address configured, which can be useful  if  you
       want to ensure that the testing host does not interact with the network being tested.

       Warning:  Setting ar$spa to the destination IP address can disrupt some operating systems, as they assume there is an IP address clash if they receive an ARP request for their own
       address.

       It is also possible to change the values in the Ethernet frame header that precedes the ARP packet in the outgoing packets. The table below summarises the options that change val‐
       ues in the Ethernet frame header.

       ┌───────────────────────────────────────────────────────────────────┐
       │                 Outgoing Ethernet Frame Options                   │
       ├───────────────┬──────┬─────────────┬──────────────────────────────┤
       │Field          │ Bits │ Option      │ Notes                        │
       ├───────────────┼──────┼─────────────┼──────────────────────────────┤
       │Dest Address   │ 48   │ --destaddr  │ Default is ff:ff:ff:ff:ff:ff │
       │Source Address │ 48   │ --srcaddr   │ Default is interface address │
       │Protocol Type  │ 16   │ --prototype │ Default is 0x0806            │
       └───────────────┴──────┴─────────────┴──────────────────────────────┘
       The  most  commonly  used  outgoing Ethernet frame option is --destaddr, which sets the destination Ethernet address for the ARP packet.  --prototype is not often used, because it
       will cause the packet to be interpreted as a different Ethernet protocol.

       Any ARP responses that are received are displayed in the following format:

       <IP Address>   <Hardware Address>   <Vendor Details>

       Where IP Address is the IP address of the responding target, Hardware Address is its Ethernet hardware address (also known as the MAC address) and Vendor Details  are  the  vendor
       details, decoded from the hardware address.  The output fields are separated by a single tab character.

       The responses are displayed in the order they are received, which is not always the same order as the requests were sent because some hosts may respond faster than others.

       The vendor decoding uses the files ieee-oui.txt, ieee-iab.txt and mac-vendor.txt, which are supplied with arp-scan.  The ieee-oui.txt and ieee-iab.txt files are generated from the
       OUI and IAB data on the IEEE website at http://standards-oui.ieee.org/oui/oui.txt and http://standards.ieee.org/regauth/oui/iab.txt.  The Perl scripts get-oui and  get-iab,  which
       are  included in the arp-scan package, can be used to update these files with the latest data from the IEEE website.  The mac-vendor.txt file contains other MAC to Vendor mappings
       that are not covered by the IEEE OUI and IAB files, and can be used to add custom mappings.

       Almost all hosts that support IP will respond to arp-scan if they receive an ARP packet with the target protocol address (ar$tpa) set to their IP address.  This includes firewalls
       and  other  hosts  with IP filtering that drop all IP traffic from the testing system. For this reason, arp-scan is a useful tool to quickly determine all the active IP hosts on a
       given Ethernet network segment.

OPTIONS
       Where an option takes a value, that value is specified as a letter in angle brackets. The letter indicates the type of data that is expected:

       <s>    A character string, e.g. --file=hostlist.txt.

       <i>    An integer, which can be specified as a decimal number or as a hexadecimal number if preceded with 0x, e.g. --arppro=2048 or --arpro=0x0800.

       <f>    A floating point decimal number, e.g. --backoff=1.5.

       <m>    An Ethernet MAC address, which can be specified either in the format 01:23:45:67:89:ab, or as 01-23-45-67-89-ab. The alphabetic hex characters may be either upper or  lower
              case. E.g. --arpsha=01:23:45:67:89:ab.

       <a>    An IPv4 address, e.g. --arpspa=10.0.0.1

       <h>    Binary  data  specified  as  a  hexadecimal  string,  which  should  not  include a leading 0x. The alphabetic hex characters may be either upper or lower case. E.g. --pad‐
              ding=aaaaaaaaaaaa

       <x>    Something else. See the description of the option for details.

       --help or -h
              Display this usage message and exit.

       --file=<s> or -f <s>
              Read hostnames or addresses from the specified file instead of from the command line. One name or IP address per line. Use "-" for standard input.

       --localnet or -l
              Generate addresses from network interface configuration.  Use the network interface IP address and network mask to generate the list of target  host  addresses.   The  list
              will include the network and broadcast addresses, so an interface address of 10.0.0.1 with netmask 255.255.255.0 would generate 256 target hosts from 10.0.0.0 to 10.0.0.255
              inclusive.  If you use this option, you cannot specify the --file option or specify any target hosts on the command line.  The interface specifications are taken  from  the
              interface that arp-scan will use, which can be changed with the --interface option.

       --retry=<i> or -r <i>
              Set total number of attempts per host to <i>, default=2.

       --timeout=<i> or -t <i>
              Set  initial  per  host  timeout  to <i> ms, default=500.  This timeout is for the first packet sent to each host.  subsequent timeouts are multiplied by the backoff factor
              which is set with --backoff.

       --interval=<x> or -i <x>
              Set minimum packet interval to <x>.  This controls the outgoing bandwidth usage by limiting the rate at which packets can be sent. The packet interval will  be  no  smaller
              than  this  number.   If you want to use up to a given bandwidth, then it is easier to use the --bandwidth option instead.  The interval specified is in milliseconds by de‐
              fault, or in microseconds if "u" is appended to the value.

       --bandwidth=<x> or -B <x>
              Set desired outbound bandwidth to <x>, default=256000.  The value is in bits per second by default. If you append "K" to the value, then the units are kilobits per sec; and
              if  you append "M" to the value, the units are megabits per second.  The "K" and "M" suffixes represent the decimal, not binary, multiples. So 64K is 64000, not 65536.  You
              cannot specify both --interval and --bandwidth because they are just different ways to change the same underlying parameter.

       --backoff=<f> or -b <f>
              Set timeout backoff factor to <f>, default=1.50.  The per-host timeout is multiplied by this factor after each timeout. So, if the number of retries is 3, the initial  per-
              host timeout is 500ms and the backoff factor is 1.5, then the first timeout will be 500ms, the second 750ms and the third 1125ms.

       --verbose or -v
              Display verbose progress messages.  Use more than once for greater effect:

              1  - Display the network address and mask used when the --localnet option is specified, display any nonzero packet padding, display packets received from unknown hosts, and
              show when each pass through the list completes.

              2 - Show each packet sent and received, when entries are removed from the list, the pcap filter string, and counts of MAC/Vendor mapping entries.

              3 - Display the host list before scanning starts.

       --version or -V
              Display program version and exit.

       --random or -R
              Randomise the host list.  This option randomises the order of the hosts in the host list, so the ARP packets are sent to the hosts in a random  order.  It  uses  the  Knuth
              shuffle algorithm.

       --randomseed=<i>
              Use  <i>  to  seed the pseudo random number generator.  This option seeds the PRNG with the specified number, which can be useful if you want to ensure that the random host
              list is reproducible. By default, the PRNG is seeded with an unpredictable value. This option is only effective in conjunction with the --random (-R) option.

       --numeric or -N
              IP addresses only, no hostnames.  With this option, all hosts must be specified as IP addresses. Hostnames are not permitted. No DNS lookups will be performed.

       --snap=<i> or -n <i>
              Set the pcap snap length to <i>. Default=64.  This specifies the frame capture length. This length includes the data-link header.  The default is normally sufficient.

       --interface=<s> or -I <s>
              Use network interface <s>.  If this option is not specified, arp-scan will search the system interface list for the lowest  numbered,  configured  up  interface  (excluding
              loopback).  The interface specified must support ARP.

       --quiet or -q
              Only display minimal output. No protocol decoding.  If this option is specified, then only the IP address and MAC address are displayed for each responding host.  No proto‐
              col decoding is performed and the OUI mapping files are not used.

       --plain or -x
              Display plain output showing only responding hosts.  This option suppresses the printing of the header and footer text, and only displays one line for each responding host.
              Useful if the output will be parsed by a script.

       --ignoredups or -g
              Don't display duplicate packets.  By default, duplicate packets are displayed and are flagged with "(DUP: n)".

       --ouifile=<s> or -O <s>
              Use  IEEE  Ethernet  OUI  to vendor mapping file <s>.  If this option is not specified, the default filename is ieee-oui.txt in the current directory. If that is not found,
              then the file /usr/local/share/arp-scan/ieee-oui.txt is used.

       --iabfile=<s> or -O <s>
              Use IEEE Ethernet IAB to vendor mapping file <s>.  If this option is not specified, the default filename is ieee-iab.txt in the current directory. If  that  is  not  found,
              then the file /usr/local/share/arp-scan/ieee-iab.txt is used.

       --macfile=<s> or -O <s>
              Use custom Ethernet MAC to vendor mapping file <s>.  If this option is not specified, the default filename is mac-vendor.txt in the current directory. If that is not found,
              then the file /usr/local/share/arp-scan/mac-vendor.txt is used.

       --srcaddr=<m> or -S <m>
              Set the source Ethernet MAC address to <m>.  This sets the 48-bit hardware address in the Ethernet frame header for outgoing ARP packets. It does not  change  the  hardware
              address in the ARP packet, see --arpsha for details on how to change that address.  The default is the Ethernet address of the outgoing interface.

       --destaddr=<m> or -T <m>
              Send the packets to Ethernet MAC address <m> This sets the 48-bit destination address in the Ethernet frame header.  The default is the broadcast address ff:ff:ff:ff:ff:ff.
              Most operating systems will also respond if the ARP request is sent to their MAC address, or to a multicast address that they are listening on.

       --arpsha=<m> or -u <m>
              Use <m> as the ARP source Ethernet address This sets the 48-bit ar$sha field in the ARP packet It does not change the hardware address in the frame  header,  see  --srcaddr
              for details on how to change that address. The default is the Ethernet address of the outgoing interface.

       --arptha=<m> or -w <m>
              Use <m> as the ARP target Ethernet address This sets the 48-bit ar$tha field in the ARP packet The default is zero, because this field is not used for ARP request packets.

       --prototype=<i> or -y <i>
              Set the Ethernet protocol type to <i>, default=0x0806.  This sets the 16-bit protocol type field in the Ethernet frame header.  Setting this to a non-default value will re‐
              sult in the packet being ignored by the target, or sent to the wrong protocol stack.

       --arphrd=<i> or -H <i>
              Use <i> for the ARP hardware type, default=1.  This sets the 16-bit ar$hrd field in the ARP packet.  The normal value is 1 (ARPHRD_ETHER). Most, but not all, operating sys‐
              tems will also respond to 6 (ARPHRD_IEEE802). A few systems respond to any value.

       --arppro=<i> or -p <i>
              Use <i> for the ARP protocol type, default=0x0800.  This sets the 16-bit ar$pro field in the ARP packet.  Most operating systems only respond to 0x0800 (IPv4) but some will
              respond to other values as well.

       --arphln=<i> or -a <i>
              Set the hardware address length to <i>, default=6.  This sets the 8-bit ar$hln field in the ARP packet.  It sets the claimed length of  the  hardware  address  in  the  ARP
              packet. Setting it to any value other than the default will make the packet non RFC compliant.  Some operating systems may still respond to it though.  Note that the actual
              lengths of the ar$sha and ar$tha fields in the ARP packet are not changed by this option; it only changes the ar$hln field.

       --arppln=<i> or -P <i>
              Set the protocol address length to <i>, default=4.  This sets the 8-bit ar$pln field in the ARP packet.  It sets the claimed length of  the  protocol  address  in  the  ARP
              packet. Setting it to any value other than the default will make the packet non RFC compliant.  Some operating systems may still respond to it though.  Note that the actual
              lengths of the ar$spa and ar$tpa fields in the ARP packet are not changed by this option; it only changes the ar$pln field.

       --arpop=<i> or -o <i>
              Use <i> for the ARP operation, default=1.  This sets the 16-bit ar$op field in the ARP packet.  Most operating systems will only respond to  the  value  1  (ARPOP_REQUEST).
              However, some systems will respond to other values as well.

       --arpspa=<a> or -s <a>
              Use  <a> as the source IP address.  The address should be specified in dotted quad format; or the literal string "dest", which sets the source address to be the same as the
              target host address.  This sets the 32-bit ar$spa field in the ARP packet.  Some operating systems check this, and will only respond if the source  address  is  within  the
              network of the receiving interface. Others don't care, and will respond to any source address.  By default, the outgoing interface address is used.

              WARNING:  Setting  ar$spa  to  the destination IP address can disrupt some operating systems, as they assume there is an IP address clash if they receive an ARP request for
              their own address.

       --padding=<h> or -A <h>
              Specify padding after packet data.  Set the padding data to hex value <h>. This data is appended to the end of the ARP packet, after the data.  Most, if not all,  operating
              systems will ignore any padding. The default is no padding, although the Ethernet driver on the sending system may pad the packet to the minimum Ethernet frame length.

       --llc or -L
              Use  RFC  1042  LLC framing with SNAP.  This option causes the outgoing ARP packets to use IEEE 802.2 framing with a SNAP header as described in RFC 1042. The default is to
              use Ethernet-II framing.  arp-scan will decode and display received ARP packets in either Ethernet-II or IEEE 802.2 formats irrespective of this option.

       --vlan=<i> or -Q <i>
              Use 802.1Q tagging with VLAN id <i>.  This option causes the outgoing ARP packets to use 802.1Q VLAN tagging with a VLAN ID of <i>, which should be in the range 0  to  4095
              inclusive.  arp-scan will always decode and display received ARP packets in 802.1Q format irrespective of this option.

       --pcapsavefile=<s> or -W <s>
              Write received packets to pcap savefile <s>.  This option causes received ARP responses to be written to the specified pcap savefile as well as being decoded and displayed.
              This savefile can be analysed with programs that understand the pcap file format, such as "tcpdump" and "wireshark".

       --rtt or -D
              Display the packet round-trip time.

FILES
       /usr/local/share/arp-scan/ieee-oui.txt
              List of IEEE OUI (Organisationally Unique Identifier) to vendor mappings.

       /usr/local/share/arp-scan/ieee-iab.txt
              List of IEEE IAB (Individual Address Block) to vendor mappings.

       /usr/local/share/arp-scan/mac-vendor.txt
              List of other Ethernet MAC to vendor mappings.

EXAMPLES
       The example below shows arp-scan being used to scan the network 192.168.0.0/24 using the network interface eth0.

       $ arp-scan --interface=eth0 192.168.0.0/24
       Interface: eth0, datalink type: EN10MB (Ethernet)
       Starting arp-scan 1.4 with 256 hosts (http://www.nta-monitor.com/tools-resources/security-tools/arp-scan/)
       192.168.0.1     00:c0:9f:09:b8:db       QUANTA COMPUTER, INC.
       192.168.0.3     00:02:b3:bb:66:98       Intel Corporation
       192.168.0.5     00:02:a5:90:c3:e6       Compaq Computer Corporation
       192.168.0.6     00:c0:9f:0b:91:d1       QUANTA COMPUTER, INC.
       192.168.0.12    00:02:b3:46:0d:4c       Intel Corporation
       192.168.0.13    00:02:a5:de:c2:17       Compaq Computer Corporation
       192.168.0.87    00:0b:db:b2:fa:60       Dell ESG PCBA Test
       192.168.0.90    00:02:b3:06:d7:9b       Intel Corporation
       192.168.0.105   00:13:72:09:ad:76       Dell Inc.
       192.168.0.153   00:10:db:26:4d:52       Juniper Networks, Inc.
       192.168.0.191   00:01:e6:57:8b:68       Hewlett-Packard Company
       192.168.0.251   00:04:27:6a:5d:a1       Cisco Systems, Inc.
       192.168.0.196   00:30:c1:5e:58:7d       HEWLETT-PACKARD

       13 packets received by filter, 0 packets dropped by kernel
       Ending arp-scan: 256 hosts scanned in 3.386 seconds (75.61 hosts/sec).  13 responded

       This next example shows arp-scan being used to scan the local network after configuring the network interface with DHCP using pump.

       # pump
       # ifconfig eth0
       eth0      Link encap:Ethernet  HWaddr 00:D0:B7:0B:DD:C7
                 inet addr:10.0.84.178  Bcast:10.0.84.183  Mask:255.255.255.248
                 UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
                 RX packets:46335 errors:0 dropped:0 overruns:0 frame:0
                 TX packets:1542776 errors:0 dropped:0 overruns:0 carrier:0
                 collisions:1644 txqueuelen:1000
                 RX bytes:6184146 (5.8 MiB)  TX bytes:348887835 (332.7 MiB)
       # arp-scan --localnet
       Interface: eth0, datalink type: EN10MB (Ethernet)
       Starting arp-scan 1.4 with 8 hosts (http://www.nta-monitor.com/tools-resources/security-tools/arp-scan/)
       10.0.84.179     00:02:b3:63:c7:57       Intel Corporation
       10.0.84.177     00:d0:41:08:be:e8       AMIGO TECHNOLOGY CO., LTD.
       10.0.84.180     00:02:b3:bd:82:9b       Intel Corporation
       10.0.84.181     00:02:b3:1f:73:da       Intel Corporation

       4 packets received by filter, 0 packets dropped by kernel
       Ending arp-scan 1.4: 8 hosts scanned in 0.820 seconds (9.76 hosts/sec).  4 responded

AUTHOR
       Roy Hills <Roy.Hills@nta-monitor.com>

SEE ALSO
       get-oui(1)

       get-iab(1)

       arp-fingerprint(1)

       RFC 826 - An Ethernet Address Resolution Protocol

       http://www.nta-monitor.com/wiki/ The arp-scan wiki page.

       https://github.com/royhills/arp-scan The arp-scan homepage.

                                                                                      August 13, 2016                                                                          ARP-SCAN(1)
