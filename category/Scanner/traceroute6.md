TRACEROUTE6(8)                                                                    System Manager's Manual                                                                   TRACEROUTE6(8)

NAME
       rltraceroute6 - IPv6 traceroute tool

       tcptraceroute6 - TCP/IPv6 traceroute tool

SYNOPSIS
       traceroute6  [-AdEILlnrSU]  [-f  min_hop]  [-g  hop]  [ -i iface] [-m max_hop] [-p port] [-q attempts] [ -s source] [-t tclass] [-w wait] [-z delay_ms] < hostname/address> [packet
       length]

       tcptraceroute6 [-AdEnrS] [-f min_hop] [-g hop] [ -i iface] [-l packet_size] [-m max_hop] [-p port] [ -q attempts] [-s source] [-t tclass] [-w wait] [ -z delay_ms]  <  hostname/ad‐
       dress> [port]

DESCRIPTON
       rltraceroute6 is an IPv6 traceroute implementation.

       It  displays  the  list  of hops along the network route between the local system and specified destination, by sending packets while incrementing their hop limit, until the final
       destination is reached.

       By default, rltraceroute6 sends UDP probe packets toward the destination (that's the historical default).  However, it can also send TCP packets, much like Michael C. Toren's tcp‐
       traceroute  does on IPv4 networks; tcptraceroute6 sends TCP packets by default (and mimics tcptraceroute command line syntax).  Finally, it can also send ICMPv6 Echo Request pack‐
       ets, like some other traceroute implementations (such as the one in Microsoft Windows); tracert6 does this by default.

       You must specify the name or address of the host toward which the network route should be determined. An optional additional parameter specifies either the  probe  packets  length
       (for UDP and ICMP packets), or the destination port number/service name (for TCP packets).

       Note that TCP destination port zero really is TCP port numbered 0 (which cannot be used via the standard higer-level TCP/IP programming interface).

OPTIONS
       -A     Send  TCP/ACK  probe packets. That's very efficient against stateless firewalls (e.g. the official Linux kernel versions up to and including 2.4.31 and 2.6.14), and utterly
              helpless against stateful ones. Note that TCP/ACK probing cannot determine whether the destination TCP port is open or not.

       -d     Enable socket debugging option (SO_DEBUG). Unless you are debugging the kernel, this is probably not going to have any actual effect.

       -E     Send ECN-setup TCP/SYN probe packets (as per RFC 3168) rather than non-ECN-setup TCP/SYN probe packets. This has no effect unless command line  optin  -S  is  specified  as
              well.

       -F     This option is ignored for backward compatibility.  IPv6 packets are never fragmented en route.

       -f     Override the initial IPv6 packets hop limit (default: 1).

       -g     Add an IPv6 route segment within an IPv6 Routing Header.  This enables loose source routing.  Currently, only "Type 0" routing header is supported.

       -h     Display some help and exit.

       -I  (rltraceroute6 only)
              Send ICMPv6 Echo requests (like ping6) as probe packets.  That's the default for tracert6.

       -i     Only send packets through the specified interface.  See also BUGS.

       -I  (rltraceroute6 only)
              Send UDP-Lite (protocol 136) packets (with full checksum coverage) as probe packets instead of normal UDP (protocol 17).

       -l (rltraceroute6 only)
              Print the hop limit of received packets.  This is mostly used to detect asymmetric routing.

       -l (tcptraceroute6 only)
              Specify the size (bytes) of sent packets.

       -m     Override the maximum hop limit (maximum number of hops).  The default is 30 hops which should be sufficient on the IPv6 Internet for some time.

       -N     Try to resolve each hop's IPv6 address to a host name. This is the default.  This option is meant for backward compatibility with tcptraceroute(8).

       -n     Do not try to resolve each hop's IPv6 address to a host name.  That may speed up the traceroute significantly.

       -p     For  rltraceroute6,  specify  the  base  destination port number (default: 33434).  rltraceroute6 assumes that packets toward this port up to this port plus the maximum hop
              limit are not in use by any program on the final destination and that they are not blocked by some firewall. The fact that this very  assumption  was  not  always  correct,
              eventually lead to the development of the original IPv4 tcptraceroute by Michael Toren.

              For  tcptraceroute6, specify the source port number (default: auto).  Note that source port number zero really means number zero, rather than some port number that would be
              automatically assigned, as is the case with usual softwares.

       -q     Override the number of probes sent to each hop (default: 3).

       -r     Do not route packets, i.e. do not send packets through a gateway that would be specified by the routing table.  See also BUGS.

       -S     Use TCP/SYN probe packets. That's the default for tcptraceroute6.

       -s     Specify the source address to use for probe packets explicitly.

       -S     Use UDP probe packets. That's the default for rltraceroute6.

       -t     Specify the traffic class (DSCP) for probe packets.  See also BUGS.

       -U  (rltraceroute6 only)
              Send UDP probe packets. That's the default.

       -V     Display program version and license and exit.

       -w     Override the delay (in seconds) to wait for response once a given probe packet was sent (default: 5 seconds).

       -x     This option is ignored for seamless migration from IPv4 traceroute.  The IPv6 header has no checksum field.

       -z     Specify a milliseconds delay to wait between each probe with identical hop limit.  This can be useful to work-around ICMPv6 rate limitation on some hosts.

DIAGNOSTICS
       If a response is received, the round-trip time is printed.  In addition, specific symbols denote certain errors:

       *   No response
              No valid response received before the timeout delay (see -w option).

       !N  No route to destination
              There is no entry for the destination network in the routing table.

       !A  Communication with destination administratively prohibited
              A firewall explicitly rejected the traffic.

       !S  Beyond scope of source address
              The address scope of the source address is too small to reach the destination address. At the time of writing, this can only happen when using a link-local  source  address
              to reach a global scope destination.  (Note: some IPv4 traceroute implementations use !S for source route error which is completely different)

       !H  Address unreachable
              The host address is not reachable for some other reasons, particularly a link-layer failure (e.g. Neighbor discovery failure).

       !P  Unrecognized Next Header type encountered
              The destination does not implement the layer-4 protocol used.  You should retry with ICMPv6 Echo Requests (-I command line option) which MUST be supported by any IPv6 node.

SECURITY
       rltraceroute6  should  be setuid root to allow use by non privileged users. It will drop its root privileges before any attempt is made to send or receive data from the network so
       as to reduce the possible impact of a security vulnerability.

BUGS
       However useful they might be, -i and -r options are ignored by the official Linux kernel at the time of writing this manpage, and hence do not work as documented.

       Support for option -t was broken until Linux kernel version 2.6.18.

       Usage of Routing Header, with option -g, triggers an OOPS on Linux kernel versions below 2.6.17.12.

       Receiving TCP/SYN-ACK packets does not work on FreeBSD at all.  This severely limits the usefulness of tcptraceroute6 on FreeBSD.

       Packet length takes the IPv6 header and, if present, extension headers into account.  rltraceroute6 versions before 0.7.4 used it as IPv6 payload length instead, i.e. did not  in‐
       clude the layer-3 headers in the computation.  Linux iputils traceroute6 does not even include the UDP header.  On the whole, the packet length semantic is very inconsistent among
       IPv6 traceroute implementations.

SEE ALSO
       ipv6(7), traceroute(8), tcptraceroute(8), traceroute6(8)

AUTHOR
       Rémi Denis-Courmont <remi at remlab dot net>

       http://www.remlab.net/ndisc6/

traceroute6                                                                               $Date$                                                                            TRACEROUTE6(8)
