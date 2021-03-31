NETSNIFF-NG(8)                                                                        netsniff-ng toolkit                                                                        NETSNIFF-NG(8)

NAME
       netsniff-ng - the packet sniffing beast

SYNOPSIS
       netsniff-ng { [options] [filter-expression] }

DESCRIPTION
       netsniff-ng  is  a  fast,  minimal  tool to analyze network packets, capture pcap files, replay pcap files, and redirect traffic between interfaces with the help of zero-copy packet(7)
       sockets. netsniff-ng uses both Linux specific RX_RING and TX_RING interfaces to perform zero-copy. This is to avoid copy and system call overhead between kernel and user address space.
       When we started working on netsniff-ng, the pcap(3) library did not use this zero-copy facility.

       netsniff-ng is Linux specific, meaning there is no support for other operating systems. Therefore we can keep the code footprint quite minimal and to the point. Linux packet(7) sockets
       and its RX_RING and TX_RING interfaces bypass the normal packet processing path through the networking stack.  This is the fastest capturing or transmission  performance  one  can  get
       from user space out of the box, without having to load unsupported or non-mainline third-party kernel modules. We explicitly refuse to build netsniff-ng on top of ntop/PF_RING. Not be‐
       cause we do not like it (we do find it interesting), but because of the fact that it is not part of the mainline kernel. Therefore, the ntop project has to maintain  and  sync  out-of-
       tree drivers to adapt them to their DNA. Eventually, we went for untainted Linux kernel, since its code has a higher rate of review, maintenance, security and bug fixes.

       netsniff-ng also supports early packet filtering in the kernel. It has support for low-level and high-level packet filters that are translated into Berkeley Packet Filter instructions.

       netsniff-ng can capture pcap files in several different pcap formats that are interoperable with other tools. The following pcap I/O methods are supported for efficient to-disc captur‐
       ing: scatter-gather, mmap(2), read(2), and write(2).  netsniff-ng is also able to rotate pcap files based on data size or time intervals, thus, making it a useful backend tool for sub‐
       sequent traffic analysis.

       netsniff-ng  itself  also  supports  analysis,  replaying, and dumping of raw 802.11 frames. For online or offline analysis, netsniff-ng has a built-in packet dissector for the current
       802.3 (Ethernet), 802.11* (WLAN), ARP, MPLS, 802.1Q (VLAN), 802.1QinQ, LLDP, IPv4, IPv6, ICMPv4, ICMPv6, IGMP, TCP and UDP, including GeoIP location analysis.  Since  netsniff-ng  does
       not  establish  any state or perform reassembly during packet dissection, its memory footprint is quite low, thus, making netsniff-ng quite efficient for offline analysis of large pcap
       files as well.

       Note that netsniff-ng is currently not multithreaded. However, this does not prevent you from starting multiple netsniff-ng instances that are pinned to different, non-overlapping CPUs
       and  f.e.  have  different BPF filters attached.  Likely that at some point in time your harddisc might become a bottleneck assuming you do not rotate such pcaps in ram (and from there
       periodically scheduled move to slower medias). You can then use mergecap(1) to transform all pcap files into a single large pcap file. Thus, netsniff-ng then works multithreaded  even‐
       tually.

       netsniff-ng can also be used to debug netlink traffic.

OPTIONS
       -i <dev|pcap|->, -d <dev|pcap|->, --in <dev|pcap|->, --dev <dev|pcap|->
              Defines an input device. This can either be a networking device, a pcap file or stdin (“-”). In case of a pcap file, the pcap type (-D option) is determined automatically by the
              pcap file magic. In case of stdin, it is assumed that the input stream is a pcap file. If the pcap link type is Netlink and pcap type is default format (usec or nsec), then each
              packet will be wrapped with pcap cooked header [2].

       -o <dev|pcap|dir|cfg|->, --out <dev|pcap|dir|cfg|->
              Defines  the  output  device.  This  can either be a networking device, a pcap file, a folder, a trafgen(8) configuration file or stdout (“-”). If the output device is a pcap or
              trafgen(8) configuration file, it may include a time format as defined by strfime(3).  If used in conjunction with the -F option, each rotated  file  will  have  a  unique  time
              stamp. In the case of a pcap file that should not have the default pcap type (0xa1b2c3d4), the additional option -T must be provided. If a directory is given, then, instead of a
              single pcap file, multiple pcap files are generated with rotation based on maximum file size or a given interval (-F option). Optionally, sending the SIGHUP signal to  the  net‐
              sniff-ng process causes a premature rotation of the file. A trafgen configuration file can currently only be specified if the input device is a pcap file. To specify a pcap file
              as the output device, the file name must have “.pcap” as its extension. If stdout is given as a device, then a trafgen configuration will be written to stdout if the  input  de‐
              vice is a pcap file, or a pcap file if the input device is a networking device. If the input device is a Netlink monitor device and pcap type is default (usec or nsec) then each
              packet will be wrapped with pcap cooked header [2] to keep Netlink family number (Kuznetzov's and netsniff-ng pcap types already contain family number in protocol number field).

       -C <id>, --fanout-group <id>
              If multiple netsniff-ng instances are being started that all have the same packet fanout group id, then the ingress network traffic being captured is being distributed/load-bal‐
              anced  among these group participants. This gives a much better scaling than running multiple netsniff-ng processes without a fanout group parameter in parallel, but only with a
              BPF filter attached as a packet would otherwise need to be delivered to all such capturing processes, instead of only once to such a fanout member. Naturally, each fanout member
              can have its own BPF filters attached.

       -K <hash|lb|cpu|rnd|roll|qm>, --fanout-type <hash|lb|cpu|rnd|roll|qm>
              This  parameter specifies the fanout discipline, in other words, how the captured network traffic is dispatched to the fanout group members. Options are to distribute traffic by
              the packet hash (“hash”), in a round-robin manner (“lb”), by CPU the packet arrived on (“cpu”), by random (“rnd”), by rolling over sockets (“roll”) which means if  one  socket's
              queue is full, we move on to the next one, or by NIC hardware queue mapping (“qm”).

       -L <defrag|roll>, --fanout-opts <defrag|roll>
              Defines  some  auxiliary  fanout options to be used in addition to a given fanout type.  These options apply to any fanout type. In case of “defrag”, the kernel is being told to
              defragment packets before delivering to user space, and “roll” provides the same roll-over option as the “roll” fanout type, so that on any  different  fanout  type  being  used
              (e.g. “qm”) the socket may temporarily roll over to the next fanout group member in case the original one's queue is full.

       -f, --filter <bpf-file|-|expr>
              Specifies  to  not  dump  all  traffic,  but  to  filter  the  network packet haystack.  As a filter, either a bpfc(8) compiled file/stdin can be passed as a parameter or a tcp‐
              dump(1)-like filter expression in quotes. For details regarding the bpf-file have a look at bpfc(8), for details regarding a tcpdump(1)-like filter have a look at section  “fil‐
              ter  example”  or  at pcap-filter(7).  A filter expression may also be passed to netsniff-ng without option -f in case there is no subsequent option following after the command-
              line filter expression.

       -t, --type <type>
              This defines some sort of filtering mechanisms in terms of addressing. Possible values for type are “host” (to us), “broadcast” (to all), “multicast” (to group), “others”  (pro‐
              miscuous mode) or “outgoing” (from us).

       -F, --interval <size|time>
              If  the  output  device  is a folder, with “-F”, it is possible to define the pcap file rotation interval either in terms of size or time. Thus, when the interval limit has been
              reached, a new pcap file will be started. As size parameter, the following values are accepted “<num>KiB/MiB/GiB”; As time parameter, it can be “<num>s/sec/min/hrs”.

       -J, --jumbo-support
              By default, in pcap replay or redirect mode, netsniff-ng's ring buffer frames are a fixed size of 2048 bytes. This means that if you are expecting jumbo  frames  or  even  super
              jumbo  frames  to  pass  through your network, then you need to enable support for that by using this option. However, this has the disadvantage of performance degradation and a
              bigger memory footprint for the ring buffer. Note that this doesn't affect (pcap) capturing mode, since tpacket in version 3 is used!

       -R, --rfraw
              In case the input or output networking device is a wireless device, it is possible with netsniff-ng to turn this into monitor mode and create a mon<X>  device  that  netsniff-ng
              will be listening on instead of wlan<X>, for instance.  This enables netsniff-ng to analyze, dump, or even replay raw 802.11 frames.

       -n <0|uint>, --num <0|uint>
              Process  a  number  of packets and then exit. If the number of packets is 0, then this is equivalent to infinite packets resp. processing until interrupted.  Otherwise, a number
              given as an unsigned integer will limit processing.

       -O <N>, --overwrite <N>
              A number from 0 to N-1 will be used in the file name instead of a Unix timestamp. The previous file will be overwritten when number wraps around. The maximum value is 2^32 -  1.
              Intended for rotating capture files when used with options -F and -P.

       -P <name>, --prefix <name>
              When  dumping  pcap  files  into a folder, a file name prefix can be defined with this option. If not otherwise specified, the default prefix is “dump-” followed by a Unix time‐
              stamp. Use “--prefex ""” to set filename as seconds since the Unix Epoch e.g. 1369179203.pcap

       -T <pcap-magic>, --magic <pcap-magic>
              Specify a pcap type for storage. Different pcap types with their various meta data capabilities are shown with option -D. If not otherwise specified, the pcap-magic  0xa1b2c3d4,
              also known as a standard tcpdump-capable pcap format, is used. Pcap files with swapped endianness are also supported.

       -D, --dump-pcap-types
              Dump all available pcap types with their capabilities and magic numbers that can be used with option “-T” to stdout and exit.

       -B, --dump-bpf
              If  a  Berkeley  Packet Filter is given, for example via option “-f”, then dump the BPF disassembly to stdout during ring setup. This only serves for informative or verification
              purposes.

       -r, --rand
              If the input and output device are both networking devices, then this option will randomize packet order in the output ring buffer.

       -M, --no-promisc
              The networking interface will not be put into promiscuous mode. By default, promiscuous mode is turned on.

       -N, --no-hwtimestamp
              Disable taking hardware time stamps for RX packets. By default, if the network device supports hardware time stamping, the hardware time stamps will be used when writing packets
              to pcap files. This option disables this behavior and forces (kernel based) software time stamps to be used, even if hardware time stamps are available.

       -A, --no-sock-mem
              On startup and shutdown, netsniff-ng tries to increase socket read and write buffers if appropriate. This option will prevent netsniff-ng from doing so.

       -m, --mmap
              Use mmap(2) as pcap file I/O. This is the default when replaying pcap files.

       -G, --sg
              Use scatter-gather as pcap file I/O. This is the default when capturing pcap files.

       -c, --clrw
              Use slower read(2) and write(2) I/O. This is not the default case anywhere, but in some situations it could be preferred as it has a lower latency on write-back to disc.

       -S <size>, --ring-size <size>
              Manually define the RX_RING resp. TX_RING size in “<num>KiB/MiB/GiB”. By default, the size is determined based on the network connectivity rate.

       -k <uint>, --kernel-pull <uint>
              Manually  define the interval in micro-seconds where the kernel should be triggered to batch process the ring buffer frames. By default, it is every 10us, but it can manually be
              prolonged, for instance.

       -b <cpu>, --bind-cpu <cpu>
              Pin netsniff-ng to a specific CPU and also pin resp. migrate the NIC's IRQ CPU affinity to this CPU. This option should be preferred in combination with -s in case a  middle  to
              high packet rate is expected.

       -u <uid>, --user <uid> resp. -g <gid>, --group <gid>
              After ring setup drop privileges to a non-root user/group combination.

       -H, --prio-high
              Set  this process as a high priority process in order to achieve a higher scheduling rate resp. CPU time. This is however not the default setting, since it could lead to starva‐
              tion of other processes, for example low priority kernel threads.

       -Q, --notouch-irq
              Do not reassign the NIC's IRQ CPU affinity settings.

       -s, --silent
              Do not enter the packet dissector at all and do not print any packet information to the terminal. Just shut up and be silent. This option should be preferred in combination with
              pcap recording or replay, since it will not flood your terminal which causes a significant performance degradation.

       -q, --less
              Print a less verbose one-line information for each packet to the terminal.

       -X, --hex
              Only dump packets in hex format to the terminal.

       -l, --ascii
              Only display ASCII printable characters.

       -U, --update
              If  geographical  IP  location is used, the built-in database update mechanism will be invoked to get Maxmind's latest database. To configure search locations for databases, the
              file /etc/netsniff-ng/geoip.conf contains possible addresses. Thus, to save bandwidth or for mirroring of Maxmind's databases (to bypass their traffic limit  policy),  different
              hosts or IP addresses can be placed into geoip.conf, separated by a newline.

       -w, --cooked
              Replace  each  frame  link header with Linux "cooked" header [3] which keeps info about link type and protocol. It allows to dump and dissect frames captured from different link
              types when -i "any" was specified, for example.

       -V, --verbose
              Be more verbose during startup i.e. show detailed ring setup information.

       -v, --version
              Show version information and exit.

       -h, --help
              Show user help and exit.

USAGE EXAMPLE
       netsniff-ng
              The most simple command is to just run “netsniff-ng”. This will start listening on all available networking devices in promiscuous mode and dump the packet dissector  output  to
              the terminal. No files will be recorded.

       netsniff-ng --in eth0 --out dump.pcap -s -T 0xa1e2cb12 -b 0 tcp or udp
              Capture TCP or UDP traffic from the networking device eth0 into the pcap file named dump.pcap, which has netsniff-ng specific pcap extensions (see “netsniff-ng -D” for capabili‐
              ties). Also, do not print the content to the terminal and pin the process and NIC IRQ affinity to CPU 0. The pcap write method is scatter-gather I/O.

       netsniff-ng --in wlan0 --rfraw --out dump.pcap --silent --bind-cpu 0
              Put the wlan0 device into monitoring mode and capture all raw 802.11 frames into the file dump.pcap. Do not dissect and print the content to the terminal and pin the process and
              NIC IRQ affinity to CPU 0. The pcap write method is scatter-gather I/O.

       netsniff-ng --in dump.pcap --mmap --out eth0 -k1000 --silent --bind-cpu 0
              Replay  the  pcap  file dump.pcap which is read through mmap(2) I/O and send the packets out via the eth0 networking device. Do not dissect and print the content to the terminal
              and pin the process and NIC IRQ affinity to CPU 0.  Also, trigger the kernel every 1000us to traverse the TX_RING instead of every 10us. Note that the pcap  magic  type  is  de‐
              tected automatically from the pcap file header.

       netsniff-ng --in eth0 --out eth1 --silent --bind-cpu 0 --type host -r
              Redirect  network  traffic from the networking device eth0 to eth1 for traffic that is destined for our host, thus ignore broadcast, multicast and promiscuous traffic. Randomize
              the order of packets for the outgoing device and do not print any packet contents to the terminal. Also, pin the process and NIC IRQ affinity to CPU 0.

       netsniff-ng --in team0 --out /opt/probe/ -s -m --interval 100MiB -b 0
              Capture on an aggregated team0 networking device and dump packets into multiple pcap files that are split into 100MiB each. Use mmap(2) I/O as a pcap write method,  support  for
              super jumbo frames is built-in (does not need to be configured here), and do not print the captured data to the terminal.  Pin netsniff-ng and NIC IRQ affinity to CPU 0. The de‐
              fault pcap magic type is 0xa1b2c3d4 (tcpdump-capable pcap).

       netsniff-ng --in vlan0 --out dump.pcap -c -u `id -u bob` -g `id -g bob`
              Capture network traffic on device vlan0 into a pcap file called dump.pcap by using normal read(2), write(2) I/O for the pcap file (slower but less latency). Also, after  setting
              up the RX_RING for capture, drop privileges from root to the user and group “bob”. Invoke the packet dissector and print packet contents to the terminal for further analysis.

       netsniff-ng --in any --filter http.bpf -B --ascii -V
              Capture  from  all  available  networking  interfaces and install a low-level filter that was previously compiled by bpfc(8) into http.bpf in order to filter HTTP traffic. Super
              jumbo frame support is automatically enabled and only print human readable packet data to the terminal, and also be more verbose during setup phase. Moreover, dump a BPF  disas‐
              sembly of http.bpf.

       netsniff-ng --in dump.pcap --out dump.cfg --silent
              Convert the pcap file dump.pcap into a trafgen(8) configuration file dump.cfg. Do not print pcap contents to the terminal.

       netsniff-ng -i dump.pcap -f beacon.bpf -o -
              Convert  the pcap file dump.pcap into a trafgen(8) configuration file and write it to stdout. However, do not dump all of its content, but only the one that passes the low-level
              filter for raw 802.11 from beacon.bpf. The BPF engine here is invoked in user space inside of netsniff-ng, so Linux extensions are not available.

       cat foo.pcap | netsniff-ng -i - -o -
              Read a pcap file from stdin and convert it into a trafgen(8) configuration file to stdout.

       netsniff-ng -i nlmon0 -o dump.pcap -s
              Capture netlink traffic to a pcap file. This command needs a netlink monitoring device to be set up beforehand using the follwing commands using ip(1) from the iproute2  utility
              collection:

                modprobe nlmon
                ip link add type nlmon
                ip link set nlmon0 up

              To tear down the nlmon0 device, use the following commands:

                ip link set nlmon0 down
                ip link del dev nlmon0
                rmmod nlmon

       netsniff-ng --fanout-group 1 --fanout-type cpu --fanout-opts defrag --bind-cpu 0 --notouch-irq --silent --in em1 --out /var/cap/cpu0/ --interval 120sec
              Start  two  netsniff-ng  fanout instances. Both are assigned into the same fanout group membership and traffic is splitted among them by incoming cpu. Furthermore, the kernel is
              supposed to defragment possible incoming fragments. First instance is assigned to CPU 0 and the second one to CPU 1, IRQ bindings are not altered as they might have been adapted
              to  this  scenario  by  the user a-priori, and traffic is captured on interface em1, and written out in 120 second intervals as pcap files into /var/cap/cpu0/. Tools like merge‐
              cap(1) will be able to merge the cpu0/1 split back together if needed.

CONFIG FILES
       Files under /etc/netsniff-ng/ can be modified to extend netsniff-ng's functionality:

           * oui.conf - OUI/MAC vendor database
           * ether.conf - Ethernet type descriptions
           * tcp.conf - TCP port/services map
           * udp.conf - UDP port/services map
           * geoip.conf - GeoIP database mirrors

FILTER EXAMPLE
       netsniff-ng supports both, low-level and high-level filters that are attached to its packet(7) socket. Low-level filters are described in the bpfc(8) man page.

       Low-level filters can be used with netsniff-ng in the following way:

           1. bpfc foo > bar
           2. netsniff-ng -f bar
           3. bpfc foo | netsniff-ng -i nlmon0 -f -

       Here, foo is the bpfc program that will be translated into a netsniff-ng readable “opcodes” file and passed to netsniff-ng through the -f option.

       Similarly, high-level filter can be either passed through the -f option, e.g. -f "tcp or udp" or at the end of all options without the “-f”.

       The filter syntax is the same as in tcpdump(8), which is described in the man page pcap-filter(7).  Just to quote some examples:

       host sundown
              To select all packets arriving at or departing from sundown.

       host helios and (hot or ace)
              To select traffic between helios and either hot or ace.

       ip host ace and not helios
              To select all IP packets between ace and any host except helios.

       net ucb-ether
              To select all traffic between local hosts and hosts at Berkeley.

       gateway snup and (port ftp or ftp-data)
              To select all FTP traffic through Internet gateway snup.

       ip and not net localnet
              To select traffic neither sourced from, nor destined for, local hosts. If you have a gateway to another network, this traffic should never make it onto your local network.

       tcp[tcpflags] & (tcp-syn|tcp-fin) != 0 and not src and dst net localnet
              To select the start and end packets (the SYN and FIN packets) of each TCP conversation that involve a non-local host.

       tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)
              To select all IPv4 HTTP packets to and from port 80, that is to say, print only packets that contain data, not, for example, SYN and FIN packets and ACK-only packets.  (IPv6  is
              left as an exercise for the reader.)

       gateway snup and ip[2:2] > 576
              To select IP packets longer than 576 bytes sent through gateway snup.

       ether[0] & 1 = 0 and ip[16] >= 224
              To select IP broadcast or multicast packets that were not sent via Ethernet broadcast or multicast.

       icmp[icmptype] != icmp-echo and icmp[icmptype] != icmp-echoreply
              To select all ICMP packets that are not echo requests or replies (that is to say, not "ping" packets).

PCAP FORMATS:
       netsniff-ng supports a couple of pcap formats, visible through ``netsniff-ng -D'':

       tcpdump-capable pcap (default)
              Pcap  magic  number  is encoded as 0xa1b2c3d4 resp. 0xd4c3b2a1. As packet meta data this format contains the timeval in microseconds, the original packet length and the captured
              packet length.

       tcpdump-capable pcap with ns resolution
              Pcap magic number is encoded as 0xa1b23c4d resp. 0x4d3cb2a1. As packet meta data this format contains the timeval in nanoseconds, the original packet  length  and  the  captured
              packet length.

       Alexey Kuznetzov's pcap
              Pcap  magic  number  is  encoded  as  0xa1b2cd34 resp. 0x34cdb2a1. As packet meta data this format contains the timeval in microseconds, the original packet length, the captured
              packet length, the interface index (sll_ifindex), the packet's protocol (sll_protocol), and the packet type (sll_pkttype).

       netsniff-ng pcap
              Pcap magic number is encoded as 0xa1e2cb12 resp. 0x12cbe2a1. As packet meta data this format contains the timeval in nanoseconds, the original packet length, the captured packet
              length, the timestamp hw/sw source, the interface index (sll_ifindex), the packet's protocol (sll_protocol), the packet type (sll_pkttype) and the hardware type (sll_hatype).

       For further implementation details or format support in your application, have a look at pcap_io.h in the netsniff-ng sources.

NOTE
       To avoid confusion, it should be noted that there is another network analyzer with a similar name, called NetSniff, that is unrelated to the netsniff-ng project.

       For introducing bit errors, delays with random variation and more while replaying pcaps, make use of tc(8) with its disciplines such as netem.

       netsniff-ng  does  only some basic, architecture generic tuning on startup. If you are considering to do high performance capturing, you need to carefully tune your machine, both hard‐
       ware and software.  Simply letting netsniff-ng run without thinking about your underlying system might not necessarily give you the desired performance. Note that tuning your system is
       always a tradeoff and fine-grained balancing act (throughput versus latency). You should know what you are doing!

       One  recommendation  for  software-based tuning is tuned(8).  Besides that, there are many other things to consider. Just to throw you a few things that you might want to look at: NAPI
       networking drivers, tickless kernel, I/OAT DMA engine, Direct Cache Access, RAM-based file systems, multi-queues, and many more things. Also, you might want to read the kernel's  Docu‐
       mentation/networking/scaling.txt  file  regarding  technologies  such  as RSS, RPS, RFS, aRFS and XPS. Also check your ethtool(8) settings, for example regarding offloading or Ethernet
       pause frames.

       Moreover, to get a deeper understanding of netsniff-ng internals and how it interacts with the Linux kernel, the kernel documentation  under  Documentation/networking/{packet_mmap.txt,
       filter.txt, multiqueue.txt} might be of interest.

       How do you sniff in a switched environment? I rudely refer to dSniff's documentation that says:

       The  easiest  route  is simply to impersonate the local gateway, stealing client traffic en route to some remote destination. Of course, the traffic must be forwarded by your attacking
       machine, either by enabling kernel IP forwarding or with a userland program that accomplishes the same (fragrouter -B1).

       Several people have reportedly destroyed connectivity on their LAN to the outside world by ARP spoofing the gateway, and forgetting to enable IP forwarding on the attacking machine. Do
       not do this. You have been warned.

       A safer option than ARP spoofing would be to use a "port mirror" function if your switch hardware supports it and if you have access to the switch.

       If you do not need to dump all possible traffic, you have to consider running netsniff-ng with a BPF filter for the ingress path. For that purpose, read the bpfc(8) man page.

       Also, to aggregate multiple NICs that you want to capture on, you should consider using team devices, further explained in libteam resp.  teamd(8).

       The following netsniff-ng pcap magic numbers are compatible with other tools, at least tcpdump or Wireshark:

           0xa1b2c3d4 (tcpdump-capable pcap)
           0xa1b23c4d (tcpdump-capable pcap with ns resolution)
           0xa1b2cd34 (Alexey Kuznetzov's pcap)

       Pcap files with different meta data endianness are supported by netsniff-ng as well.

BUGS
       When replaying pcap files, the timing information from the pcap packet header is currently ignored.

       Also,  when replaying pcap files, demultiplexing traffic among multiple networking interfaces does not work. Currently, it is only sent via the interface that is given by the --out pa‐
       rameter.

       When performing traffic capture on the Ethernet interface, the pcap file is created and packets are received but without a 802.1Q header. When one uses tshark, all headers are visible,
       but netsniff-ng removes 802.1Q headers. Is that normal behavior?

       Yes  and  no.  The  way  VLAN  headers are handled in PF_PACKET sockets by the kernel is somewhat “problematic” [1]. The problem in the Linux kernel is that some drivers already handle
       VLANs, others do not. Those who handle it can have different implementations, such as hardware acceleration and so on.  So in some cases the VLAN tag is even stripped  before  entering
       the protocol stack, in some cases probably not. The bottom line is that a "hack" was introduced in PF_PACKET so that a VLAN ID is visible in some helper data structure that is accessi‐
       ble from the RX_RING.

       Then it gets really messy in the user space to artificially put the VLAN header back into the right place. Not to mention the resulting performance implications on  all  of  libpcap(3)
       tools since parts of the packet need to be copied for reassembly via memmove(3).

       A user reported the following, just to demonstrate this mess: some tests were made with two machines, and it seems that results depend on the driver ...

           AR8131:
             ethtool -k eth0 gives "rx-vlan-offload: on"
             - wireshark gets the vlan header
             - netsniff-ng doesn't get the vlan header
             ethtool -K eth0 rxvlan off
             - wireshark gets a QinQ header even though no one sent QinQ
             - netsniff-ng gets the vlan header

           RTL8111/8168B:
             ethtool -k eth0 gives "rx-vlan-offload: on"
             - wireshark gets the vlan header
             - netsniff-ng doesn't get the vlan header
             ethtool -K eth0 rxvlan off
             - wireshark gets the vlan header
             - netsniff-ng doesn't get the vlan header

       Even  if  we  agreed on doing the same workaround as libpcap, we still will not be able to see QinQ, for instance, due to the fact that only one VLAN tag is stored in the kernel helper
       data structure. We think that there should be a good consensus on the kernel space side about what gets transferred to userland first.

       Update (28.11.2012): the Linux kernel and also bpfc(8) has built-in support for hardware accelerated VLAN filtering, even though tags might not be visible in the payload itself as  re‐
       ported here. However, the filtering for VLANs works reliable if your NIC supports it. See bpfc(8) for an example.

          [1] http://lkml.indiana.edu/hypermail/linux/kernel/0710.3/3816.html
          [2] http://www.tcpdump.org/linktypes/LINKTYPE_NETLINK.html
          [3] http://www.tcpdump.org/linktypes/LINKTYPE_LINUX_SLL.html

LEGAL
       netsniff-ng is licensed under the GNU GPL version 2.0.

HISTORY
       netsniff-ng  was  originally  written  for  the  netsniff-ng  toolkit by Daniel Borkmann. Bigger contributions were made by Emmanuel Roullit, Markus Amend, Tobias Klauser and Christoph
       Jaeger. It is currently maintained by Tobias Klauser <tklauser@distanz.ch> and Daniel Borkmann <dborkma@tik.ee.ethz.ch>.

SEE ALSO
       trafgen(8), mausezahn(8), ifpps(8), bpfc(8), flowtop(8), astraceroute(8), curvetun(8)

AUTHOR
       Manpage was written by Daniel Borkmann.

COLOPHON
       This page is part of the Linux netsniff-ng toolkit project. A description of the project, and information about reporting bugs, can be found at http://netsniff-ng.org/.

Linux                                                                                    03 March 2013                                                                           NETSNIFF-NG(8)
