KISMET(1)                                                                         BSD General Commands Manual                                                                         KISMET(1)

NAME
     kismet — Wireless sniffing and monitoring

SYNOPSIS
     kismet [server-options] [--] [client-options]

     kismet_server [-nqs] [-t title] [-f config-file] [-c capture-source] [-C enable-capture-sources] [-l log-types] [-d dump-type] [-m max-packets-per-file] [-g gpshost:port]
     [-p listen-port] [-a allowed-hosts] [-N server-name]

     kismet_client [-qr] [-f config-file] [-s serverhost:port] [-g gui-type] [-c display-columns]

DESCRIPTION
     Kismet is an 802.11 layer2 wireless network detector, sniffer, and intrusion detection system.  Kismet will work with any wireless card which supports raw monitoring (rfmon) mode, and
     can sniff 802.11b, 802.11a, and 802.11g traffic.

     kismet identifies networks by passively collecting packets and detecting standard named networks, detecting (and given time, decloaking) hidden networks, and inferring the presence of
     nonbeaconing networks via data traffic.
     kismet supports logging to the wtapfile packet format (readable by tcpdump and ethereal) and saves detected network information as plaintext, CSV, and XML.  kismet is capable of using
     any GPS supported by gpsd and logs and plots network data.

     kismet is divided into three basic programs, kismet_server kismet_client and gpsmap

USAGE
     kismet handles automatically starting kismet_server and kismet_client.
     kismet is installed as suid-root by default. It will drop privs to the user specified in kismet.conf immediately after binding and configuring the capture source.

KISMET_SERVER
     kismet_server captures, dissects, and logs packets and GPS data.  It is capable of running in `headless' mode with no display.  Multiple clients (on multiple computers) can be connected
     to a single server.

     -I    Set the initial channel for a channel source (source:channel)

     -x    Forcibly enable the channel hopper

     -X    Forcibly disable the channel hopper

     -t    Set the title used for the %t field of the logfile template (Default: Kismet)

     -n    Disable all logging

     -f    Use an alternate config file

     -c    Override capture source lines (type,interface,name).  Refer to kismet.conf(5) for more information. Multiple capture source options can be specified for multiple sources.  All
           sources provided here are automatically enabled unless an enable list is also supplied.

     -C    Comma-separated list to override what capture sources are enabled.

     -l    Override logging types, comma separated (dump, cisco, weak, csv, xml, gps)

     -m    Override maximum packets logged per file

     -q    Override sound option and run in quiet mode

     -g    Override GPS host:port

     -p    Override port to listen on for clients

     -a    Override list of client IPs or network/mask blocks (comma separated) allowed to connect

     -s    Run in silent mode (no console status information)

     -N    Override server name for this instance of Kismet

     -v    Print version

     -h    Help

KISMET_CLIENT
     kismet_client is a ncurses and panels interface which connects to the server and displays detected networks, statistics, network details, etc.

     -f    Use an alternate config file

     -u    Use an alternate UI config file

     -q    Override sound option and run in quiet mode

     -s    Override server host:port

     -r    Attempt to automatically reestablish the connection if the server terminates

     -g    Override UI type (curses, panel)

     -c    Override list of columns to display (comma separated)

     -v    Print version

     -h    Help

GPSMAP
     gpsmap reads GPS and Network XML datafiles and plots networks on downloaded maps or user-supplied images (such as satellite photos).

SEE ALSO
     kismet_drone(1), gpsmap(1), kismet.conf(5), kismet_ui.conf(5), kismet_drone.conf(5)

Kismet                                                                                   April 03, 2004                                                                                  Kismet
