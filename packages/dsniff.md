DSNIFF(8)                                                                         System Manager's Manual                                                                        DSNIFF(8)

NAME
       dsniff - password sniffer

SYNOPSIS
       dsniff [-c] [-d] [-m] [-n] [-i interface | -p pcapfile] [-s snaplen] [-f services] [-t trigger[,...]]]  [-r|-w savefile] [expression]

DESCRIPTION
       dsniff is a password sniffer which handles FTP, Telnet, SMTP, HTTP, POP, poppass, NNTP, IMAP, SNMP, LDAP, Rlogin, RIP, OSPF, PPTP MS-CHAP, NFS, VRRP, YP/NIS, SOCKS, X11, CVS, IRC,
       AIM, ICQ, Napster, PostgreSQL, Meeting Maker, Citrix ICA, Symantec pcAnywhere, NAI Sniffer, Microsoft SMB, Oracle SQL*Net, Sybase and Microsoft SQL protocols.

       dsniff automatically detects and minimally parses each application protocol, only saving the interesting bits, and uses Berkeley DB as its output file format, only logging  unique
       authentication attempts. Full TCP/IP reassembly is provided by libnids(3).

       I wrote dsniff with honest intentions - to audit my own network, and to demonstrate the insecurity of cleartext network protocols.  Please do not abuse this software.

OPTIONS
       -c     Perform half-duplex TCP stream reassembly, to handle asymmetrically routed traffic (such as when using arpspoof(8) to intercept client traffic bound for the local gateway).

       -d     Enable debugging mode.

       -m     Enable automatic protocol detection.

       -n     Do not resolve IP addresses to hostnames.

       -i interface
              Specify the interface to listen on.

       -p pcapfile
              Rather than processing the contents of packets observed upon the network process the given PCAP capture file.

       -s snaplen
              Analyze at most the first snaplen bytes of each TCP connection, rather than the default of 1024.

       -f services
              Load triggers from a services file.

        -t trigger[,...]
              Load triggers from a comma-separated list, specified as port/proto=service (e.g. 80/tcp=http).

       -r savefile
              Read sniffed sessions from a savefile created with the -w option.

       -w file
              Write sniffed sessions to savefile rather than parsing and printing them out.

       expression
              Specify a tcpdump(8) filter expression to select traffic to sniff.

       On a hangup signal dsniff will dump its current trigger table to dsniff.services.

FILES
       /usr/share/dsniff/dsniff.services
              Default trigger table

       /usr/share/dsniff/dsniff.magic
              Network protocol magic

SEE ALSO
       arpspoof(8), libnids(3), services(5), magic(5)

AUTHOR
       Dug Song <dugsong@monkey.org>

BUGS
       dsniff's automatic protocol detection feature is based on the classic file(1) command by Ian Darwin, and shares its historical limitations and bugs.

                                                                                                                                                                                 DSNIFF(8)
