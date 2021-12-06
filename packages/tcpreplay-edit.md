tcpreplay-edit(1)                                                                      User Commands                                                                     tcpreplay-edit(1)

NAME
       tcpreplay-edit - Replay network traffic stored in pcap files

SYNOPSIS
       tcpreplay-edit [-flags] [-flag [value]] [--option-name[[=| ]value]] <pcap_file(s)>

       tcpreplay is a tool for replaying network traffic from files saved with tcpdump or other tools which write pcap(3) files.

DESCRIPTION
       The basic operation of tcpreplay is to resend  all  packets  from  the input file(s) at the speed at which they were recorded, or a specified data rate, up to as fast as the hard‐
       ware is capable.

       Optionally, the traffic can be split between two interfaces, written to files, filtered and edited in various ways, providing the means to test firewalls, NIDS and  other  network
       devices.

       For more details, please see the Tcpreplay Manual at: http://tcpreplay.appneta.com

OPTIONS

       -r string, --portmap=string
              Rewrite TCP/UDP ports.  This option may appear up to 9999 times.

              Specify  a  list of comma delimited port mappings consisting of colon delimited port number pairs.  Each colon delimited port pair consists of the port to match followed by
              the port number to rewrite.

              Examples:
                  --portmap=80:8000 --portmap=8080:80    # 80->8000 and 8080->80
                  --portmap=8000,8080,88888:80           # 3 different ports become 80
                  --portmap=8000-8999:80                 # ports 8000 to 8999 become 80

       -s number, --seed=number
              Randomize src/dst IPv4/v6 addresses w/ given seed.  This option may appear up to 1 times.  This option must not appear in combination with any  of  the  following  options:
              fuzz-seed.  This option takes an integer number as its argument.

              Causes  the source and destination IPv4/v6 addresses to be pseudo randomized but still maintain client/server relationships.  Since the randomization is deterministic based
              on the seed, you can reuse the same seed value to recreate the traffic.

       -N string, --pnat=string
              Rewrite IPv4/v6 addresses using pseudo-NAT.  This option may appear up to 2 times.  This option must not appear in combination with any of the following options: srcipmap.

              Takes a comma delimited series of colon delimited CIDR netblock pairs.  Each netblock pair is evaluated in order against the IP addresses.  If the IP address in the  packet
              matches the first netblock, it is rewritten using the second netblock as a mask against the high order bits.

              IPv4 Example:
                  --pnat=192.168.0.0/16:10.77.0.0/16,172.16.0.0/12:10.1.0.0/24
              IPv6 Example:
                  --pnat=[2001:db8::/32]:[dead::/16],[2001:db8::/32]:[::ffff:0:0/96]

       -S string, --srcipmap=string
              Rewrite  source  IPv4/v6  addresses  using pseudo-NAT.  This option may appear up to 1 times.  This option must not appear in combination with any of the following options:
              pnat.

              Works just like the --pnat option, but only affects the source IP addresses in the IPv4/v6 header.

       -D string, --dstipmap=string
              Rewrite destination IPv4/v6 addresses using pseudo-NAT.  This option may appear up to 1 times.  This option must not appear in combination with any  of  the  following  op‐
              tions: pnat.

              Works just like the --pnat option, but only affects the destination IP addresses in the IPv4/v6 header.

       -e string, --endpoints=string
              Rewrite IP addresses to be between two endpoints.  This option may appear up to 1 times.  This option must appear in combination with the following options: cachefile.

              Takes a pair of colon delimited IPv4/v6 addresses which will be used to rewrite all traffic to appear to be between the two IP addresses.

              IPv4 Example:
                  --endpoints=172.16.0.1:172.16.0.2
              IPv6 Example:
                  --endpoints=[2001:db8::dead:beef]:[::ffff:0:0:ac:f:0:2]

       --tcp-sequence=number
              Change TCP Sequence (and ACK) numbers /w given seed.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  greater than or equal to 1
              The default number for this option is:
                   0

              Change all TCP sequence numbers, and related sequence-acknowledgement numbers.  They will be shifted by a random amount based on the provided seed.

       -b, --skipbroadcast
              Skip rewriting broadcast/multicast IPv4/v6 addresses.

              By default --seed, --pnat and --endpoints will rewrite broadcast and multicast IPv4/v6 and MAC addresses.     Setting this flag will keep broadcast/multicast IPv4/v6 and
              MAC addresses from being rewritten.

       -C, --fixcsum
              Force recalculation of IPv4/TCP/UDP header checksums.

              Causes each IPv4/v6 packet to have their checksums recalculated and fixed.  Automatically enabled for packets modified with --seed, --pnat, --endpoints or --fixlen.

       -m number, --mtu=number
              Override default MTU length (1500 bytes).  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of number is constrained
              to being:
                  in the range  1 through MAX_SNAPLEN

              Override the default 1500 byte MTU size for determining the maximum padding length (--fixlen=pad) or when truncating (--mtu-trunc).

       --mtu-trunc
              Truncate packets larger then specified MTU.  This option may appear up to 1 times.

              Similar to --fixlen, this option will truncate data in packets from Layer 3 and above to be no larger then the MTU.

       -E, --efcs
              Remove Ethernet checksums (FCS) from end of frames.

              Note, this option is pretty dangerous!  We do not actually check to see if a FCS actually exists in the frame, we just blindly delete the last 4 bytes.  Hence, you should
              only use this if you know know that your OS provides the FCS when reading raw packets.

       --ttl=string
              Modify the IPv4/v6 TTL/Hop Limit.

              Allows you to modify the TTL/Hop Limit of all the IPv4/v6 packets.  Specify a number to hard-code the value or +/-value to increase or decrease by the value provided (lim‐
              ited to 1-255).

              Examples:
                  --ttl=10
                  --ttl=+7
                  --ttl=-64

       --tos=number
              Set the IPv4 TOS/DiffServ/ECN byte.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of number is constrained to be‐
              ing:
                  in the range  0 through 255

              Allows you to override the TOS (also known as DiffServ/ECN) value in IPv4.

       --tclass=number
              Set the IPv6 Traffic Class byte.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 255

              Allows you to override the IPv6 Traffic Class field.

       --flowlabel=number
              Set the IPv6 Flow Label.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 1048575

              Allows you to override the 20bit IPv6 Flow Label field.  Has no effect on IPv4 packets.

       -F string, --fixlen=string
              Pad or truncate packet data to match header length.  This option may appear up to 1 times.

              Packets may be truncated during capture if the snaplen is smaller then the packet.  This option allows you to modify the packet to pad the packet back out to the size
              stored in the IPv4/v6 header or rewrite the IP header total length to reflect the stored packet length.

              pad Truncated packets will be padded out so that the packet length matches the IPv4 total length

              trunc Truncated packets will have their IPv4 total length field rewritten to match the actual packet length

              del Delete the packet

       --fuzz-seed=number
              Fuzz 1 in X packets. Edit bytes, length, or emulate packet drop.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  greater than or equal to 0
              The default number for this option is:
                   0

              This fuzzing was designed as to test layer 7 protocols such as voip protocols.  It modifies randomly 1 out of X packets (where X = --fuzz-factor) in order for stateful pro‐
              tocols to cover more of their code.  The random fuzzing actions focus on data start and end because it often is the part of the data application protocols base their deci‐
              sions on.

              Possible fuzzing actions list:
               * drop packet
               * reduce packet size
               * edit packet Bytes:
                 * Not all Bytes have the same probability of appearance in real life.
                   Replace with 0x00, 0xFF, or a random byte with equal likelihood.
                 * Not all Bytes have the same significance in a packet.
                   Replace the start, the end, or the middle of the packet with equal likelihood.
               * do nothing (7 out of 8 packets)

       --fuzz-factor=number
              Set the Fuzz 1 in X packet ratio (default 1 in 8 packets).  This option must appear in combination with the following options: fuzz-seed.  This option takes an integer num‐
              ber as its argument.  The value of number is constrained to being:
                  greater than or equal to 1
              The default number for this option is:
                   8

              Sets the ratio of for --fuzz-seed option. By default this value is 8, which means 1 in 8 packets are modified by fuzzing. Note that this ratio is based on the random number
              generated by the supplied fuzz seed. Therefore by default you cannot expect that exactly every eighth packet will be modified.

       --skipl2broadcast
              Skip rewriting broadcast/multicast Layer 2 addresses.

              By default, editing Layer 2 addresses will rewrite broadcast and multicast MAC addresses.  Setting this flag will keep broadcast/multicast MAC addresses from being rewrit‐
              ten.

       --dlt=string
              Override output DLT encapsulation.  This option may appear up to 1 times.

              By default, no DLT (data link type) conversion will be made.  To change the DLT type of the output pcap, select one of the following values:

              enet Ethernet aka DLT_EN10MB

              hdlc Cisco HDLC aka DLT_C_HDLC

              jnpr_eth Juniper Ethernet DLT_C_JNPR_ETHER

              pppserial PPP Serial aka DLT_PPP_SERIAL

              user User specified Layer 2 header and DLT type

       --enet-dmac=string
              Override destination ethernet MAC addresses.  This option may appear up to 1 times.

              Takes a pair of comma deliminated ethernet MAC addresses which will replace the destination MAC address of outbound packets.  The first MAC address will be used for the
              server to client traffic and the optional second MAC address will be used for the client to server traffic.

              Example:
                  --enet-dmac=00:12:13:14:15:16,00:22:33:44:55:66

       --enet-smac=string
              Override source ethernet MAC addresses.  This option may appear up to 1 times.

              Takes a pair of comma deliminated ethernet MAC addresses which will replace the source MAC address of outbound packets.  The first MAC address will be used for the server
              to client traffic and the optional second MAC address will be used for the client to server traffic.

              Example:
                  --enet-smac=00:12:13:14:15:16,00:22:33:44:55:66

       --enet-subsmac=string
              Substitute MAC addresses.  This option may appear up to 9999 times.

              Allows you to rewrite ethernet MAC addresses of packets. It takes comma delimited pair or MACs address and rewrites all occurrences of the first MAC with the value of the
              second MAC.  Example:
                  --enet-subsmac=00:12:13:14:15:16,00:22:33:44:55:66

       --enet-mac-seed=number
              Randomize MAC addresses.  This option may appear up to 1 times.  This option must not appear in combination with any of the following options: enet-smac, enet-dmac, enet-
              subsmac.  This option takes an integer number as its argument.

              Allows you to randomize ethernet MAC addresses of packets, mostly like what --seed option does for IPv4/IPv6 addresses.

       --enet-mac-seed-keep-bytes=number
              Randomize MAC addresses.  This option may appear up to 1 times.  This option must appear in combination with the following options: enet-mac-seed.  This option takes an in‐
              teger number as its argument.  The value of number is constrained to being:
                  in the range  1 through 6

              Keep some bytes untouched when usinging --enet-mac-seed option.

       --enet-vlan=string
              Specify ethernet 802.1q VLAN tag mode.  This option may appear up to 1 times.

              Allows you to rewrite ethernet frames to add a 802.1q header to standard 802.3 ethernet headers or remove the 802.1q VLAN tag information.

              add Rewrites the existing 802.3 ethernet header as an 802.1q VLAN header

              del Rewrites the existing 802.1q VLAN header as an 802.3 ethernet header

       --enet-vlan-tag=number
              Specify the new ethernet 802.1q VLAN tag value.  This option may appear up to 1 times.  This option must appear in combination with the following options: enet-vlan.  This
              option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 4095

       --enet-vlan-cfi=number
              Specify the ethernet 802.1q VLAN CFI value.  This option may appear up to 1 times.  This option must appear in combination with the following options: enet-vlan.  This op‐
              tion takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 1

       --enet-vlan-pri=number
              Specify the ethernet 802.1q VLAN priority.  This option may appear up to 1 times.  This option must appear in combination with the following options: enet-vlan.  This op‐
              tion takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 7

       --hdlc-control=number
              Specify HDLC control value.  This option may appear up to 1 times.  This option takes an integer number as its argument.

              The Cisco HDLC header has a 1 byte "control" field.  Apparently this should always be 0, but if you can use any 1 byte value.

       --hdlc-address=number
              Specify HDLC address.  This option may appear up to 1 times.  This option takes an integer number as its argument.

              The Cisco HDLC header has a 1 byte "address" field which has two valid values:

              0x0F Unicast

              0xBF Broadcast
              You can however specify any single byte value.

       --user-dlt=number
              Set output file DLT type.  This option may appear up to 1 times.  This option takes an integer number as its argument.

              Set the DLT value of the output pcap file.

       --user-dlink=string
              Rewrite Data-Link layer with user specified data.  This option may appear up to 2 times.

              Provide a series of comma deliminated hex values which will be used to rewrite or create the Layer 2 header of the packets.  The first instance of this argument will re‐
              write both server and client traffic, but if this argument is specified a second time, it will be used for the client traffic.

              Example:
                  --user-dlink=01,02,03,04,05,06,00,1A,2B,3C,4D,5E,6F,08,00

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
              Modify IP addresses each loop iteration to generate unique flows.  This option must appear in combination with the following options: loop.  This option must not appear in
              combination with any of the following options: seed, fuzz-seed.

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
       tory.  In that case, the file ".tcpreplay-editrc" is searched for within that directory.

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
       This manual page was AutoGen-erated from the tcpreplay-edit option definitions.

tcpreplay                                                                               01 May 2021                                                                      tcpreplay-edit(1)
