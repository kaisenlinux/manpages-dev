ARPSPOOF(8)                                                                       System Manager's Manual                                                                      ARPSPOOF(8)

NAME
       arpspoof - intercept packets on a switched LAN

SYNOPSIS
       arpspoof [-i interface] [-c own|host|both] [-t target] [-r] host

DESCRIPTION
       arpspoof  redirects packets from a target host (or all hosts) on the LAN intended for another host on the LAN by forging ARP replies.  This is an extremely effective way of sniff‐
       ing traffic on a switch.

       Kernel IP forwarding (or a userland program which accomplishes the same, e.g. fragrouter(8)) must be turned on ahead of time.

OPTIONS
       -i interface
              Specify the interface to use.

       -c own|host|both
              Specify which hardware address t use when restoring the arp configuration; while cleaning up, packets can be send with the own address as well as with the  address  of  the
              host.  Sending  packets  with a fake hw address can disrupt connectivity with certain switch/ap/bridge configurations, however it works more reliably than using the own ad‐
              dress, which is the default way arpspoof cleans up afterwards.

       -t target
              Specify a particular host to ARP poison (if not specified, all hosts on the LAN). Repeat to specify multiple hosts.

       -r     Poison both hosts (host and target) to capture traffic in both directions.  (only valid in conjuntion with -t)

       host   Specify the host you wish to intercept packets for (usually the local gateway).

SEE ALSO
       dsniff(8), fragrouter(8)

AUTHOR
       Dug Song <dugsong@monkey.org>

                                                                                                                                                                               ARPSPOOF(8)
