tcpreplay(1)                                                                           User Commands                                                                          tcpreplay(1)

NAME
       tcpreplay - Replay network traffic stored in pcap files

SYNOPSIS
       tcpreplay [-flags] [-flag [value]] [--option-name[[=| ]value]] <pcap_file(s)>

       tcpreplay is a tool for replaying network traffic from files saved with tcpdump or other tools which write pcap(3) files.

DESCRIPTION
       The basic operation of tcpreplay is to resend  all  packets  from  the input file(s) at the speed at which they were recorded, or a specified data rate, up to as fast as the hard‐
       ware is capable.

       Optionally, the traffic can be split between two interfaces, written to files, filtered and edited in various ways, providing the means to test firewalls, NIDS and  other  network
       devices.

       For more details, please see the Tcpreplay Manual at: http://tcpreplay.appneta.com

OPTIONS
       -d number, --dbug=number
              Enable debugging output.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 5
              The default number for this option is:
                   0

              If configured with --enable-debug, then you can specify a verbosity level for debugging output.  Higher numbers increase verbosity.

       -q, --quiet
              Quiet mode.

              Print nothing except the statistics at the end of the run

       -T string, --timer=string
              Select packet timing mode: select, ioport, gtod, nano.  This option may appear up to 1 times.  The default string for this option is:
                   gtod

              Allows you to select the packet timing method to use:

              nano - Use nanosleep() API

              select - Use select() API

              ioport - Write to the i386 IO Port 0x80

              gtod [default] - Use a gettimeofday() loop

       --maxsleep=number
              Sleep for no more then X milliseconds between packets.  This option takes an integer number as its argument.  The default number for this option is:
                   0

              Set a limit for the maximum number of milliseconds that tcpreplay will sleep between packets.  Effectively prevents long delays between packets without effecting the major‐
              ity of packets.  Default is disabled.

       -v, --verbose
              Print decoded packets via tcpdump to STDOUT.  This option may appear up to 1 times.

       -A string, --decode=string
              Arguments passed to tcpdump decoder.  This option may appear up to 1 times.  This option must appear in combination with the following options: verbose.

              When enabling verbose mode (-v) you may also specify one or more additional  arguments to pass to tcpdump to modify the way packets are decoded.  By default, -n and -l are
              used.   Be  sure  to quote the arguments like: -A "-axxx" so that they are not interpreted by tcpreplay.   Please see the tcpdump(1) man page for a complete list of op‐
              tions.

       -K, --preload-pcap
              Preloads packets into RAM before sending.

              This option loads the specified pcap(s) into RAM before starting to send in order to improve replay performance while introducing a startup performance hit.  Preloading can
              be used with or without --loop. This option also suppresses flow statistics collection for every iteration, which can significantly reduce memory usage. Flow statistics are
              predicted based on options supplied and statistics collected from the first loop iteration.

       -c string, --cachefile=string
              Split traffic via a tcpprep cache file.  This option may appear up to 1 times.  This option must appear in combination with the following options: intf2.  This option must
              not appear in combination with any of the following options: dualfile.

              If you have a pcap file you would like to use to send bi-directional traffic through a device (firewall, router, IDS, etc) then using tcpprep you can create a cachefile
              which tcpreplay will use to split the traffic across two network interfaces.

       -2, --dualfile
              Replay two files at a time from a network tap.  This option may appear up to 1 times.  This option must appear in combination with the following options: intf2.  This op‐
              tion must not appear in combination with any of the following options: cachefile.

              If you captured network traffic using a network tap, then you can end up with two pcap files- one for each direction.  This option will replay these two files at the same
              time, one on each interface and inter-mix them using the timestamps in each.

       -i string, --intf1=string
              Client to server/RX/primary traffic output interface.  This option may appear up to 1 times.

              Required network interface used to send either all traffic or traffic which is marked as 'primary' via tcpprep.  Primary traffic is usually client-to-server or inbound (RX)
              on khial virtual interfaces.

       -I string, --intf2=string
              Server to client/TX/secondary traffic output interface.  This option may appear up to 1 times.

              Optional network interface used to send traffic which is marked as 'secondary' via tcpprep.  Secondary traffic is usually server-to-client or outbound (TX) on khial virtual
              interfaces.  Generally, it only makes sense to use this option with --cachefile.

       --listnics
              List available network interfaces and exit.

       -l number, --loop=number
              Loop through the capture file X times.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of number is constrained to
              being:
                  greater than or equal to 0
              The default number for this option is:
                   1

       --loopdelay-ms=number
              Delay between loops in milliseconds.  This option must appear in combination with the following options: loop.  This option takes an integer number as its argument.  The
              value of number is constrained to being:
                  greater than or equal to 0
              The default number for this option is:
                   0

       --pktlen
              Override the snaplen and use the actual packet len.  This option may appear up to 1 times.

              By default, tcpreplay will send packets based on the size of the "snaplen" stored in the pcap file which is usually the correct thing to do.  However, occasionally, tools
              will store more bytes then told to.  By specifying this option, tcpreplay will ignore the snaplen field and instead try to send packets based on the original packet length.
              Bad things may happen if you specify this option.

       -L number, --limit=number
              Limit the number of packets to send.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of number is constrained to be‐
              ing:
                  greater than or equal to 1
              The default number for this option is:
                   -1

              By default, tcpreplay will send all the packets.  Alternatively, you can specify a maximum number of packets to send.

       --duration=number
              Limit the number of seconds to send.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of number is constrained to be‐
              ing:
                  greater than or equal to 1
              The default number for this option is:
                   -1

              By default, tcpreplay will send all the packets.  Alternatively, you can specify a maximum number of seconds to transmit.

       -x string, --multiplier=string
              Modify replay speed to a given multiple.  This option may appear up to 1 times.  This option must not appear in combination with any of the following options: pps, mbps,
              oneatatime, topspeed.

              Specify a value to modify the packet replay speed.  Examples:
                      2.0 will replay traffic at twice the speed captured
                      0.7 will replay traffic at 70% the speed captured

       -p string, --pps=string
              Replay packets at a given packets/sec.  This option may appear up to 1 times.  This option must not appear in combination with any of the following options: multiplier,
              mbps, oneatatime, topspeed.

              Specify a value to regulate the packet replay to a specific packet-per-second rate.  Examples:
                      200 will replay traffic at 200 packets per second
                      0.25 will replay traffic at 15 packets per minute

       -M string, --mbps=string
              Replay packets at a given Mbps.  This option may appear up to 1 times.  This option must not appear in combination with any of the following options: multiplier, pps,
              oneatatime, topspeed.

              Specify a floating point value for the Mbps rate that tcpreplay should send packets at.

       -t, --topspeed
              Replay packets as fast as possible.  This option must not appear in combination with any of the following options: mbps, multiplier, pps, oneatatime.

       -o, --oneatatime
              Replay one packet at a time for each user input.  This option must not appear in combination with any of the following options: mbps, pps, multiplier, topspeed.

              Allows you to step through one or more packets at a time.

       --pps-multi=number
              Number of packets to send for each time interval.  This option must appear in combination with the following options: pps.  This option takes an integer number as its argu‐
              ment.  The value of number is constrained to being:
                  greater than or equal to 1
              The default number for this option is:
                   1

              When trying to send packets at very high rates, the time between each packet can be so short that it is impossible to accurately sleep for the required period of time.
              This option allows you to send multiple packets at a time, thus allowing for longer sleep times which can be more accurately implemented.

       --unique-ip
              Modify IP addresses each loop iteration to generate unique flows.  This option must appear in combination with the following options: loop.

              Ensure IPv4 and IPv6 packets will be unique for each --loop iteration.  This is done in a way that will not alter packet CRC, and therefore will genrally not affect perfor‐
              mance. This option will significantly increase the flows/sec over generated over multiple loop iterations.

       --unique-ip-loops=string
              Number of times to loop before assigning new unique ip.  This option may appear up to 1 times.  This option must appear in combination with the following options: unique-
              ip.

              Number of --loop iterations before a new unique IP is assigned. Default is 1. Assumes both --loop and --unique-ip.

       --netmap
              Write packets directly to netmap enabled network adapter.

              This feature will detect netmap capable network drivers on Linux and BSD systems. If detected, the network driver is bypassed for the execution duration, and network buf‐
              fers will be written to directly. This will allow you to achieve full line rates on commodity network adapters, similar to rates achieved by commercial network traffic gen‐
              erators. Note that bypassing the network driver will disrupt other applications connected through the test interface. See INSTALL for more information.

              This feature can also be enabled by specifying an interface as 'netmap:<intf>' or 'vale:<intf>. For example 'netmap:eth0' specifies netmap over interface eth0.

       --nm-delay=number
              Netmap startup delay.  This option takes an integer number as its argument.  The default number for this option is:
                   10

              Number of seconds to delay after netmap is loaded. Required to ensure interfaces are fully up before netmap transmit. Requires netmap option. Default is 10 seconds.

       --no-flow-stats
              Suppress printing and tracking flow count, rates and expirations.

              Suppress the collection and printing of flow statistics. This option may improve performance when not using --preload-pcap option, otherwise its only function is to sup‐
              press printing.

              The flow feature will track and print statistics of the flows being sent.  A flow is loosely defined as a unique combination of a 5-tuple, i.e.  source IP, destination IP,
              source port, destination port and protocol.

              If --loop is specified, the flows from one iteration to the next will not be unique, unless the packets are altered. Use --unique-ip or tcpreplay-edit to alter packets be‐
              tween iterations.

       --flow-expiry=number
              Number of inactive seconds before a flow is considered expired.  This option must not appear in combination with any of the following options: no-flow-stats.  This option
              takes an integer number as its argument.  The value of number is constrained to being:
                  greater than or equal to 0
              The default number for this option is:
                   0

              This option will track and report flow expirations based on the flow idle times. The timestamps within the pcap file are used to determine the expiry, not the actual time‐
              stamp of the packets are replayed. For example, a value of 30 suggests that if no traffic is seen on a flow for 30 seconds, any subsequent traffic would be considered a new
              flow, and thereby will increment the flows and flows per second (fps) statistics.

              This option can be used to optimize flow timeout settings for flow products.  Setting the timeout low may lead to flows being dropped when in fact the flow is simply slow
              to respond. Configuring your flow timeouts too high may increase resources required by your flow product.

              Note that using this option while replaying at higher than original speeds can lead to inflated flows and fps counts.

              Default is 0 (no expiry) and a typical value is 30-120 seconds.

       -P, --pid
              Print the PID of tcpreplay at startup.

       --stats=number
              Print statistics every X seconds, or every loop if '0'.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  greater than or equal to 0

              Note that timed delays are a "best effort" and long delays between sending packets may cause equally long delays between printing statistics.

       -V, --version
              Print version information.

       -h, --less-help
              Display less usage information and exit.

       -H, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       --save-opts [=cfgfile]
              Save the option state to cfgfile.  The default is the last configuration file listed in the OPTION PRESETS section, below.  The command will exit after updating the config
              file.

       --load-opts=cfgfile, --no-load-opts
              Load options from cfgfile.  The no-load-opts form will disable the loading of earlier config/rc/ini files.  --no-load-opts is handled early, out of order.

OPTION PRESETS
       Any option that is not marked as not presettable may be preset by loading values from configuration ("RC" or ".INI") file(s).  The homerc file is "$$/", unless that is a direc‐
       tory.  In that case, the file ".tcpreplayrc" is searched for within that directory.

FILES
       See OPTION PRESETS for configuration files.

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_FAILURE)
              The operation failed or the command syntax was not valid.

       66  (EX_NOINPUT)
              A specified configuration file could not be loaded.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

AUTHORS
       Copyright 2013-2018 Fred Klassen - AppNeta Copyright 2000-2012 Aaron Turner For support please use the tcpreplay-users@lists.sourceforge.net mailing list.  The latest version of
       this software is always available from: http://tcpreplay.appneta.com/

COPYRIGHT
       Copyright (C) 2000-2018 Aaron Turner and Fred Klassen all rights reserved.  This program is released under the terms of the GNU General Public License, version 3 or later.

BUGS
       Please send bug reports to: tcpreplay-users@lists.sourceforge.net

NOTES
       This manual page was AutoGen-erated from the tcpreplay option definitions.

tcpreplay                                                                               14 Jun 2020                                                                           tcpreplay(1)
