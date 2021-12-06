SSHOW(8)                                                                          System Manager's Manual                                                                         SSHOW(8)

NAME
       sshow - SSH traffic analysis tool

SYNOPSIS
       sshow [-d] [-i interface | -p pcapfile] [expression]

DESCRIPTION
       sshow analyzes encrypted SSH-1 and SSH-2 traffic, identifying authentication attempts, the lengths of passwords entered in interactive sessions, and command line lengths.

       The following advisory describes the attacks implemented by sshow in detail:

              http://www.openwall.com/advisories/OW-003-ssh-traffic-analysis.txt

OPTIONS
       -d     Enable verbose debugging output.

       -i interface
              Specify the interface to listen on.

       -p pcapfile
              Process packets from the specified PCAP capture file instead of the network.

       expression
              Specify a tcpdump(8) filter expression to select traffic to sniff.

SEE ALSO
       dsniff(8), sshmitm(8)

AUTHORS
       Solar Designer <solar@openwall.com>
       Dug Song <dugsong@monkey.org>

                                                                                                                                                                                  SSHOW(8)
