NETHOGS(8)                                                                          System Manager's Manual                                                                          NETHOGS(8)

NAME
       nethogs - Net top tool grouping bandwidth per process

SYNOPSIS
       nethogs [-h] [-V] [-d] [-v] [-t] [-c] [-p] [-s] [device(s)]

DESCRIPTION
       NetHogs  is  a  small  'net top' tool. Instead of breaking the traffic down per protocol or per subnet, like most such tools do, it groups bandwidth by process - and does not rely on a
       special kernel module to be loaded. So if there's suddenly a lot of network traffic, you can fire up NetHogs and immediately see which PID is causing this, and if  it's  some  kind  of
       spinning process, kill it.

   Options
       -h     display available commands usage.

       -V     prints Version info.

       -d     delay for refresh rate.

       -v     select view mode

       -p     sniff in promiscious mode (not recommended).

       -t     tracemode.

       -c     limit number of refreshes

       -s     sort by traffic sent

       device(s) to monitor. By default eth0 is being used.

INTERACTIVE CONTROL
       m      cycle between display modes (kb/s, kb, b, mb)

       r      sort by 'received'

       s      sort by 'sent'

       q      quit

SEE ALSO
       netstat(8) tcpdump(1) pcap(3)

AUTHOR
       Written by Arnout Engelen <arnouten@bzzt.net>.

                                                                                        14 February 2004                                                                             NETHOGS(8)
