  IPTRAF-NG
 
## NAME
        iptraf - Interactive Colorful IP LAN Monitor
 
## SYNOPSIS
        iptraf-ng { [ -f ] [ { -i iface | -g | -d iface | -s iface | -z iface | -l iface } [ -t timeout ] [ -B [ -L logfile ] ] ] | [ -h ] }
 
## DESCRIPTION
        iptraf-ng  is  an  ncurses-based IP LAN monitor that generates various network statistics including TCP info, UDP counts, ICMP and OSPF information, Ethernet
        load info, node stats, IP checksum errors, and others.
 
        If the iptraf-ng command is issued without any command-line options, the program comes up in interactive mode, with the various facilities  accessed  through
        the main menu.
 
## OPTIONS
        These options can also be supplied to the command:
 
        -i iface
               immediately start the IP traffic monitor on the specified interface, or all interfaces if "-i all" is specified
 
        -g     immediately start the general interface statistics
 
        -d iface
               allows you to immediately start the detailed on the indicated interface (iface)
 
        -s iface
               allows you to immediately monitor TCP and UDP traffic on the specified interface (iface)
 
        -z iface
               shows packet counts by size on the specified interface
 
        -l iface
               start the LAN station monitor on the specified interface, or all LAN interfaces if "-l all" is specified
 
        -t timeout
               tells IPTraf-ng to run the specified facility for only timeout minutes.  This option is used only with one of the above parameters.
 
        -B     redirect  standard  output  to /dev/null, closes standard input, and forks the program into the background.  Can be used only with one of the facility
               invocation parameters above.  Send the backgrounded process a USR2 signal to terminate.
 
        -L logfile
               allows you to specify an alternate log file name.  The default log file name is based on either the interface selected (detailed interface statistics,
               TCP/UDP service statistics, packet size breakdown), or the instance of the facility (IP traffic monitor, LAN station monitor).  If a path is not spec‐
               ified, the log file is placed in /var/log/iptraf-ng
 
        -f     clears all locks and counters, causing this instance of IPTraf-ng to think it's the first one running.  This should only be used to  recover  from  an
               abnormal termination or system crash.
 
        -h     shows a command summary
 
## SIGNALS
         SIGUSR1 - rotates log files while program is running
         SIGUSR2 - terminates an IPTraf-ng process running in the background.
 
## FILES
         /var/log/iptraf-ng/*.log - log file
         /var/lib/iptraf-ng/* - important IPTraf-ng data files
 
## SEE ALSO
         Documentation/* - complete documentation written by the author
 
## AUTHOR
        Gerard Paul Java (riker@mozcom.com)
 
 MANUAL## AUTHOR
        Frederic  Peters  (fpeters@debian.org),  using  iptraf-ng  -h  General  manual  page  modifications  by  Gerard  Paul  Java  (riker@mozcom.com), Phil Cameron
        (pcameron@redhat.com)
 
                                                                          IPTraf-ng Help Page                                                            IPTRAF-NG(8)
