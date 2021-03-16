  SSLDUMP
 
## NAME
        ssldump - dump SSL traffic on a network
 
## SYNOPSIS
        ssldump [ -vTshVq -aAdeHnNqTxXvy ] [ -i interface ]
                [ -k keyfile ] [ -l sslkeylogfile ] [ -p password ] [ -r dumpfile ]
                [ -S [crypto|d|ht|H|nroff] ] [ expression ]
 
## DESCRIPTION
        ssldump  is  an  SSL/TLS  network  protocol analyzer. It identifies TCP connections on the chosen network interface and attempts to interpret them as SSL/TLS
        traffic. When it identifies SSL/TLS traffic, it decodes the records and displays them in a textual form to stdout. If provided with  the  appropriate  keying
        material, it will also decrypt the connections and display the application data traffic.
 
        ssldump  has been tested on FreeBSD, Linux, Solaris, and HP/UX.  Since it's based on PCAP, it should work on most platforms. However, unlike tcpdump, ssldump
        needs to be able to see both sides of the data transmission so you may have trouble using it with network taps such as SunOS nit that don't permit you to see
        transmitted  data.   Under  SunOS with nit or bpf: To run tcpdump you must have read access to /dev/nit or /dev/bpf*.  Under Solaris with dlpi: You must have
        read access to the network pseudo device, e.g.  /dev/le.  Under HP-UX with dlpi: You must be root or it must be installed setuid to root.   Under  IRIX  with
        snoop: You must be root or it must be installed setuid to root.  Under Linux: You must be root or it must be installed setuid to root.  Under Ultrix and Dig‐
        ital UNIX: Once the super-user has enabled promiscuous-mode operation using pfconfig(8), any user may run ssldump Under BSD: You must  have  read  access  to
        /dev/bpf*.
 
## OPTIONS
        -a     Print bare TCP ACKs (useful for observing Nagle behavior)
 
        -A     Print all record fields (by default ssldump chooses the most interesting fields)
 
        -d     Display  the  application data traffic. This usually means decrypting it, but when -d is used ssldump will also decode application data traffic before
               the SSL session initiates.  This allows you to see HTTPS CONNECT behavior as well as SMTP STARTTLS. As a side effect, since ssldump can't tell whether
               plaintext is traffic before the initiation of an SSL connection or just a regular TCP connection, this allows you to use ssldump to sniff any TCP con‐
               nection.  ssldump will automatically detect ASCII data and display it directly to the screen. non-ASCII data is displayed as hex dumps. See also -X.
 
        -e     Print absolute timestamps instead of relative timestamps
 
        -H     Print the full SSL packet header.
 
        -n     Don't try to resolve host names from IP addresses
 
        -N     Attempt to parse ASN.1 when it appears, such as in certificates and DNs.
 
        -p     Use password as the SSL keyfile password.
 
        -P     Don't put the interface into promiscuous mode.
 
        -q     Don't decode any record fields beyond a single summary line. (quiet mode).
 
        -T     Print the TCP headers.
 
        -v     Display version and copyright information.
 
        -t     Specify the TTL for inactive connections referenced in the connection pool (in seconds, default: 100).
 
        -F     Specify the number of packets after which a connection pool cleaning is performed (in packets, default: 100).
 
        -x     Print each record in hex, as well as decoding it.
 
        -X     When the -d option is used, binary data is automatically printed in two columns with a hex dump on the left and the printable characters on the right.
               -X suppresses the display of the printable characters, thus making it easier to cut and paste the hex data into some other program.
 
        -y     Decorate the output for processing with nroff/troff. Not very useful for the average user.
 
        -i interface
               Use interface as the network interface on which to sniff SSL/TLS traffic.
 
        -k keyfile
               Use keyfile as the location of the SSL keyfile (OpenSSL format) Previous versions of ssldump automatically looked in ./server.pem.  Now you must spec‐
               ify your keyfile every time.
 
        -l sslkeylogfile
               Use sslkeylogfile as the location of the SSLKEYLOGFILE (https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/Key_Log_Format)
 
        -p password
               Use password as the SSL keyfile password.
 
        -r file
               Read data from file instead of from the network.  The old -f option still works but is deprecated and will probably be removed with the next version.
 
        -S [ crypto | d | ht | H ]
               Specify SSL flags to ssldump.  These flags include:
 
               crypto Print cryptographic information.
 
               d      Print fields as decoded.
 
               ht     Print the handshake type.
 
               H      Print handshake type and highlights.
 
        expression
               Selects what packets ssldump will examine. Technically speaking, ssldump supports the full expression syntax from PCAP and tcpdump.  In fact, the  de‐
               scription  here  is  cribbed from the tcpdump man page. However, since ssldump needs to examine full TCP streams, most of the tcpdump expressions will
               select traffic mixes that ssldump will simply ignore. Only the expressions which don't result in incomplete TCP streams are listed here.
 
               The expression consists of one or more primitives.  Primitives usually consist of an id (name or number) preceded by one or  more  qualifiers.   There
               are three different kinds of qualifier:
 
               type   qualifiers  say  what  kind  of  thing the id name or number refers to.  Possible types are host, net and port.  E.g., `host foo', `net 128.3',
                      `port 20'.  If there is no type qualifier, host is assumed.
 
               dir    qualifiers specify a particular transfer direction to and/or from id.  Possible directions are src, dst, src or dst and  src  and  dst.   E.g.,
                      `src  foo',  `dst  net  128.3', `src or dst port ftp-data'.  If there is no dir qualifier, src or dst is assumed.  For `null' link layers (i.e.
                      point to point protocols such as slip) the inbound and outbound qualifiers can be used to specify a desired direction.
 
               More complex filter expressions are built up by using the words and, or and not to combine primitives.  E.g., `host foo and not port ftp and not  port
               ftp-data'.   To save typing, identical qualifier lists can be omitted.  E.g., `tcp dst port ftp or ftp-data or domain' is exactly the same as `tcp dst
               port ftp or tcp dst port ftp-data or tcp dst port domain'.
 
               Allowable primitives are:
 
               dst host host
                      True if the IPv4/v6 destination field of the packet is host, which may be either an address or a name.
 
               src host host
                      True if the IPv4/v6 source field of the packet is host.
 
               host host
                      True if either the IPv4/v6 source or destination of the packet is host.  Any of the above host expressions can be prepended with the  keywords,
                      ip, arp, rarp, or ip6 as in:
                           ip host host
                      which is equivalent to:
                           ether proto \ip and host host
                      If host is a name with multiple IP addresses, each address will be checked for a match.
 
               ether dst ehost
                      True  if  the  ethernet destination address is ehost.  Ehost may be either a name from /etc/ethers or a number (see ethers(3N) for numeric for‐
                      mat).
 
               ether src ehost
                      True if the ethernet source address is ehost.
 
               ether host ehost
                      True if either the ethernet source or destination address is ehost.
 
               gateway host
                      True if the packet used host as a gateway.  I.e., the ethernet source or destination address was host but neither the IP source nor the IP des‐
                      tination was host.  Host must be a name and must be found in both /etc/hosts and /etc/ethers.  (An equivalent expression is
                           ether host ehost and not host host
                      which can be used with either names or numbers for host / ehost.)  This syntax does not work in IPv6-enabled configuration at this moment.
 
               dst net net
                      True  if  the  IPv4/v6  destination address of the packet has a network number of net. Net may be either a name from /etc/networks or a network
                      number (see networks(4) for details).
 
               src net net
                      True if the IPv4/v6 source address of the packet has a network number of net.
 
               net net
                      True if either the IPv4/v6 source or destination address of the packet has a network number of net.
 
               net net mask mask
                      True if the IP address matches net with the specific netmask.  May be qualified with src or dst.  Note that this syntax is not valid  for  IPv6
                      net.
 
               net net/len
                      True if the IPv4/v6 address matches net a netmask len bits wide.  May be qualified with src or dst.
 
               dst port port
                      True  if the packet is ip/tcp, ip/udp, ip6/tcp or ip6/udp and has a destination port value of port.  The port can be a number or a name used in
                      /etc/services (see tcp(4P) and udp(4P)).  If a name is used, both the port number and protocol are checked.  If a number or ambiguous  name  is
                      used,  only  the  port  number is checked (e.g., dst port 513 will print both tcp/login traffic and udp/who traffic, and port domain will print
                      both tcp/domain and udp/domain traffic).
 
               src port port
                      True if the packet has a source port value of port.
 
               port port
                      True if either the source or destination port of the packet is port.  Any of the above port expressions can be prepended with the keywords, tcp
                      or udp, as in:
                           tcp src port port
                      which matches only tcp packets whose source port is port.
 
               Primitives may be combined using:
 
                      A parenthesized group of primitives and operators (parentheses are special to the Shell and must be escaped).
 
                      Negation (`!' or `not').
 
                      Concatenation (`&&' or `and').
 
                      Alternation (`||' or `or').
 
               Negation has highest precedence.  Alternation and concatenation have equal precedence and associate left to right.  Note that explicit and tokens, not
               juxtaposition, are now required for concatenation.
 
               If an identifier is given without a keyword, the most recent keyword is assumed.  For example,
                    not host vs and ace
               is short for
                    not host vs and host ace
               which should not be confused with
                    not ( host vs or ace )
 
               Expression arguments can be passed to ssldump as either a single argument or as multiple arguments, whichever is more convenient.  Generally,  if  the
               expression  contains  Shell metacharacters, it is easier to pass it as a single, quoted argument.  Multiple arguments are concatenated with spaces be‐
               fore being parsed.
 
## EXAMPLES
        To listen to traffic on interface le0 port 443
               ssldump -i le0 port 443
 
        To listen to traffic to the server romeo on port 443.
               ssldump -i le0 port 443 and host romeo
 
        To decrypt traffic to host romeo server.pem and the password foobar
               ssldump -Ad -k ~/server.pem -p foobar -i le0 host romeo
 
 OUTPUT FORMAT
        All output is printed to standard out.
 
        ssldump prints an indication of every new TCP connection using a line like the following
 
        New TCP connection #2: iromeo.rtfm.com(2302) <-> sr1.rtfm.com(4433)
 
        The host which send the first SYN is printed on the left and the host which responded is printed on the right. Ordinarily, this means  that  the  SSL  client
        will be printed on the left with the SSL server on the right. In this case we have a connection from iromeo.rtfm.com (port 2303) to sr1.rtfm.com (port 4433).
        To allow the user to disentangle traffic from different connections, each connection is numbered. This is connection 2.
 
        The printout of each SSL record begins with a record line. This line contains the connection and record number, a timestamp, and the record type, as  in  the
        following:
 
        2 3  0.2001 (0.0749)  S>C  Handshake      Certificate
 
        This  is  record  3 on connection 2. The first timestamp is the time since the beginning of the connection. The second is the time since the previous record.
        Both are in seconds.
 
        The next field in the record line is the direction that the record was going. C>S indicates records transmitted from  client  to  server  and  S>C  indicates
        records transmitted from server to client.  ssldump assumes that the host to transmit the first SYN is the SSL client (this is nearly always correct).
 
        The  next  field  is the record type, one of Handshake, IAlert, ChangeCipherSpec, or application_data. Finally, ssldump may print record-specific data on the
        rest of the line. For Handshake records, it prints the handshake message. Thus, this record is a Certificate message.
 
        ssldump chooses certain record types for further decoding. These are the ones that have proven to be most useful for debugging:
 
        ClientHello - version, offered cipher suites, session id
                             if provided)
        ServerHello - version, session_id, chosen cipher suite,
                       compression method
        Alert - type and level (if obtainable)
 
        Fuller decoding of the various records can be obtained by using the -A , -d , -k and -p flags.
 
 DECRYPTION
        ssldump can decrypt traffic between two hosts if the following two conditions are met:
               1. ssldump has the keys.
               2. Static RSA was used.
        In any other case, once encryption starts, ssldump will only be able to determine the record type. Consider the following section of a trace.
 
        1 5  0.4129 (0.1983)  C>S  Handshake      ClientKeyExchange
        1 6  0.4129 (0.0000)  C>S  ChangeCipherSpec
        1 7  0.4129 (0.0000)  C>S  Handshake
        1 8  0.5585 (0.1456)  S>C  ChangeCipherSpec
        1 9  0.6135 (0.0550)  S>C  Handshake
        1 10 2.3121 (1.6986)  C>S  application_data
        1 11 2.5336 (0.2214)  C>S  application_data
        1 12 2.5545 (0.0209)  S>C  application_data
        1 13 2.5592 (0.0046)  S>C  application_data
        1 14 2.5592 (0.0000)  S>C  Alert
 
        Note that the ClientKeyExchange message type is printed but the rest of the Handshake messages do not have types. These are the Finished  messages,  but  be‐
        cause  they are encrypted ssldump only knows that they are of type Handshake.  Similarly, had the Alert in record 14 happened during the handshake, it's type
        and level would have been printed. However, since it is encrypted we can only tell that it is an alert.
 
## BUGS
        Please send bug reports to ssldump@rtfm.com.
 
        The TCP reassembler is not perfect. No attempt is made to reassemble IP fragments and the 3-way handshake and close handshake are imperfectly implemented. In
        practice, this turns out not to be much of a problem.
 
        Support is provided for only for Ethernet and loopback interfaces because that's all that I have. If you have another kind of network you will need to modify
        pcap_cb in base/pcap-snoop.c. If you have direct experience with ssldump on other networks, please send me patches.
 
        ssldump doesn't implement session caching and therefore can't decrypt resumed sessions.
 
## SEE ALSO
        tcpdump(1)
 
## AUTHOR
        ssldump was written by Eric Rescorla <ekr@rtfm.com>.
 
                                                                           28 September 2001                                                               SSLDUMP(1)
