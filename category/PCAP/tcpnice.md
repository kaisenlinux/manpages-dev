TCPNICE(8)                                                                        System Manager's Manual                                                                       TCPNICE(8)

NAME
       tcpnice - slow down TCP connections on a LAN

SYNOPSIS
       tcpnice [-A] [-I] [-M] [-i interface] expression

DESCRIPTION
       tcpnice slows down specified TCP connections on a LAN via "active" traffic shaping.

OPTIONS
       -A     Inject TCP tiny window advertisements.

       -I     Inject ICMP source quench replies.

       -M     Inject ICMP fragmentation-needed replies with tiny next-hop MTUs.

       -i interface
              Specify the interface to listen on.

       expression
              Specify a tcpdump(8) filter expression to select the connections to slow down.

       If no attack type is given, all attacks will be enabled.

SEE ALSO
       dsniff(8), tcpkill(8)

AUTHOR
       Dug Song <dugsong@monkey.org>

                                                                                                                                                                                TCPNICE(8)
