tcpbridge(1)                                                                User Commands                                                               tcpbridge(1)

NAME
       tcpbridge - Bridge network traffic across two interfaces

SYNOPSIS
       tcpbridge [-flags] [-flag [value]] [--option-name[[=| ]value]]

       All arguments must be options.

       tcpbridge is a tool for selectively bridging network traffic across two interfaces and optionally modifying the packets in between

DESCRIPTION
       The basic operation of tcpbridge is to be a network bridge between two subnets.  All packets received on one interface are sent via the other.

       Optionally, packets can be edited in a variety of ways according to your needs.

       For more details, please see the Tcpreplay Manual at: http://tcpreplay.appneta.com

OPTIONS

       -r string, --portmap=string
              Rewrite TCP/UDP ports.  This option may appear up to 9999 times.

              Specify  a list of comma delimited port mappings consisting of colon delimited port number pairs.  Each colon delimited port pair consists of the port
              to match followed by the port number to rewrite.

              Examples:
                  --portmap=80:8000 --portmap=8080:80    # 80->8000 and 8080->80
                  --portmap=8000,8080,88888:80           # 3 different ports become 80
                  --portmap=8000-8999:80                 # ports 8000 to 8999 become 80

       -s number, --seed=number
              Randomize src/dst IPv4/v6 addresses w/ given seed.  This option may appear up to 1 times.  This option must not appear in combination with any of  the
              following options: fuzz-seed.  This option takes an integer number as its argument.

              Causes  the  source and destination IPv4/v6 addresses to be pseudo randomized but still maintain client/server relationships.  Since the randomization
              is deterministic based on the seed, you can reuse the same seed value to recreate the traffic.

       -N string, --pnat=string
              Rewrite IPv4/v6 addresses using pseudo-NAT.  This option may appear up to 2 times.  This option must not appear in combination with any of the follow‐
              ing options: srcipmap.

              Takes  a comma delimited series of colon delimited CIDR netblock pairs.  Each netblock pair is evaluated in order against the IP addresses.  If the IP
              address in the packet matches the first netblock, it is rewritten using the second netblock as a mask against the high order bits.

              IPv4 Example:
                  --pnat=192.168.0.0/16:10.77.0.0/16,172.16.0.0/12:10.1.0.0/24
              IPv6 Example:
                  --pnat=[2001:db8::/32]:[dead::/16],[2001:db8::/32]:[::ffff:0:0/96]

       -S string, --srcipmap=string
              Rewrite source IPv4/v6 addresses using pseudo-NAT.  This option may appear up to 1 times.  This option must not appear in combination with any of  the
              following options: pnat.

              Works just like the --pnat option, but only affects the source IP addresses in the IPv4/v6 header.

       -D string, --dstipmap=string
              Rewrite destination IPv4/v6 addresses using pseudo-NAT.  This option may appear up to 1 times.  This option must not appear in combination with any of
              the following options: pnat.

              Works just like the --pnat option, but only affects the destination IP addresses in the IPv4/v6 header.

       -e string, --endpoints=string
              Rewrite IP addresses to be between two endpoints.  This option may appear up to 1 times.  This option must appear in combination  with  the  following
              options: cachefile.

              Takes a pair of colon delimited IPv4/v6 addresses which will be used to rewrite all traffic to appear to be between the two IP addresses.

              IPv4 Example:
                  --endpoints=172.16.0.1:172.16.0.2
              IPv6 Example:
                  --endpoints=[2001:db8::dead:beef]:[::ffff:0:0:ac:f:0:2]

       --tcp-sequence=number
              Change  TCP Sequence (and ACK) numbers /w given seed.  This option takes an integer number as its argument.  The value of number is constrained to be‐
              ing:
                  greater than or equal to 1
              The default number for this option is:
                   0

              Change all TCP sequence numbers, and related sequence-acknowledgement numbers.  They will be shifted by a random amount based on the provided seed.

       -b, --skipbroadcast
              Skip rewriting broadcast/multicast IPv4/v6 addresses.

              By default --seed, --pnat and --endpoints will rewrite broadcast and multicast IPv4/v6 and MAC addresses.     Setting this flag will keep broad‐
              cast/multicast IPv4/v6 and MAC addresses from being rewritten.

       -C, --fixcsum
              Force recalculation of IPv4/TCP/UDP header checksums.

              Causes each IPv4/v6 packet to have their checksums recalculated and fixed.  Automatically enabled for packets modified with --seed, --pnat, --end‐
              points or --fixlen.

       -m number, --mtu=number
              Override default MTU length (1500 bytes).  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of
              number is constrained to being:
                  in the range  1 through MAX_SNAPLEN

              Override the default 1500 byte MTU size for determining the maximum padding length (--fixlen=pad) or when truncating (--mtu-trunc).

       --mtu-trunc
              Truncate packets larger then specified MTU.  This option may appear up to 1 times.

              Similar to --fixlen, this option will truncate data in packets from Layer 3 and above to be no larger then the MTU.

       -E, --efcs
              Remove Ethernet checksums (FCS) from end of frames.

              Note, this option is pretty dangerous!  We do not actually check to see if a FCS actually exists in the frame, we just blindly delete the last 4
              bytes.  Hence, you should only use this if you know know that your OS provides the FCS when reading raw packets.

       --ttl=string
              Modify the IPv4/v6 TTL/Hop Limit.

              Allows you to modify the TTL/Hop Limit of all the IPv4/v6 packets.  Specify a number to hard-code the value or +/-value to increase or decrease by the
              value provided (limited to 1-255).

              Examples:
                  --ttl=10
                  --ttl=+7
                  --ttl=-64

       --tos=number
              Set the IPv4 TOS/DiffServ/ECN byte.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of number
              is constrained to being:
                  in the range  0 through 255

              Allows you to override the TOS (also known as DiffServ/ECN) value in IPv4.

       --tclass=number
              Set the IPv6 Traffic Class byte.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of number is
              constrained to being:
                  in the range  0 through 255

              Allows you to override the IPv6 Traffic Class field.

       --flowlabel=number
              Set the IPv6 Flow Label.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of number is con‐
              strained to being:
                  in the range  0 through 1048575

              Allows you to override the 20bit IPv6 Flow Label field.  Has no effect on IPv4 packets.

       -F string, --fixlen=string
              Pad or truncate packet data to match header length.  This option may appear up to 1 times.

              Packets may be truncated during capture if the snaplen is smaller then the packet.  This option allows you to modify the packet to pad the packet back
              out to the size stored in the IPv4/v6 header or rewrite the IP header total length to reflect the stored packet length.

              pad Truncated packets will be padded out so that the packet length matches the IPv4 total length

              trunc Truncated packets will have their IPv4 total length field rewritten to match the actual packet length

              del Delete the packet

       --fuzz-seed=number
              Fuzz 1 in X packets. Edit bytes, length, or emulate packet drop.  This option takes an integer number as its argument.  The value of number is con‐
              strained to being:
                  greater than or equal to 0
              The default number for this option is:
                   0

              This fuzzing was designed as to test layer 7 protocols such as voip protocols.  It modifies randomly 1 out of X packets (where X = --fuzz-factor) in
              order for stateful protocols to cover more of their code.  The random fuzzing actions focus on data start and end because it often is the part of the
              data application protocols base their decisions on.

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
              Set the Fuzz 1 in X packet ratio (default 1 in 8 packets).  This option must appear in combination with the following options: fuzz-seed.  This option
              takes an integer number as its argument.  The value of number is constrained to being:
                  greater than or equal to 1
              The default number for this option is:
                   8

              Sets the ratio of for --fuzz-seed option. By default this value is 8, which means 1 in 8 packets are modified by fuzzing. Note that this ratio is
              based on the random number generated by the supplied fuzz seed. Therefore by default you cannot expect that exactly every eighth packet will be modi‐
              fied.

       --skipl2broadcast
              Skip rewriting broadcast/multicast Layer 2 addresses.

              By default, editing Layer 2 addresses will rewrite broadcast and multicast MAC addresses.  Setting this flag will keep broadcast/multicast MAC ad‐
              dresses from being rewritten.

       --dlt=string
              Override output DLT encapsulation.  This option may appear up to 1 times.

              By default, no DLT (data link type) conversion will be made.  To change the DLT type of the output pcap, select one of the following values:

              enet Ethernet aka DLT_EN10MB

              hdlc Cisco HDLC aka DLT_C_HDLC

              jnpr_ether Juniper Ethernet DLT_C_JNPR_ETHER

              pppserial PPP Serial aka DLT_PPP_SERIAL

              user User specified Layer 2 header and DLT type

       --enet-dmac=string
              Override destination ethernet MAC addresses.  This option may appear up to 1 times.

              Takes a pair of comma deliminated ethernet MAC addresses which will replace the destination MAC address of outbound packets.  The first MAC address
              will be used for the server to client traffic and the optional second MAC address will be used for the client to server traffic.

              Example:
                  --enet-dmac=00:12:13:14:15:16,00:22:33:44:55:66

       --enet-smac=string
              Override source ethernet MAC addresses.  This option may appear up to 1 times.

              Takes a pair of comma deliminated ethernet MAC addresses which will replace the source MAC address of outbound packets.  The first MAC address will be
              used for the server to client traffic and the optional second MAC address will be used for the client to server traffic.

              Example:
                  --enet-smac=00:12:13:14:15:16,00:22:33:44:55:66

       --enet-subsmac=string
              Substitute MAC addresses.  This option may appear up to 9999 times.

              Allows you to rewrite ethernet MAC addresses of packets. It takes comma delimited pair or MACs address and rewrites all occurrences of the first MAC
              with the value of the second MAC.  Example:
                  --enet-subsmac=00:12:13:14:15:16,00:22:33:44:55:66

       --enet-mac-seed=number
              Randomize MAC addresses.  This option may appear up to 1 times.  This option must not appear in combination with any of the following options: enet-
              smac, enet-dmac, enet-subsmac.  This option takes an integer number as its argument.

              Allows you to randomize ethernet MAC addresses of packets, mostly like what --seed option does for IPv4/IPv6 addresses.

       --enet-mac-seed-keep-bytes=number
              Randomize MAC addresses.  This option may appear up to 1 times.  This option must appear in combination with the following options: enet-mac-seed.
              This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  1 through 6

              Keep some bytes untouched when usinging --enet-mac-seed option.

       --enet-vlan=string
              Specify ethernet 802.1q VLAN tag mode.  This option may appear up to 1 times.

              Allows you to rewrite ethernet frames to add a 802.1q header to standard 802.3 ethernet headers or remove the 802.1q VLAN tag information.

              add Rewrites the existing 802.3 ethernet header as an 802.1q VLAN header

              del Rewrites the existing 802.1q VLAN header as an 802.3 ethernet header

       --enet-vlan-tag=number
              Specify the new ethernet 802.1q VLAN tag value.  This option may appear up to 1 times.  This option must appear in combination with the following op‐
              tions: enet-vlan.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 4095

       --enet-vlan-cfi=number
              Specify the ethernet 802.1q VLAN CFI value.  This option may appear up to 1 times.  This option must appear in combination with the following options:
              enet-vlan.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 1

       --enet-vlan-pri=number
              Specify the ethernet 802.1q VLAN priority.  This option may appear up to 1 times.  This option must appear in combination with the following options:
              enet-vlan.  This option takes an integer number as its argument.  The value of number is constrained to being:
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

              Provide a series of comma deliminated hex values which will be used to rewrite or create the Layer 2 header of the packets.  The first instance of
              this argument will rewrite both server and client traffic, but if this argument is specified a second time, it will be used for the client traffic.

              Example:
                  --user-dlink=01,02,03,04,05,06,00,1A,2B,3C,4D,5E,6F,08,00

       -d number, --dbug=number
              Enable debugging output.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of number is con‐
              strained to being:
                  in the range  0 through 5
              The default number for this option is:
                   0

              If configured with --enable-debug, then you can specify a verbosity level for debugging output.  Higher numbers increase verbosity.

       -i string, --intf1=string
              Primary interface (listen in uni-directional mode).  This option may appear up to 1 times.

       -I string, --intf2=string
              Secondary interface (send in uni-directional mode).  This option may appear up to 1 times.

       -u, --unidir
              Send and receive in only one direction.  This option may appear up to 1 times.

              Normally, tcpbridge will send and receive traffic in both directions (bi-directionally).  However, if you choose this option, traffic will be sent
              uni-directionally.

       --listnics
              List available network interfaces and exit.

       -L number, --limit=number
              Limit the number of packets to send.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of number
              is constrained to being:
                  greater than or equal to 1
              The default number for this option is:
                   -1

              By default, tcpbridge will send packets forever or until Ctrl-C.  Alternatively, you can specify a maximum number of packets to send.

       -M string, --mac=string
              MAC addresses of local NIC's.  This option may appear up to 2 times.

              tcpbridge does not support detecting the MAC addresses of the local network interfaces under Windows.  Please specify both MAC addresses of the inter‐
              faces used in the bridge: -M <intf1 mac> -M <intf2 mac>

       -x string, --include=string
              Include only packets matching rule.  This option may appear up to 1 times.  This option must not appear in combination with any of the following op‐
              tions: exclude.

              Override default of sending all packets stored in the capture file and only send packets which match the provided rule.  Rules can be one of:

              S:<CIDR1>,...  - Source IP must match specified CIDR(s)

              D:<CIDR1>,...  - Destination IP must match specified CIDR(s)

              B:<CIDR1>,...  - Both source and destination IP must match specified CIDR(s)

              E:<CIDR1>,...  - Either IP must match specified CIDR(s)

              P:<LIST> - Must be one of the listed packets where the list corresponds to the packet number in the capture file.
                  --include=P:1-5,9,15,72-
              would send packets 1 through 5, the 9th and 15th packet, and packets 72 until the end of the file

              F:'<bpf>' - BPF filter.  See the tcpdump(8) man page for syntax.

       -X string, --exclude=string
              Exclude any packet matching this rule.  This option may appear up to 1 times.  This option must not appear in combination with any of the following
              options: include.

              Override default of sending all packets stored in the capture file and only send packets which do not match the provided rule.  Rules can be one of:

              S:<CIDR1>,...  - Source IP must not match specified CIDR(s)

              D:<CIDR1>,...  - Destination IP must not match specified CIDR(s)

              B:<CIDR1>,...  - Both source and destination IP must not match specified CIDR(s)

              E:<CIDR1>,...  - Either IP must not match specified CIDR(s)

              P:<LIST> - Must not be one of the listed packets where the list corresponds to the packet number in the capture file.
                  --exclude=P:1-5,9,15,72-
              would drop packets 1 through 5, the 9th and 15th packet, and packets 72 until the end of the file

       -P, --pid
              Print the PID of tcpbridge at startup.

       -v, --verbose
              Print decoded packets via tcpdump to STDOUT.  This option may appear up to 1 times.

       -A string, --decode=string
              Arguments passed to tcpdump decoder.  This option may appear up to 1 times.  This option must appear in combination with the following options: ver‐
              bose.

              When enabling verbose mode (-v) you may also specify one or more additional  arguments to pass to tcpdump to modify the way packets are decoded.  By
              default, -n and -l are used.   Be  sure  to quote the arguments like: --verbose="-axxx" so that they are not interpreted by tcpbridge.  The following
              arguments are valid:
                  [ -aAeNqRStuvxX ]
                  [ -E spi@ipaddr algo:secret,... ]
                  [ -s snaplen ]

       -V, --version
              Print version information.

       -h, --less-help
              Display less usage information and exit.

       -H, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       --save-opts [=cfgfile]
              Save the option state to cfgfile.  The default is the last configuration file listed in the OPTION PRESETS section, below.  The command will exit af‐
              ter updating the config file.

       --load-opts=cfgfile, --no-load-opts
              Load options from cfgfile.  The no-load-opts form will disable the loading of earlier config/rc/ini files.  --no-load-opts is handled early, out of
              order.

OPTION PRESETS
       Any option that is not marked as not presettable may be preset by loading values from configuration ("RC" or ".INI") file(s).  The homerc file is "$$/", un‐
       less that is a directory.  In that case, the file ".tcpbridgerc" is searched for within that directory.

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
       Copyright 2013-2018 Fred Klassen - AppNeta Copyright 2000-2012 Aaron Turner For support please use the tcpreplay-users@lists.sourceforge.net mailing list.
       The latest version of this software is always available from: http://tcpreplay.appneta.com/

COPYRIGHT
       Copyright (C) 2000-2018 Aaron Turner and Fred Klassen all rights reserved.  This program is released under the terms of the GNU General Public License, ver‐
       sion 3 or later.

BUGS
       Please send bug reports to: tcpreplay-users@lists.sourceforge.net

NOTES
       This manual page was AutoGen-erated from the tcpbridge option definitions.

tcpbridge                                                                    14 Jun 2020                                                                tcpbridge(1)
