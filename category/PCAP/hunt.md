HUNT(1)                                                                           General Commands Manual                                                                          HUNT(1)

NAME
       hunt - Network security auditing tool.

SYNOPSIS
       hunt [-V]  [-v] [-i interface]

DESCRIPTION
       This  manual page documents briefly the hunt command.  This manual page was written for the Debian GNU/Linux distribution because the original program does not have a manual page.
       Instead, it has documentation in the GNU Info format; see below.

READ FIRST
       Please make sure you KNOW what you are doing before using hunt.  It is recommended that you should test how it behaves on some test connections and then use  it  wisely.  You  may
       want to select "options" and then "add conn policy entry" as by default only telnet connections are monitored.

OVERVIEW
       Hunt  is  a  program for intruding into a connection, watching it and resetting it. It has several features, which I didn't find in any product like Juggernaut or T-sight that in‐
       spired me in my development.  I found Juggernaut not flexible enough for further development so I started from scratch (see FEATURES and DESIGN OVERVIEW).  Note that hunt is oper‐
       ating on Ethernet and is best used for connections which can be watched through it. However, it is possible to do something even for hosts on another segments or hosts that are on
       switched ports.  The hunt doesn't distinguish between local network connections and connections going to/from Internet. It can handle all connections it sees.

       Connection hijacking is aimed primarily at the telnet or rlogin traffic but it can be used for another traffic too.  The reset, watching, arp, ... features are common to all  con‐
       nections.

FEATURES
       Connection Management
              * Setting what connections you are interested in.
              * Detecting an ongoing connection (not only SYN started).
              * Normal active hijacking with the detection of the ACK storm.
              * ARP spoofed/Normal hijacking with the detection of successful ARP spoof.
              * Synchronization of the true client with the server after hijacking (so that the connection don't have to be reset).
              * Resetting connection.
              * Watching connection.

       Daemons
              *  Reset  daemon  for automatic connection resetting.  * ARP spoof/relayer daemon for ARP spoofing of hosts with the ability to relay all packets from spoofed hosts.  * MAC
              discovery daemon for collecting MAC addresses.  * Sniff daemon for logging TCP traffic with the ability to search for a particular string.

       Host Resolving
              * Deferred host resolving through dedicated DNS helper servers.

       Packet Engine
              * Extensible packet engine for watching TCP, UDP, ICMP and ARP traffic.  * Collecting TCP connections with sequence numbers and the ACK storm detection.

       Misc   * Determining which hosts are up.

       Switched Environment
              * Hosts on switched ports can be spoofed, sniffed and hijacked too.

COMMAND LINE PARAMETERS
       -V Print Version
       -v Verbose (print pids of created threads)
       -i interface Listen on this interface. Default is eth0

TECHNICAL EXPLANATION
       Let me explain some technical issues which I use in hunt and which are essential for understanding how it works and what you should expect.  The important terms are  IP  spoofing,
       ARP spoofing and ACK storm.  Even if you are familiar with them, you can get some new information.

       IP spoofing
              You set the packet source address to the IP address of the host you pretend to be.

       ARP spoofing
              You set the packet source hardware address (source MAC address) to the address of the host you pretend to be.

       Simple Active Attack against TCP connections - It is a well known type
              of  attack in which you send a packet with spoofed IP addresses and possibly also with spoofed ARP addresses (true MAC addresses of client and server - not fake ones as ex‐
              plained further). In this way, you can force a command to the stream but you are likely to receive the ACK storm (as explained further) unless the original client  host  of
              the connection is running Linux.

       ARP spoofing
              I  use  this  term also for forcing the remote host to think that the host I want to be has a different MAC address so the remote host sends replies to that MAC address and
              the original client host is not able to receive them (but hunt is watching carefully and handles all consequences) (Explaining how to force a host on the network  to  think
              that  the other host has a different MAC I leave as an exercise - I encourage you to read the source code). Please note that I use the term ARP spoofing instead of the term
              ARP forcing or something like that. So don't be confused, if I say ARP spoofing, I mean using some MAC address of a host or just some fake MAC address. Note that ARP spoof‐
              ing  (with  my meaning to force some MAC) doesn't work on Solaris2.5 because it has expiration timers on ARP entries so you can't easily force Solaris to drop an ARP entry.
              The entry usually expires after 20min or less (but you have a chance to force it and hunt supports this mode). The expiration timers on Solaris are set by:

              ndd -set /dev/ip ip_ire_flush_interval 60000 /* 1 min */
              ndd -set /dev/arp arp_cleanup_interval 60 /* 1 min */

              I encourage you to ask your netadmin to set the above values on all Solaris machines. The Win95/NT4sp3, Linux2.0, OSF1 V4.0, HP-UX10.20 are not protected in this way so you
              can  easily  use the described technique on them (actually, they have timers, but they are not operating like in Solaris; in fact, only Solaris is the exception). Actually,
              hunt uses this technique such that it wants to force a fake MAC of the server to the client and a fake MAC of the client to the server. Then both the server and the  client
              are  sending packets to that faked MACs (and hunt can of course handle them).  However, it is sufficient that only one host has a fake MAC of the other host.  The ACK storm
              can't occur in this situation either. So you can use this technique even if one end is Solaris and the other isn't. You will just succeed in the  other  host  and  that  is
              enough.  So  the only problem is when the connection is between two Solaris machines. However, if there is any root connection ongoing you can easily push the commands sug‐
              gested above without ARP spoofing to the connection and alter the expiration timers of the ARP cache.

       ACK Storm
              The ACK storm is caused by majority of TCP stacks (!!!  Linux2.0 is an exception !!!). Let's imagine that you send some data to an ongoing connection to the server  (as  if
              sent  by the client - with expected seq.  numbers, ... ). The server responds with the acknowledgment of the data you sent but this acknowledgment is received by the origi‐
              nal client too. But from the original client point of view, the server has acknowledged data that doesn't exist on the client. So something strange occurred and the  origi‐
              nal client sends the "right" sequence number with ACK to the server.  But the TCP rules say that it is required to generate an immediate acknowledgment when an out-of-order
              segment is received. This ACK should not be delayed. So the server sends the acknowledgment of non-existent data to the client again. And the client responses, ...  Only if
              the  source  host of the connection is Linux then the ACK storm doesn't occur. Note that if you use ARP spoofing (forcing) then the ACK storm can't come because one or both
              ends will send packets with fake MACs and those packets are received by hunt rather than by the other host.

       Connection Reset
              With a single properly constructed packet you can reset the connection (RST flag in TCP header). Of course, you have to know the sequence number but it is not a problem for
              hunt  which is watching all the time. You can reset server, client, or both. When you reset only one end the other end is reset when it tries to send data to the first host
              which will response with RST because of the connection reset on it.

       Connection sniffing/watching
              The simplest thing you can do is to silently sit in you chair and watch hunt output about any connection which you choose from the list.

       Connection Synchronization
              Well, that's one of the main features of hunt. If you put some data to the TCP stream (through simple active attack or ARP spoofing), you desynchronize the stream from  the
              server/original  client  point of view. After some work done on that connection you can just reset it or you can try to synchronize both original ends again. That is not an
              easy task. The user on the client is prompted to type some chars and some chars are sent to the client and server. The main goal of all stuff is to synchronize the sequence
              numbers on both client and server again.

       Switch/Segment traffic rerouting
              With  ARP  spoofing  you can even force switch so that it will send you the traffic for hosts on another segment/switched port. This is because a switch will think that the
              MAC belongs to your port. Be careful if your switch has some security policy and MACs have been explicitly set up on a per port basis - but in fact I don't ever see such  a
              configuration on "ordinary" network.

       ARP-relay daemon
              Don't be confused. I use this term for hunt daemon which is responsible for inserting packets to the network (rerouting) of all data it receives from ARP spoofed hosts.

       Switched environment
              Well, the hunt is now capable of watching and hijacking hosts that are on switched ports. In common you can't watch the hosts traffic on switched ports but if you first ARP
              spoof them (with ARP spoof daemon menu) you are able to look at the connections that are between that hosts. First you do arp spoof and the hosts will send you the  traffic
              and  from  that time you can list the connections between them, then you can watch and hijack them. It is commonly accepted that the switches protect your connections again
              inside intruders and spoofers. Well, that is still true for carefully setuped switches. The switches that are plugged to the LAN without any port security configuration are
              useless in the job to protect your LAN.

DESIGN OVERVIEW
       The  development  model is based on a packet engine (hunt.c) which runs in its own thread and captures packets from the network. The packet engine collects information of TCP con‐
       nections/starting/termination, sequence numbers,  and MAC addresses. It collects the MACs and seq. numbers from the server point of view and separate MACs and  seq.  numbers  from
       the client point of view. So it is prepared for hijacking. This information (seq. num., MAC,

       Modules can register functions with the packet engine which are then invoked when new packets are received. A module function determines if the module is interested in a packet or
       not and can place the packet in a module specific list of packets. A module function can also send  some packet to the network if it is desirable to do it very  fast.  The  module
       (usually  in  some other thread so it needs to be scheduled to be run) then gets packets from the list and analyzes them. In this way, you can easily develop modules which perform
       various activities.

       Packets to be sent as a response to the network are described by structures so you don't have to care about some default fields or checksums. At this time, functions for TCP, ICMP
       and ARP traffic are already prepared. (UDP is missing because I don't use it in any module)

       A  separate  set  of  daemons  is used for host resolving (DNS). That is because the gethostbyname/gethostbyname_r function is protected by mutex (As far as I know - it was so two
       years ago - I didn't try it now) so you can't run it truly parallel in a multithreaded environment. Therefore, the commonly used workaround is  to  fire  up  some  helper  daemons
       through fork which will run gethostbyname.

USER ENVIRONMENT
       Well, the user environment isn't graphical but I believe that you will like it.

       In  the title of all menus is some status information about hunt.  First, there is an indication with which menu you are working. Second, the number of packets received by hunt is
       shown. Hunt pre-allocates some buffers for packets; the status of free and allocated buffers is displayed as the third value. The number of free buffers is low for a  high  loaded
       network  or the ACK storm or if you have poor hardware. In my case, for example, the numbers 63/64 were normally indicated meaning that only one buffer was used, but after the ACK
       storm, I have something like 322/323. Note that the buffers once allocated are not freed. The low number of free buffers can also mean some bug in hunt but I think I carefully de‐
       bugged  all modules to this kind of bug. The last indicator reports which daemons (actually threads) are running. They are: R - reset daemon, Y - arp relayer, S - sniffer, M - MAC
       discoverer. If you switch on the verbose option you get additional information about how many packets were dropped - they were fragments (see the bugs) or were malformed, and  how
       many  packets  belong  to  other  protocols than TCP, UDP, ICMP and ARP.  In the prompt for user input is indicator that will tell you through '*' char that hunt added new connec‐
       tion(s) to the connection list since last connection listening.

       General interface
              In all menus the x key works as escape.  The network mask is denoted by the ip_address/mask notation where mask is the number of 1's on the left side of the  network  mask.
              For example, 0.0.0.0/0 means everything and 192.168.32.10/32 means only that host.

              For most modules is used:
              l) list items
              a) add item
              m) modify item
              d) delete item
              They will be referred in this text as l) a) m) d)

       List/Watch/Reset connection
              You  can  obtain  the list of connections tracked by the hunt packet engine.  Which connections are tracked is specified in the options menu. You can interactively watch or
              reset these connections. You can also perform hijacking on them (next two menu items).

       ARP/Simple hijack
              ARP/Simple hijack offers you an interactive interface for the insertion of data to the selected connection. You can perform ARP spoofing for both connection ends, for  only
              one  end  or you can not to do it at all. If you don't do ARP spoofing then you probably receive the ACK storm after typing the first char.  When you do ARP spoofing, it is
              checked if it succeeds. If not, you are prompted if you want to wait until it succeeds (you can interrupt this waiting through CTRL-C of course). After inserting some  data
              to the connection you type CTRL-] and then you can synchronize or reset the connection.  If you choose synchronization, the user is prompted to type some chars and after he
              does so the connection will be in the synchronous state. You can interrupt the synchronization process with CTRL-C and then you can reset the connection. Note  that  CTRL-C
              is  used  widely for interrupting an ongoing process. The CTRL-] (like telnet) is used for finishing the interactive insertion of data to the connection. The ARP/Simple hi‐
              jack doesn't automatically reset the connection after it detects the ACK storm so you have to do it yourself. Note also that ARP/Simple hijack works with  the  ARP  relayer
              (as  described  further)  so that other connections are not affected. Normally, if you ARP spoof two servers then the ARP/Simple hijack handles only one selected connection
              between these two hosts but other connections between these two hosts look like they freeze. If you start the ARP relayer, then these  other  connections  are  handled  and
              rerouted  through.  So  other  connections  from  one spoofed host to the other are not affected at all. It is recommended to run ARP relayer if you do ARP hijacking of two
              servers.  Note that if you ARP spoof (force) some client MAC to the server then only connections going from the server to that client are affected. Other  connections  from
              the server to other machines are untouched.

       Simple hijack
              Simple hijack allows you to insert a command to the data stream of the connection. When you insert the command, hunt waits for it to complete up to a certain timeout and if
              the ACK storm doesn't occur, you are prompted for the next command. After that, you can synchronize or reset the connection.  Note that you can use the  interactive  inter‐
              face to simple hijack when you use ARP/simple hijack without ARP spoofing but if you use full interactive interface of ARP/simple hijack without ARP spoofing you are likely
              to get the ACK storm immediately after typing the first char. So this mode of hijacking is useful when you have to deal with the ACK storm because it sends your data to the
              connection in a single packet. When the ACK storm is in progress it is very hard to deliver other packets from hunt to the server as the network and server are congested.

DAEMONS
       I call them daemons but they are actually threads.  All daemons can be started and stooped. Don't be surprised when you insert or modify some rule in a daemon and it does nothing.
       The daemon is not running - you have to start it. All daemons are by default stopped even though you can alter the configuration. Common commands in the daemons menu are:

              s) start the daemon
              k) stop the daemon
              l) list configuration items
              a) add config. item
              m) modify config. item
              d) delete config. item

       Reset daemon
              This daemon can be used to perform automatic resets of ongoing connections that hunt can see. You can describe which connections should  be  terminated  by  giving  src/dst
              host/mask  and  src/dst ports. The SYN flag off means that all specified connections should be terminated (even ongoing). The SYN flag on means that only newly started con‐
              nections are reset. So the connections that are in progress are not affected. Don't forget to start the daemon.

       ARP daemon
              Here you can do ARP spoofing of hosts. You enter src and dst addresses and desired srcMAC. The dst is then forced to think that src has srcMAC. You can use some fake MAC or
              better  MAC  of  host  that  is  currently down. You just want that the hosts will send you all the data (so you can even look at packets that are on a different segment or
              switched port that you will not normally see) The ARP module looks carefully for packets which will break ARP spoofing of hosts and handle them but you can even specify the
              refresh interval for ARP spoofing but it is not necessary to do it. Set the refresh interval only if you are experienced with some bad or strange behavior of spoofed hosts.
              Also there is the possibility to test the hosts for successful spoof with the ability to force that spoof - it is recommended to test the ARP spoof if something looks  like
              it  is wrong or the computer doesn't send the traffic to the hunt. The force option is handful if the first spoofing packets are discarded with switch so if you are running
              hunt against hosts on switched ports you can try to run the force mode by example for 10s and then break it with CTRL-C if the spoof continues to  fail.   The  ARP  relayer
              daemon  is  used  to  perform ARP relaying of ARP spoofed connections. When you insert some ARP spoof of hosts the ARP spoofing is performed immediately even if the relayer
              isn't running!!!. But if the ARP spoofing succeeds, the connections will look like they freeze. For rerouting (not IP routing !) these connections  through  your  hunt  you
              need  to start the ARP relayer. The relayer works well with ARP/simple hijack so once you have hosts ARP spoofed with ARP relaying you can easily do ARP/simple hijack which
              will detect that the hosts are already ARP spoofed and takes over the connection immediately. With this technique you can easily become man in the middle from the beginning
              of  the  connection even though your host with hunt isn't an IP gateway. I encourage you to write other application specific protocol handlers for the man in the middle at‐
              tack as it is really simple with this framework.

       Sniff daemon
              The purpose of the sniff daemon is to log specified packets.  The sniff daemon can also search for a simple pattern (string) in the data stream (see the bugs section).  You
              can  specify which connection you are interested in, where to search (src, dst, both), what do you want to search, how many bytes you want to log, from what direction (src,
              dst, both) and to what file should the daemon write. All logged ,0l(asanew-lines or asehexnnum.).rectory. The default file name for logging is composed of the host and port
              names. In the options submenu you can set how to log new lines (

       MAC discovery daemon
              This  daemon  is  used to collect MAC addresses corresponding to the specified IP range. You can enter the time after which the daemon will try collecting again (default is
              5min).

       Host up menu
              The host up module determines which hosts are up (with TCP/IP stack).  You just specify the IP range and that space is then searched for running hosts.  It  is  capable  to
              determine which hosts have network interface in promiscuous mode. The promiscuous mode usually shows that the host is running some kind of sniffer/network analyzer.

       Options menu
              In the options menu you can tune different things:

       l) a) m) d)
              List/Add/Mod/Del Connection Policy Entry
              First of all you can select which connections should be tracked. The default setting is to look at telnet connections from all hosts but you can adjust this behavior by the
              specification of src/dst address/mask src/dst port pairs. With commands: l) a) m) d) you set what you are interested in.

       c)     Connection Listening Properties
              You can set whether the  sequence numbers and MACs of ongoing connections will be displayed during connection listening.

       h)     Host Resolving
              You can turn on resolving of hosts to their names. As the resolving is deferred you don't get the names of hosts immediately.  Just try to list  connections  several  times
              and you will see the hosts names. (I used this deferred approach because I didn't want any delay of interface that the resolving can cause).

       r)     Reset ACK Storm Timeout
              This  timeout is used in simple hijack to automatically reset the connection after the ACK storm is detected. Note that you can receive the ACK storm even in arp/simple hi‐
              jack in case you don't perform ACK spoofing of any host.

       s)     Simple Hijack Timeout For Next cmd
              Simple hijack has not an interactive connection interface. That means you write the whole command which will be inserted into the connection data  stream.  If  no  data  is
              transferred through the connection up to this timeout, you are prompted for the next command.

       q)     ARP Request/Reply Packets
              Number of request or reply packets hunt will send when it is doing arp spoofing.

       t)     ARP Request Spoof Through Request
              Option whether hunt will send ARP spoof request or ARP spoof reply when it receives broadcasted ARP request which will break ARP spoof.

       w)     Switched Environment
              Some optimization for switched environment. It works perfectly for non switched environment also.

       y)     ARP Spoof With My MAC
              Set the originating MAC address of sent spoofed ARP to my (hunt) ethernet MAC - sometimes helps in switched environment.

       e)     Learn MAC From IP Traffic
              You can enable that MAC addresses will be learned from all IP traffic not just from ARP.

       p)     Number Of Printed Lines Per Page In Listening
              Self explanatory

       v)     Verbose On/Off
              Self explanatory

TESTED ENVIRONMENT
       HUNT program requirements:
       * Linux >= 2.2
       * Glibc with linuxthreads
       * Ethernet

       Tested hosts:
       Linux 2.0, Linux 2.1, Linux 2.2, Solaris 2.5.1, NT4sp3/4, Win95, OSF V4.0D, HPUX 10.20, IRIX 6.2

       Tested network equipment:
       BayNetworks 28115, 28200, 300 switches 3Com SuperStack II 3000, 1000 switches

SECURITY NOTES
       Please  note the already known truth that telnet and similar programs which send passwords in clear text are vulnerable to the described attacks. Programs using one time passwords
       are also easily attacked and in fact they are useless if someone can run a program like hunt. Only full encrypted traffic isn't vulnerable to these attacks but note that  you  can
       become  a  man in the middle if you use ARP spoofing (forcing) without the ACK storm and you can try to do something. Also unconfigured switch doesn't protect you from sniffing or
       hijacking. It is necessary to carefully configure port security on the switches in order to protect the computers on the switched ports.

       Detecting attacks isn't an easy task. For ARP spoofing there are tools which can detect it. The ACK storm is detectable by some sophisticated network analyzers (you can detect the
       pattern of the ACK storm or the statistics of ACKs without data). If you run hunt on your network you can detect the ACK storm because the hunt can detect the ACK storm pattern.

PERFORMANCE NOTE
       Make  sure  you  are  running hunt on idle machine with sufficient power (I used PII-233 with 128MB RAM) and without any other packet analyzer because if you use advanced features
       like arp spoofing or hijacking hunt needs to reply fast with it's own packets inserted into the traffic on the network.

DOWNLOAD
       This software can be found at http://www.gncz.cz/kra/index.html
       or at
       ftp://ftp.gncz.cz/pub/linux/hunt/

KNOWN BUGS
       * some structures are poorly locked through mutexes
       * if you watch connection then some escape sequences from that connection can influent your terminal. Note that your terminal is named "Linux" ("xterm" - if you  run  it  from  X,
       ...) but the escape sequences are for the client side terminal which may or may not be Linux so you can get some mess.
       *  sniff is not capable to search for a pattern which crosses the packet boundary. That means it can't search for a pattern of the user typed input as this input is usually trans‐
       ferred with 1B data long packets.
       * hunt doesn't support defragmentation so the IP fragments have to be dropped.

BUG FIXES, SUGGESTIONS
       Please send bug descriptions, patches, suggestions, new modules or successful stories to kra@gncz.cz

ACKNOWLEDGMENTS
       I would like to thank Sven Ubik < ubik@fsid.cvut.cz > for his invaluable input and feedback.

FINAL WORD
       Note that this software was written only for my fun in my free time and it was a great exercise of TCP/IP protocols. I am now familiar with seq.  numbers,  ACKs,  timeouts,  MACs,
       checksums, ... to the finest level. As I have some pretty good background this "hunt" challenge made me think that I hadn't known TCP/IP as great as I had thought. You are welcome
       to read the source code and to try to modify it or write your own modules.

DEBIAN
       This manpage was converted from internal documentation by Jon Marler < jmarler@debian.org > for the Debian GNU/Linux operating system.

                                                                                                                                                                                   HUNT(1)
