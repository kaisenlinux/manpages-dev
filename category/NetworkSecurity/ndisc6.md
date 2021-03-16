NDISC6(8)                                                              System Manager's Manual                                                             NDISC6(8)

NAME
       ndisc6 - ICMPv6 Neighbor Discovery tool

SYNOPSIS
       ndisc6 [-1mnqv] [-r attempts] [-s source_ip] [-w wait_ms] <IPv6 address> <iface>

DESCRIPTON
       NDisc6 is an Unix program which implements the ICMPv6 Neighbor Discovery in userland (it is normally done by the kernel). It is used to lookup the link-layer
       address (layer 2 address, MAC in the case of Ethernet) of any on-link IPv6 node.

       The IPv6 address of the node must be specified, as well as the networking interface on which to perform the lookup.

OPTIONS
       -1 or --single
              Exit as soon as the first advertisement is received (default).

       -h or --help
              Display some help and exit.

       -m or --multiple
              Wait for possible duplicate advertisements and print all of them.

       -n or --numeric
              If the first parameter is not a valid IPv6 address, do not try to resolve it as a DNS hostname.

       -q or --quiet
              Only display link-layer address. Display nothing in case of failure.  That is mostly useful when calling the program from a shell script.

       -r attempts or --retry attempts
              Send ICMPv6 Neighbor Discovery that many times until a reply is received, or abort. By default, ndisc6 will try 3 times  before  aborting  (MAX_MULTI‐
              CAST_SOLICIT and MAX_UNICAST_SOLICIT from RFC2461).

       -s source_ip or --source source_ip
              Specify the IPv6 address to be used as the source for the neighbor solicitation packets.

       -V or --version
              Display program version and license and exit.

       -v or --verbose
              Display verbose information. That is the default.

       -w wait_ms or --wait wait_ms
              Wait wait_ms milliseconds for a response before retrying.  By default, ndisc6 waits 1 second between each attempts (RETRANS_TIMER from RFC2461).

       If  ndisc6  does not receive any response after the specified number of attempts waiting for wait_ms milliseconds each time, it will exit with code 2. On er‐
       ror, it exits with code 1.  Otherwise it exits with code 0. This makes it possible to use the exit code to see if a host is on-link or not.

DIAGNOSTICS
       If you get no response while you know the remote host is up, it is most likely that it is not on-link, that is to say, you must cross one or more routers  to
       reach  it.  By  design, IPv6 nodes ignore ICMPv6 Neighbor Discovery packets received from nodes not on the same link (i.e. Ethernet segment), for the sake of
       security. Technically, that is done by ensuring that the Hop limit (TTL) is 255.

       Note that you cannot use ndisc6 to lookup the local host's link-layer address.

SECURITY
       ndisc6 should be setuid root to allow use by non-privileged users. It will drop its root privileges before any attempt is made to send or receive  data  from
       the network to reduce the possible impact of a security vulnerability.

SEE ALSO
       ping6(8), rdisc6(8), ipv6(7)

AUTHOR
       Rémi Denis-Courmont <remi at remlab dot net>

       http://www.remlab.net/ndisc6/

ndisc6                                                                         $Date$                                                                      NDISC6(8)
