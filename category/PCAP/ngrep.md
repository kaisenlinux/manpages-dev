
NGREP(8)                                                                                  User Manuals                                                                                 NGREP(8)

NAME
       ngrep - network grep

SYNOPSIS
       ngrep <-hNXViwqpevxlDtTRM> <-IO pcap_dump > < -n num > < -d dev > < -A num > < -s snaplen > < -S limitlen > < -W normal|byline|single|none > < -c cols > < -P char > < -F file > < match
       expression > < bpf filter >

DESCRIPTION
       ngrep strives to provide most of GNU grep's common features, applying them to the network layer.  ngrep is a pcap-aware tool that will allow you to specify extended regular expressions
       to match against data payloads of packets.  It currently recognizes TCP, UDP and ICMP across Ethernet, PPP, SLIP, FDDI and null interfaces, and understands bpf filter logic in the same
       fashion as more common packet sniffing tools, such as tcpdump(8) and snoop(1).

OPTIONS
       -h     Display help/usage information.

       -N     Show sub-protocol number along with single-character identifier (useful when observing raw or unknown protocols).

       -X     Treat the match expression as a hexadecimal string.  See the explanation of match expression below.

       -V     Display version information.

       -i     Ignore case for the regex expression.

       -w     Match the regex expression as a word.

       -q     Be quiet; don't output any information other than packet headers and their payloads (if relevant).

       -p     Don't put the interface into promiscuous mode.

       -e     Show empty packets.  Normally empty packets are discarded because they have no payload to search.  If specified, empty packets will be shown, regardless of the  specified  regex
              expression.

       -v     Invert the match; only display packets that don't match.

       -x     Dump packet contents as hexadecimal as well as ASCII.

       -l     Make stdout line buffered.

       -D     When reading pcap_dump files, replay them at their recorded time intervals (mimic realtime).

       -t     Print a timestamp in the form of YYYY/MM/DD HH:MM:SS.UUUUUU everytime a packet is matched.

       -T     Print a timestamp in the form of +S.UUUUUU, indicating the delta between packet matches.  Specify a second time to indicate the delta since the first packet match.

       -R     Do not try to drop privileges to the DROPPRIVS_USER.

              ngrep  makes no effort to validate input from live or offline sources as it is focused more on performance and handling large amounts of data than protocol correctness, which is
              most often a fair assumption to make.  However, sometimes it matters and thus as a rule ngrep will try to be defensive and drop any root privileges it might have.

              There exist scenarios where this behaviour can become an obstacle, so this option is provided to end-users who want to disable this feature, but must do so with an understanding
              of  the risks.  Packets can be randomly malformed or even specifically designed to overflow sniffers and take control of them, and revoking root privileges is currently the only
              risk mitigation ngrep employs against such an attack.  Use this option and turn it off at your own risk.

       -c cols
              Explicitly set the console width to ``cols''.  Note that this is the console width, and not the full width of what ngrep prints out as payloads; depending  on  the  output  mode
              ngrep may print less than ``cols'' bytes per line (indentation).

       -F file
              Read  in  the  bpf filter from the specified filename.  This is a compatibility option for users familiar with tcpdump.  Please note that specifying ``-F'' will override any bpf
              filter specified on the command-line.

       -P char
              Specify an alternate character to signify non-printable characters when displayed.  The default is ``.''.

       -K num Kill matching TCP connections (like tcpkill).  The numeric argument controls how many RST segments are sent.

       -W normal|byline|single|none
              Specify an alternate manner for displaying packets, when not in hexadecimal mode.  The ``byline'' mode honors embedded linefeeds, wrapping text only when a linefeed  is  encoun‐
              tered  (useful  for observing HTTP transactions, for instance).  The ``none'' mode doesn't wrap under any circumstance (entire payload is displayed on one line).  The ``single''
              mode is conceptually the same as ``none'', except that everything including IP and source/destination header information is all on one line.  ``normal'' is the default mode  and
              is only included for completeness.  This option is incompatible with ``-x''.

       -s snaplen
              Set the bpf caplen to snaplen (default 65536).

       -S limitlen
              Set the upper limit on the size of packets that ngrep will look at.  Useful for looking at only the first N bytes of packets without changing the BPF snaplen.

       -I pcap_dump
              Input  file  pcap_dump  into  ngrep.   Works with any pcap-compatible dump file format.  This option is useful for searching for a wide range of different patterns over the same
              packet stream.

       -O pcap_dump
              Output matched packets to a pcap-compatible dump file.  This feature does not interfere with normal output to stdout.

       -n num Match only num packets total, then exit.

       -d dev By default ngrep will select a default interface to listen on.  Use this option to force ngrep to listen on interface dev.

       -A num Dump num packets of trailing context after matching a packet.

        match expression
              A match expression is either an extended regular expression, or if the -X option is specified, a string signifying a hexadecimal value.  An extended regular  expression  follows
              the rules as implemented by the GNU regex library.  Hexadecimal expressions can optionally be preceded by `0x'.  E.g., `DEADBEEF', `0xDEADBEEF'.

        bpf filter
              Selects  a  filter that specifies what packets will be dumped.  If no bpf filter is given, all IP packets seen on the selected interface will be dumped.  Otherwise, only packets
              for which bpf filter is `true' will be dumped.

       The bpf filter consists of one or more primitives.  Primitives usually consist of an id (name or number) preceded by one or more qualifiers.  There are three different kinds of  quali‐
       fier:

       type   qualifiers  say  what  kind  of  thing the id name or number refers to.  Possible types are host, net and port.  E.g., `host blort', `net 1.2.3', `port 80'.  If there is no type
              qualifier, host is assumed.

       dir    qualifiers specify a particular transfer direction to and/or from id.  Possible directions are src, dst, src or dst and src and dst.  E.g., `src foo', `dst net 1.2.3',  `src  or
              dst  port  ftp-data'.   If there is no dir qualifier, src or dst is assumed.  For `null' link layers (i.e. point to point protocols such as slip) the inbound and outbound quali‐
              fiers can be used to specify a desired direction.

       proto  qualifiers are restricted to ip-only protocols.  Possible protos are: tcp , udp and icmp.  e.g., `udp src foo' or `tcp port 21'.  If there is no proto qualifier,  all  protocols
              consistent  with the type are assumed.  E.g., `src foo' means `ip and ((tcp or udp) src foo)', `net bar' means `ip and (net bar)', and `port 53' means `ip and ((tcp or udp) port
              53)'.

       In addition to the above, there are some special `primitive' keywords that don't follow the pattern: gateway, broadcast, less, greater and arithmetic expressions.  All of these are de‐
       scribed below.

       More  complex  filter  expressions  are  built up by using the words and, or and not to combine primitives.  E.g., `host blort and not port ftp and not port ftp-data'.  To save typing,
       identical qualifier lists can be omitted.  E.g., `tcp dst port ftp or ftp-data or domain' is exactly the same as `tcp dst port ftp or tcp dst port ftp-data or tcp dst port domain'.

       Allowable primitives are:

       dst host host
              True if the IP destination field of the packet is host, which may be either an address or a name.

       src host host
              True if the IP source field of the packet is host.

       host host
              True if either the IP source or destination of the packet is host.  Any of the above host expressions can be prepended with the keywords, ip, arp, or rarp as in:
                   ip host host
              which is equivalent to:

       ether dst ehost
              True if the ethernet destination address is ehost.  Ehost may be either a name from /etc/ethers or a number (see ethers(3N) for numeric format).

       ether src ehost
              True if the ethernet source address is ehost.

       ether host ehost
              True if either the ethernet source or destination address is ehost.

       gateway host
              True if the packet used host as a gateway.  I.e., the ethernet source or destination address was host but neither the IP source nor the IP destination was host.  Host must be  a
              name and must be found in both /etc/hosts and /etc/ethers.  (An equivalent expression is
                   ether host ehost and not host host
              which can be used with either names or numbers for host / ehost.)

       dst net net
              True if the IP destination address of the packet has a network number of net. Net may be either a name from /etc/networks or a network number (see networks(4) for details).

       src net net
              True if the IP source address of the packet has a network number of net.

       net net
              True if either the IP source or destination address of the packet has a network number of net.

       net net mask mask
              True if the IP address matches net with the specific netmask.  May be qualified with src or dst.

       net net/len
              True if the IP address matches net a netmask len bits wide.  May be qualified with src or dst.

       dst port port
              True  if the packet is ip/tcp or ip/udp and has a destination port value of port.  The port can be a number or a name used in /etc/services (see tcp(4P) and udp(4P)).  If a name
              is used, both the port number and protocol are checked.  If a number or ambiguous name is used, only the port number is checked (e.g., dst port 513  will  print  both  tcp/login
              traffic and udp/who traffic, and port domain will print both tcp/domain and udp/domain traffic).

       src port port
              True if the packet has a source port value of port.

       port port
              True if either the source or destination port of the packet is port.  Any of the above port expressions can be prepended with the keywords, tcp or udp, as in:
                   tcp src port port
              which matches only tcp packets whose source port is port.

       less length
              True if the packet has a length less than or equal to length.  This is equivalent to:
                   len <= length.

       greater length
              True if the packet has a length greater than or equal to length.  This is equivalent to:
                   len >= length.

       ip proto protocol
              True if the packet is an ip packet (see ip(4P)) of protocol type protocol.  Protocol can be a number or one of the names tcp, udp or icmp.  Note that the identifiers tcp and udp
              are also keywords and must be escaped via backslash (\), which is \\ in the C-shell.

       ip broadcast
              True if the packet is an IP broadcast packet.  It checks for both the all-zeroes and all-ones broadcast conventions, and looks up the local subnet mask.

       ip multicast
              True if the packet is an IP multicast packet.

       ip     Abbreviation for:
                   ether proto ip

       tcp, udp, icmp
              Abbreviations for:
                   ip proto p
              where p is one of the above protocols.

       expr relop expr
              True if the relation holds, where relop is one of >, <, >=, <=, =, !=, and expr is an arithmetic expression composed of integer constants (expressed in standard C  syntax),  the
              normal binary operators [+, -, *, /, &, |], a length operator, and special packet data accessors.  To access data inside the packet, use the following syntax:
                   proto [ expr : size ]
              Proto  is  one  of  ip, tcp, udp or icmp, and indicates the protocol layer for the index operation.  The byte offset, relative to the indicated protocol layer, is given by expr.
              Size is optional and indicates the number of bytes in the field of interest; it can be either one, two, or four, and defaults to one.  The length operator, indicated by the key‐
              word len, gives the length of the packet.

              For  example,  `ether[0]  &  1 != 0' catches all multicast traffic.  The expression `ip[0] & 0xf != 5' catches all IP packets with options. The expression `ip[6:2] & 0x1fff = 0'
              catches only unfragmented datagrams and frag zero of fragmented datagrams.  This check is implicitly applied to the tcp and udp index operations.  For  instance,  tcp[0]  always
              means the first byte of the TCP header, and never means the first byte of an intervening fragment.

       Primitives may be combined using:

              A parenthesized group of primitives and operators (parentheses are special to the Shell and must be escaped).

              Negation (`!' or `not').

              Concatenation (`&&' or `and').

              Alternation (`||' or `or').

       Negation  has  highest precedence.  Alternation and concatenation have equal precedence and associate left to right.  Note that explicit and tokens, not juxtaposition, are now required
       for concatenation.

       If an identifier is given without a keyword, the most recent keyword is assumed.  For example,
            not host vs and ace
       is short for
            not host vs and host ace
       which should not be confused with
            not ( host vs or ace )

       Expression arguments can be passed to ngrep as either a single argument or as multiple arguments, whichever is more convenient.  Generally, if the expression contains Shell metacharac‐
       ters, it is easier to pass it as a single, quoted argument.  Multiple arguments are concatenated with spaces before being parsed.

DIAGNOSTICS
       Errors from ngrep, libpcap, and the GNU regex library are all output to stderr.

EXIT STATUS
       The ngrep utility exits with one of the following values:

            0     One or more frames were matched.
            1     No frames were matched.
            2     An error occurred.
            3+    Hell is freezing over, run!

AUTHOR
       Written by Jordan Ritter <jpr5@darkridge.com>.

REPORTING BUGS
       Please report bugs to the ngrep's GitHub Issue Tracker, located at

           http://github.com/jpr5/ngrep/issues

       Non-bug, non-feature-request general feedback should be sent to the author directly by email.

NOTES
       ALL YOUR BASE ARE BELONG TO US.

*nux                                                                                     September 2017                                                                                NGREP(8)
