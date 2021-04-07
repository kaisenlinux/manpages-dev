darkstat(8)                                                                       System Manager's Manual                                                                      darkstat(8)

NAME
       darkstat - network statistics gatherer

SYNOPSIS
       darkstat [ -i interface ] [ -r file ] [ --snaplen bytes ] [ --pppoe ] [ --syslog ] [ --verbose ] [ --no-daemon ] [ --no-promisc ] [ --no-dns ] [ --no-macs ] [ --no-lastseen ] [ -p
       port ] [ -b bindaddr ] [ --base path ] [ -f filter ] [ -l network/netmask ] [ --local-only ] [ --chroot dir ] [ --user username ] [ --daylog filename ] [  --import  filename  ]  [
       --export  filename  ]  [  --pidfile  filename ] [ --hosts-max count ] [ --hosts-keep count ] [ --ports-max count ] [ --ports-keep count ] [ --highest-port port ] [ --wait secs ] [
       --hexdump ]

DESCRIPTION
       darkstat is a packet sniffer that runs as a background process, gathers all sorts of statistics about network usage, and serves them over HTTP.

       All settings are passed on the commandline.

OPTIONS
       -i interface
              Capture traffic on the specified network interface.  This is the only mandatory commandline argument.

       -r file
              Instead of capturing live traffic, read it from a pcap(3) capture file.  This is only useful for development and benchmarking.  The -r and -i arguments are mutually  exclu‐
              sive.

       --snaplen bytes
              How many bytes to capture from the start of each packet.  You should not need to specify this; darkstat will calculate it automatically.

       --pppoe
              Don't use this.

              Instead, capture on the tunnel interface that your PPPoE software provides, for example tun0 on FreeBSD, pppoe0 on OpenBSD or NetBSD.

              If  you  really  must,  you can capture on an Ethernet interface and pass this argument to have darkstat decode PPPoE frames and ignore everything else.  Make sure you also
              specify your local address with the -l argument!

       --syslog
              Errors, warnings, and verbose messages will go to syslog (facility daemon, priority debug) instead of stderr.

              On some systems, these messages end up in /var/log/debug by default.

       --verbose
              Produce more verbose debugging messages.

       --no-daemon
              Do not detach from the controlling terminal; stay in the foreground.

       --no-promisc
              Do not use promiscuous mode to capture.  Note that an interface may already be in promiscuous mode, or may later enter promiscuous mode, due to circumstances  beyond  dark‐
              stat's control.  If this is a problem, use -f to specify an appropriate bpf(4) filter.

       --no-dns
              Do not resolve IPs to host names.  This can significantly reduce memory footprint on small systems as an extra process is created for DNS resolution.

       --no-macs
              Do not display MAC addresses in the hosts table.

       --no-lastseen
              Do not display the last seen time in the hosts table.

       -p port
              Bind the web interface to the specified port.  The default is 667.

       -b bindaddr
              Bind the web interface to the specified address.  The default is to listen on all interfaces.

       --base path
              Specify the path of the base URL.  This can be useful if darkstat is accessed via a reverse proxy.

              For example, if you use Apache's mod_proxy and want to avoid a complicated setup with mod_proxy_html (and mod_header to unset the Accept-Encoding header), just set the base
              path to something like stats and use a config similar to the following snippet:

                      ProxyPass /stats/ http://localhost:667/stats/
                      ProxyPassReverse /stats/ http://localhost:667/stats/

              The default is / (i.e. the root).

       -f filter
              Use the specified filter expression when capturing traffic.  The filter syntax is beyond the scope of this manual page; please refer to the tcpdump(8) documentation.

       -l network/netmask
              Define a "local network" according to the network and netmask addresses.  All traffic entering or leaving this network will be graphed, as opposed to the default  behaviour
              of only graphing traffic to and from the local host.

              The rule is that if ip_addr & netmask == network, then that address is considered local.  See the usage example below.

       --local-only
              Make the web interface only display hosts on the "local network."  This is intended to be used together with the -l argument.

       --chroot dir
              Force darkstat to chroot() into the specified directory.  Without this argument, a default directory will be used, which is determined at build time.  Usually /var/empty or
              /var/lib/empty.

              For security reasons, this directory should be empty, and the user that darkstat is running as should not have write access to it.

              However, if you wish to use --daylog or --export, darkstat will need write access to the chroot.  If you are uncomfortable with the security  implications,  don't  use  any
              functionality that requires write access.

       --user username
              Force  darkstat  to drop privileges to the uid and gid of the specified user.  Without this argument, a default value will be used, which is set at build time.  Usually no‐
              body.

              For security reasons, this should not be root.

       --daylog filename
              Log daily traffic statistics into the named file, relative to the chroot directory.  If you wish to use --daylog, you must first specify a --chroot directory, and  it  must
              be writeable by the darkstat user.  A writeable chroot has security implications; if you are uncomfortable with this, do not use the --daylog functionality.

              If the daylog argument is not specified, no logging is performed.

              The daylog format is:

              localtime|time_t|bytes_in|bytes_out|pkts_in|pkts_outs

              Lines starting with a # are comments stating when logging started and stopped.

       --import filename
              Upon  starting, import a darkstat database from the named file, relative to the chroot directory.  If you wish to use --import, you must first specify a --chroot directory.
              If the import is unsuccessful, darkstat will start with an empty database.

       --export filename
              On shutdown, or upon receiving SIGUSR1 or SIGUSR2, export the in-memory database to the named file, relative to the chroot directory.  If you wish to use --export, you must
              first  specify  a  --chroot directory, and it must be writeable by the darkstat user.  A writeable chroot has security implications - if you are uncomfortable with this, do
              not use the --export functionality.

       --pidfile filename
              Creates a file containing the process ID of darkstat.  This file will be unlinked upon clean shutdown.  As with all pidfiles, if darkstat dies uncleanly,  a  stale  pidfile
              can be left over.

              For example, start darkstat with:

                     darkstat -i fxp0 --chroot /var/run/darkstat --pidfile darkstat.pid

              And stop with:

                     kill `cat /var/run/darkstat/darkstat.pid`

              By default, kill(1) will send SIGTERM, which will cause darkstat to shut down cleanly.

       --hosts-max count
              The maximum number of hosts that will be kept in the hosts table.  This is used to limit how much accounting data will be kept in memory.  The number of --hosts-max must be
              greater than --hosts-keep

       --hosts-keep count
              When the hosts table hits --hosts-max and traffic is seen from a new host, we clean out the hosts table, keeping only the top --hosts-keep number of hosts, sorted by  total
              traffic.

       --ports-max count
              The  maximum  number of ports that will be tracked for each host.  This is used to limit how much accounting data will be kept in memory.  The number of --ports-max must be
              greater than --ports-keep

       --ports-keep count
              When a ports table fills up, this many ports are kept and the rest are discarded.

       --highest-port port
              Ports that are numerically higher than this will not appear in the per-host ports tables, although their traffic will still be accounted for.  This  can  be  used  to  hide
              ephemeral ports.  By default, all ports are tracked.

       --wait secs
              Don't use this.  It's a hack to help victims of NetworkManager and similar systems.

              You  should  start darkstat after the capture interface has come up.  If you can't, specifying the --wait option will make darkstat sleep up to the specified number of sec‐
              onds for the interface to become ready.  Zero means wait indefinitely.

       --hexdump
              Show hex dumps of received traffic.  This is only for debugging, and implies --verbose and --no-daemon.

USAGE EXAMPLES
       To gather statistics on the fxp0 interface:

              darkstat -i fxp0

       We want to account for traffic on the Internet-facing interface, but only serve web pages to our private local network where we have the IP address 192.168.0.1:

              darkstat -i fxp0 -b 192.168.0.1

       We want to serve web pages on the standard HTTP port:

              darkstat -i fxp0 -p 80

       We are on Optus (cable) and don't want to account for the constant ARP traffic we are receiving:

              darkstat -i fxp0 -f "not arp"

       We only want to account for SSH traffic:

              darkstat -i fxp0 -f "port 22"

       We don't want to account for traffic between internal IPs:

              darkstat -i fxp0 -f "not (src net 192.168.0 and dst net 192.168.0)"

       (For a full reference on filter syntax, refer to the tcpdump(8) manpage)

       We have a network consisting of a gateway server (192.168.1.1) and a few workstations (192.168.1.2, 192.168.1.3, etc.) and we want to graph all traffic entering  and  leaving  the
       local network, not just the gateway server (which is running darkstat):

              darkstat -i fxp0 -l 192.168.1.0/255.255.255.0

       On  some systems, we can't capture on a "decoded" interface but only on nas0 which returns PPPoE encapsulated packets.  Do PPPoE decoding, and override the local IP manually since
       it cannot be automatically detected.  Note the /32 netmask:

              darkstat -i nas0 --pppoe -l 192.168.1.1/255.255.255.255

SIGNALS
       To shut darkstat down cleanly, send a SIGTERM or SIGINT signal to the darkstat parent process.

       Sending the SIGUSR1 signal will cause darkstat to empty out its in-memory database.  If an --export file was set, it will first save the database to file.   Sending  SIGUSR2  will
       save the database without emptying it.

FREQUENTLY ASKED QUESTIONS
   How many bytes does each bar on the graph represent?
       Hover your mouse cursor over a bar and you should get a tooltip saying exactly how many bytes in and out the bar represents.

   Why aren't there labels / tics / a scale on the graphs?
       Because implementing them is hard.  And doing so correctly, and in a way that works across all browsers, looks pretty much impossible.

       I might attempt it some day.  In the meantime, patches would be gladly accepted.

   Why are the graphs blank? All the bars are zero.
       The graphs only show traffic in/out of the local host, which is determined by getting the IP address of the interface you're sniffing on.

       You can use the -l argument to override the local address for accounting purposes.  You can also use it to do accounting for a whole subnet by specifying an appropriate netmask.

SEE ALSO
       tcpdump(8)

HISTORY
       darkstat was written in 2001, largely as a result of a certain Australian cable Internet provider introducing a 3GB monthly traffic limit.

AUTHORS
       Emil Mikulic and others. (see the AUTHORS file)

WEBSITE
       https://unix4lyfe.org/darkstat/

darkstat 3.0.719                                                                         June 2011                                                                             darkstat(8)
