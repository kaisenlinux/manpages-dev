TCPKILL(8)                                                                        System Manager's Manual                                                                       TCPKILL(8)

NAME
       tcpkill - kill TCP connections on a LAN

SYNOPSIS
       tcpkill [-i interface] [-1...9] expression

DESCRIPTION
       tcpkill kills specified in-progress TCP connections (useful for libnids-based applications which require a full TCP 3-whs for TCB creation).

OPTIONS
       -i interface
              Specify the interface to listen on.

       -1...9 Specify  the degree of brute force to use in killing a connection. Fast connections may require a higher number in order to land a RST in the moving receive window. Default
              is 3.

       expression
              Specify a tcpdump(8) filter expression to select the connections to kill.

SEE ALSO
       dsniff(8), tcpnice(8)

AUTHOR
       Dug Song <dugsong@monkey.org>

                                                                                                                                                                                TCPKILL(8)
