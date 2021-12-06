DNSSPOOF(8)                                                                       System Manager's Manual                                                                      DNSSPOOF(8)

NAME
       dnsspoof - forge replies to DNS address / pointer queries

SYNOPSIS
       dnsspoof [-i interface] [-f hostsfile] [expression]

DESCRIPTION
       dnsspoof  forges replies to arbitrary DNS address / pointer queries on the LAN. This is useful in bypassing hostname-based access controls, or in implementing a variety of man-in-
       the-middle attacks.

OPTIONS
       -i interface
              Specify the interface to use.

       -f hostsfile
              Specify the pathname of a file in hosts(5) format. Only one hostname allowed per line (no aliases), although hostnames may contain wildcards (such as *.doubleclick.net).

       expression
              Specify a tcpdump(8) filter expression to select traffic to sniff.

       If no hostsfile is specified, replies will be forged for all address queries on the LAN with an answer of the local machine's IP address.

FILES
       /usr/share/dsniff/dnsspoof.hosts
              Sample hosts file.

SEE ALSO
       dsniff(8), hosts(5)

AUTHOR
       Dug Song <dugsong@monkey.org>

                                                                                                                                                                               DNSSPOOF(8)
