TCPTRACEROUTE(1)                                                                  General Commands Manual                                                                 TCPTRACEROUTE(1)

NAME
       tcptraceroute - A traceroute implementation using TCP packets

SYNOPSIS
       tcptraceroute [-nNFSAE] [ -i interface ] [ -f first ttl ]
       [ -l length ] [ -q number of queries ] [ -t tos ]
       [ -m max ttl ] [ -p source port ] [ -s source address ]
       [ -w wait time ] host [ destination port ] [ length ]

DESCRIPTION
       tcptraceroute is a traceroute implementation using TCP packets.

       The  more  traditional  traceroute(8)  sends out either UDP or ICMP ECHO packets with a TTL of one, and increments the TTL until the destination has been reached.  By printing the
       gateways that generate ICMP time exceeded messages along the way, it is able to determine the path packets are taking to reach the destination.

       The problem is that with the widespread use of firewalls on the modern Internet, many of the packets that traceroute(8) sends out end up being filtered, making  it  impossible  to
       completely trace the path to the destination.  However, in many cases, these firewalls will permit inbound TCP packets to specific ports that hosts sitting behind the firewall are
       listening for connections on.  By sending out TCP SYN packets instead of UDP or ICMP ECHO packets, tcptraceroute is able to bypass the most common firewall filters.

       It is worth noting that tcptraceroute never completely establishes a TCP connection with the destination host.  If the host is not listening for incoming connections, it will  re‐
       spond with an RST indicating that the port is closed.  If the host instead responds with a SYN|ACK, the port is known to be open, and an RST is sent by the kernel tcptraceroute is
       running on to tear down the connection without completing three-way handshake.  This is the same half-open scanning technique that nmap(1) uses when passed the -sS flag.

OPTIONS
       -n     Display numeric output, rather than doing a reverse DNS lookup for each hop.  By default, reverse lookups are never attempted on RFC1918 address space, regardless of the -n
              flag.

       -N     Perform a reverse DNS lookup for each hop, including RFC1918 addresses.

       -f     Set the initial TTL used in the first outgoing packet.  The default is 1.

       -m     Set the maximum TTL used in outgoing packets.  The default is 30.

       -p     Use the specified local TCP port in outgoing packets.  The default is to obtain a free port from the kernel using bind(2).  Unlike with traditional traceroute(8), this num‐
              ber will not increase with each hop.

       -s     Set the source address for outgoing packets.  See also the -i flag.

       -i     Use the specified interface for outgoing packets.

       -q     Set the number of probes to be sent to each hop.  The default is 3.

       -w     Set the timeout, in seconds, to wait for a response for each probe.  The default is 3.

       -S     Set the TCP SYN flag in outgoing packets.  This is the default, if neither -S or -A is specified.

       -A     Set the TCP ACK flag in outgoing packets.  By doing so, it is possible to trace through stateless firewalls which permit outgoing TCP connections.

       -E     Send ECN SYN packets, as described in RFC2481.

       -t     Set the IP TOS (type of service) to be used in outgoing packets.  The default is not to set any TOS.

       -F     Set the IP "don't fragment" bit in outgoing packets.

       -l     Set the total packet length to be used in outgoing packets.  If the length is greater than the minimum size required to assemble the necessary probe  packet  headers,  this
              value is automatically increased.

       -d     Enable debugging, which may or may not be useful.

       --dnat
              Enable  DNAT detection, and display messages when DNAT transitions are observed.  DNAT detection is based on the fact that some NAT devices, such as some Linux 2.4 kernels,
              do not correctly rewrite the IP address of the IP packets quoted in ICMP time-exceeded messages tcptraceroute solicits, revealing the destination  IP  address  an  outbound
              probe packet was NATed to.  NAT devices which correctly rewrite the IP address quoted by ICMP messages, such as some Linux 2.6 kernels, will not be detected.  For some tar‐
              get hosts, it may be necessary to use --dnat in conjunction with --track-port.  See the examples.txt file for examples.

       --no-dnat
              Enable DNAT detection for the purposes of correctly identifying ICMP time-exceeded messages that match up with outbound probe packets, but do not display  messages  when  a
              DNAT transition is observed.  This is the default behavior.

       --no-dnat-strict
              Do not perform any DNAT detection whatsoever.  No attempt will be made match up ICMP time-exceeded messages with outbound probe packets, and when tracerouting through a NAT
              device which does not rewrite the IP addresses of the IP packets quoted in ICMP time-exceeded messages, some hops along the path may appear to be unresponsive.  This option
              should not be needed in the vast majority of cases, but may be utilized if it is suspected that the DNAT detection code is misidentifying ICMP time-exceeded messages.

EXAMPLES
       Please see the examples.txt file included in the tcptraceroute distribution for a few real world examples.

       To trace the path to a web server listening for connections on port 80:

              tcptraceroute webserver

       To trace the path to a mail server listening for connections on port 25:

              tcptraceroute mailserver 25

BUGS
       No  error  checking  is  performed  on  the source address specified by the -s flag, and it is therefore possible for tcptraceroute to send out TCP SYN packets for which it has no
       chance of seeing a response to.

AUTHOR
       Michael C. Toren <mct@toren.net>

AVAILABILITY
       For updates, please see:
              http://michael.toren.net/code/tcptraceroute/

SEE ALSO
       traceroute(8), ping(8), nmap(1)

                                                                                       2006 March 28                                                                      TCPTRACEROUTE(1)
