IFSTAT(1)                                                                            System Utilities                                                                            IFSTAT(1)

NAME
       ifstat - Report InterFace STATistics

SYNOPSIS
       ifstat [-a] [-l] [-z] [-n] [-v] [-h] [-t] [-i if0,if1,...] [-d drv[:opt]] [-s [comm@][#]host[/nn]] [-T] [-A] [-w] [-W] [-S] [-b] [-q] [delay[/delay] [count]]

DESCRIPTION
       Ifstat is a little tool to report interface activity, just like iostat/vmstat do for other system statistics.

OPTIONS
       ifstat accepts the following options:

       -l  Enables monitoring of loopback interfaces for which statistics are available. By default, ifstat monitors all non-loopback interfaces that are up.

       -a  Enables monitoring of all interfaces found for which statistics are available.

       -z  Hides interface which counters are null, eg interfaces that are up but not used.

       -i  Specifies the list of interfaces to monitor, separated by commas (if an interface name has a comma, it can be escaped with '\'). Multiple instances of the options are added
           together.

       -s  Equivalent to -d snmp:[comm@][#]host[/nn]] to poll a remote host through SNMP. See below for details.

       -h  Displays a short help message.

       -n  Turns off displaying the header periodically.

       -t  Adds a timestamp at the beginning of each line.

       -T  Reports total bandwith for all monitored interfaces.

       -A  Disables use of interface indexes: by default, when polling mechanism is index based (snmp, ifmib), ifstat remembers indexes of monitored interfaces to poll only them. How‐
           ever, if interfaces indexes change often (new interfaces added, etc), you might loose some stats, hence this flag. Note that if you ask ifstat to monitor a non existent inter‐
           face, it will poll all interfaces until it finds the requested one (regardless of this flag) so you can poll for an interface that goes up and down.

       -w  Uses fixed width columns, instead of enlarging them if needed for interfaces names to fit.

       -W  Wrap lines that are larger than the terminal width (implies -w). Wrapped lines are prefixed with a cycling letter to ease reading.

       -S  Keep stats updated on the same line if possible (no scrolling nor wrapping).

       -b  Reports bandwith in kbits/sec instead of kbytes/sec.

       -q  Quiet mode, warnings are not printed.

       -v  Displays version and the compiled-in drivers.

       -d  Specifies a driver to use to gather stats and an eventual option for this driver separated of the driver name by a colon. If this is not specified, ifstat uses the first
           driver compiled in, with no options.

           The following drivers are available (depending on the operating system and compile-time options, not all of them might be present):

           proc
               This driver gets statistics from Linux's /proc/net/dev file. An alternate file name to get stats from can be passed as the option.

           ifmib
               This driver gets statistics from FreeBSD's ifmib sysctl. It doesn't accept any options.

           kstat
               This driver gets statistics from Solaris kstat interface. It doesn't accept any options.

           ifdata
               This driver gets statistics using SIOCGIFDATA ioctl under IRIX and OpenBSD (different semantics). It doesn't accept any options.

           route
               This driver gets statistics using routing sysctl on BSD based systems. It doesn't accept any options.

           kvm This driver gets statistics by reading the kernel live structures. It accepts an option specifying which files/devices to use in the following format : [execfile][,[core‐
               file][,swapfile]] (see kvm_open(3) for details on those fields). If a null string is passed for a parameter, the system default will be used for it.

               Note that for this driver to work, ifstat needs to have read access to the system memory device. This is usually done by running it as root, or by installing setgid mem or
               kmem. ifstat will NOT install setgid by default; It is up to you to decide if you trust it.

           dlpi
               This driver gets statistics using the DLPI streams interface available on HP-UX. An alternate device to query statistics from can be passed as the option (default is
               /dev/dlpi).

           win32
               This driver gets statistics using the GetIfTable interface available on Win32 systems. It doesn't accept any options.

           snmp
               This driver gets statistics through SNMP. The option, in the form [comm@][#]host[/nn]], specifies the host and eventual community to poll. Default community is public, but
               can be changed by prepending "comm@" to the hostname. If host starts by a #, interface names are generated from their index as `ifNN' (this is a workaround for some equip‐
               ments that give all interfaces the same description). Default host is localhost, and this will be used by default if snmp is the only available driver.

               The driver will try to poll several interfaces at once by grouping requests in SNMP packets. By default interfaces will be polled by group of 8. If this doesn't work well
               with your equipments, you can lower that number by suffixing the hostname with /nn, where nn is the number of interfaces to poll at once. You can also increase the number
               if you want to poll a large number of interfaces efficiently and if your server supports it.

       delay
           delay is the delay between updates in seconds, which defaults to 1.  A decimal number can be specified for intervals shorter than a second. (minimum 0.1)

           A second delay can also be specified (separated from the first one by a '/'). In that case the first delay will be used for the first poll after start and the second one will
           be used for all following polls (This can be used to have a "fast" start when running for a long while with a big delay).

       count
           count is the number of updates before stopping. If not specified, it is unlimited.

SEE ALSO
       vmstat(1), iostat(1)

AUTHOR
       Gaël Roualland, <gael.roualland@dial.oleane.com>

ifstat 1.1                                                                              2003-11-22                                                                               IFSTAT(1)
