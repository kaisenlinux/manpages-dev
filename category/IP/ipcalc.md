ipcalc(1)                                                                         General Commands Manual                                                                        ipcalc(1)

NAME
       ipcalc - An IPv4 Netmask/broadcast/etc calculator

SYNOPSIS
        ipcalc  [options] ADDRESS[[/]NETMASK] [NETMASK]

DESCRIPTION
       ipcalc  takes an IPv4 address and netmask and calculates the resulting broadcast, network, Cisco wildcard mask, and host range. By giving a second netmask, you can design sub- and
       supernetworks. It is also intended to be a teaching tool and presents the results as easy-to-understand binary values.

       --help Display help usage

       -n, --nocolor
              Don't display ANSI color codes

       -b, --nobinary
              Suppress the bitwise output

       -c, --class
              Just print bit-count-mask of given address

       -h, --html
              Display results as HTML

       -v, --version
              Print Version

       -s, --split n1 n2 n3.
              Split into networks of size n1, n2, n3

       -r, --range
              Deaggregate address range

EXAMPLES
       ipcalc 192.168.0.1/24

       ipcalc 192.168.0.1/255.255.128.0

       ipcalc 192.168.0.1 255.255.128.0 255.255.192.0

       ipcalc 192.168.0.1 0.0.63.255

       deaggregate address range
              ipcalc <ADDRESS1> - <ADDRESS2>

       split network to subnets where a b c fits in
              ipcalc <ADDRESS>/<NETMASK> -s a b c

AUTHOR
            Written by Krischan Jodies <krischan@jodies.de>

SEE ALSO
       ipsc(1) gipsc(1)

       The ipcalc website: http://jodies.de/ipcalc

                                                                                             .                                                                                   ipcalc(1)
