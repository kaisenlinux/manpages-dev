sslsplit(1)                                                                                 SSLsplit                                                                                sslsplit(1)

NAME
       sslsplit -- transparent SSL/TLS interception

SYNOPSIS
       sslsplit [-kCKqwWOPZdDgGsrRxeumjplLSFXYyTIMiab] -c pem proxyspecs [...]
       sslsplit [-kCKqwWOPZdDgGsrRxeumjplLSFXYyTIMiab] -c pem -t dir proxyspecs [...]
       sslsplit [-OPZwWdDgGsrRxeumjplLSFXYyTIMiab] -t dir proxyspecs [...]
       sslsplit [-kCKwWOPZdDgGsrRxeumjplLSFXYyTIMi] -f conffile
       sslsplit -E
       sslsplit -V
       sslsplit -h

DESCRIPTION
       SSLsplit  is  a  tool for man-in-the-middle attacks against SSL/TLS encrypted network connections.  It is intended to be useful for network forensics, application security analysis and
       penetration testing.

       SSLsplit is designed to transparently terminate connections that are redirected to it using a network address translation engine.  SSLsplit then terminates SSL/TLS and initiates a  new
       SSL/TLS  connection  to  the  original  destination  address, while logging all data transmitted.  Besides NAT based operation, SSLsplit also supports static destinations and using the
       server name indicated by SNI as upstream destination.  SSLsplit is purely a transparent proxy and cannot act as a HTTP or SOCKS proxy configured in a  browser.   See  NAT  ENGINES  and
       PROXY SPECIFICATIONS below for specifics on the different modes of operation.

       SSLsplit  supports  plain  TCP,  plain SSL, HTTP and HTTPS connections over both IPv4 and IPv6.  It also has the ability to dynamically upgrade plain TCP to SSL in order to generically
       support SMTP STARTTLS and similar upgrade mechanisms.  SSLsplit fully supports Server Name Indication (SNI) and is able to work with RSA, DSA and ECDSA keys and DHE  and  ECDHE  cipher
       suites.  Depending on the version of OpenSSL, SSLsplit supports SSL 3.0, TLS 1.0, TLS 1.1 and TLS 1.2, and optionally SSL 2.0 as well.

       For  SSL and HTTPS connections, SSLsplit generates and signs forged X509v3 certificates on-the-fly, mimicking the original server certificate's subject DN, subjectAltName extension and
       other characteristics.  SSLsplit has the ability to use existing certificates of which the private key is available, instead of generating forged ones.  SSLsplit  supports  NULL-prefix
       CN certificates but otherwise does not implement exploits against specific certificate verification vulnerabilities in SSL/TLS stacks.

       SSLsplit  implements  a  number of defences against mechanisms which would normally prevent MitM attacks or make them more difficult.  SSLsplit can deny OCSP requests in a generic way.
       For HTTP and HTTPS connections, SSLsplit mangles headers to prevent server-instructed public key pinning (HPKP), avoid strict transport security restrictions (HSTS), avoid  Certificate
       Transparency  enforcement  (Expect-CT) and prevent switching to QUIC/SPDY, HTTP/2 or WebSockets (Upgrade, Alternate Protocols).  HTTP compression, encodings and keep-alive are disabled
       to make the logs more readable.

       Logging options include traditional SSLsplit connect and content log files as well as PCAP files and mirroring decrypted traffic to a network  interface.   Additionally,  certificates,
       master secrets and local process information can be logged.

       In  order  to  maximize  the chances that a connection can be successfully split, SSLsplit does not verify upstream server certificates by default.  Instead, all certificates including
       self-signed are accepted and if the expected hostname signalled in SNI is missing from the server certificate, it will be added to dynamically forged certificates.

       SSLsplit does not automagically redirect any network traffic.  To actually implement an attack, you also need to redirect the traffic to the system running sslsplit.  Your options  in‐
       clude running sslsplit on a legitimate router, ARP spoofing, ND spoofing, DNS poisoning, deploying a rogue access point (e.g. using hostap mode), physical recabling, malicious VLAN re‐
       configuration or route injection, /etc/hosts modification and so on.

OPTIONS
       -a pemfile
              Use client certificate from pemfile when destination server requests a client certificate.  -A pemfile Use private key, certificate and certificate chain from PEM  file  pemfile
              as  leaf  certificate  instead of generating a leaf certificate on the fly.  The PEM file must contain a single private key, a single certificate and optionally intermediate and
              root CA certificates to use as certificate chain.  When using -t, SSLsplit will first attempt to use a matching certificate loaded from certdir.  If -t is also used and  a  con‐
              nection  matches  any certificate in the directory specified with the -t option, that matching certificate is used instead, taking precedence over the certificate specified with
              -A.

       -b pemfile
              Use client private key from pemfile when destination server requests a client certificate.

       -c pemfile
              Use CA certificate from pemfile to sign certificates forged on-the-fly.  If pemfile also contains the matching CA private key, it is also loaded, otherwise it must  be  provided
              with  -k.  If pemfile also contains Diffie-Hellman group parameters, they are also loaded, otherwise they can be provided with -g.  If -t is also given, SSLsplit will only forge
              a certificate if there is no matching certificate in the provided certificate directory.

       -C pemfile
              Use CA certificates from pemfile as extra certificates in the certificate chain.  This is needed if the CA given with -k and -c is a sub-CA, in which case  any  intermediate  CA
              certificates and the root CA certificate must be included in the certificate chain.

       -d     Detach from TTY and run as a daemon, logging error messages to syslog instead of standard error.

       -D     Run in debug mode, log lots of debugging information to standard error.  This also forces foreground mode and cannot be used with -d.

       -e engine
              Use  engine  as the default NAT engine for proxyspecs without explicit NAT engine, static destination address or SNI mode.  engine can be any of the NAT engines supported by the
              system, as returned by -E.

       -E     List all supported NAT engines available on the system and exit.  See NAT ENGINES for a list of NAT engines currently supported by SSLsplit.

       -f conffile
              Read configuration from conffile.

       -F logspec
              Log connection content to separate log files with the given path specification (see LOG SPECIFICATIONS below).  For each connection, a log file will be written, which will  con‐
              tain both directions of data as transmitted.  Information about the connection will be contained in the filename only.  Only one of -F, -L and -S may be used (last one wins).

       -g pemfile
              Use  Diffie-Hellman group parameters from pemfile for Ephemereal Diffie-Hellman (EDH/DHE) cipher suites.  If -g is not given, SSLsplit first tries to load DH parameters from the
              PEM files given by -K, -k or -c.  If no DH parameters are found in the key files, built-in group parameters are automatically used.  The -g option is only available if  SSLsplit
              was built against a version of OpenSSL which supports Diffie-Hellman cipher suites.

       -G curve
              Use  the  named curve for Ephemereal Elliptic Curve Diffie-Hellman (ECDHE) cipher suites.  If -G is not given, a default curve (prime256v1) is used automatically.  The -G option
              is only available if SSLsplit was built against a version of OpenSSL which supports Elliptic Curve Diffie-Hellman cipher suites.

       -h     Display help on usage and exit.

       -i     For each connection, find the local process owning the connection.  This makes process information such as pid, owner:group and executable path for  connections  originating  on
              the same system as SSLsplit available to the connect log and enables the respective -F path specification directives.  -i is available on Mac OS X and FreeBSD; support for other
              platforms has not been implemented yet.

       -I if  Mirror connection content as emulated packets to interface if with destination address given by -T.  This option is not available if SSLsplit was built  without  mirroring  sup‐
              port.

       -j jaildir
              Change the root directory to jaildir using chroot(2) after opening files.  Note that this has implications for sni proxyspecs.  Depending on your operating system, you will need
              to copy files such as /etc/resolv.conf to jaildir in order for name resolution to work.  Using sni proxyspecs depends on name resolution.  Some operating systems require special
              device nodes such as /dev/null to be present within the jail.  Check your system's documentation for details.

       -k pemfile
              Use  CA  private key from pemfile to sign certificates forged on-the-fly.  If pemfile also contains the matching CA certificate, it is also loaded, otherwise it must be provided
              with -c.  If pemfile also contains Diffie-Hellman group parameters, they are also loaded, otherwise they can be provided with -g.  If -t is also given, SSLsplit will only  forge
              a certificate if there is no matching certificate in the provided certificate directory.

       -K pemfile
              Use private key from pemfile for the leaf certificates forged on-the-fly.  If -K is not given, SSLsplit will generate a random 2048 bit RSA key.

       -l logfile
              Log  connections to logfile in a single line per connection format, including addresses and ports and some HTTP and SSL information, if available.  SIGUSR1 will cause logfile to
              be re-opened.

       -L logfile
              Log connection content to logfile.  The content log will contain a parsable log format with transmitted data, prepended with headers identifying  the  connection  and  the  data
              length of each logged segment.  SIGUSR1 will cause logfile to be re-opened.  Only one of -F, -L and -S may be used (last one wins).

       -m     When dropping privileges using -u, override the target primary group to be set to group.

       -M logfile
              Log  master  keys  to  logfile in SSLKEYLOGFILE format as defined by Mozilla.  Logging master keys in this format allows for decryption of SSL/TLS traffic using Wireshark.  Note
              that unlike browsers implementing this feature, setting the SSLKEYLOGFILE environment variable has no effect on SSLsplit.  SIGUSR1 will cause logfile to be re-opened.

       -O     Deny all Online Certificate Status Protocol (OCSP) requests on all proxyspecs and for all OCSP servers with an OCSP response of tryLater, causing OCSP clients to temporarily ac‐
              cept  even  revoked  certificates.   HTTP requests are being treated as OCSP requests if the method is GET and the URI contains a syntactically valid OCSPRequest ASN.1 structure
              parsable by OpenSSL, or if the method is POST and the Content-Type is application/ocsp-request.  For this to be effective, SSLsplit must be handling traffic destined to the port
              used  by  the OCSP server.  In particular, SSLsplit must be configured to receive traffic to all ports used by OCSP servers of targeted certificates within the certdir specified
              by -t.

       -p pidfile
              Write the process ID to pidfile and refuse to run if the pidfile is already in use by another process.

       -P     Passthrough SSL/TLS connections which cannot be split instead of dropping them.  Connections cannot be split if -c and -k are not given and the site does not match any  certifi‐
              cate  loaded  using -t, or if the connection to the original server gives SSL/TLS errors.  Specifically, this happens if the site requests a client certificate.  In these situa‐
              tions, passthrough with -P results in uninterrupted service for the clients, while dropping is the  more  secure  alternative  if  unmonitored  connections  must  be  prevented.
              Passthrough  mode  currently does not apply to SSL/TLS errors in the connection from the client, since the connection from the client cannot easily be retried.  Specifically, -P
              does not currently work for clients that do not accept forged certificates.

       -q crlurl
              Set CRL distribution point (CDP) crlurl on forged leaf certificates.  Some clients, such as some .NET applications, reject certificates that do not carry a CDP.  When using  -q,
              you will need to generate an empty CRL signed by the CA certificate and key provided with -c and -k, and make it available at crlurl.

       -r proto
              Force  SSL/TLS  protocol version on both client and server side to proto by selecting the respective OpenSSL method constructor instead of the default SSLv23_method() which sup‐
              ports all protocol versions.  This is useful when analyzing traffic to a server that only supports a specific version of SSL/TLS and does not implement proper protocol  negotia‐
              tion.   Depending  on  build options and the version of OpenSSL that is used, the following values for proto are accepted: ssl2, ssl3, tls10, tls11 and tls12.  Note that SSL 2.0
              support is not built in by default because some servers don't handle SSL 2.0 Client Hello messages gracefully.

       -R proto
              Disable the SSL/TLS protocol version proto on both client and server side by disabling the respective protocols in OpenSSL.  To disable multiple protocol  versions,  -R  can  be
              given  multiple  times.   If  -r  is also given, there will be no effect in disabling other protocol versions.  Disabling protocol versions is useful when analyzing traffic to a
              server that does not handle some protocol versions well, or to test behaviour with different protocol versions.  Depending on build options and the version of  OpenSSL  that  is
              used,  the  following  values for proto are accepted: ssl2, ssl3, tls10, tls11 and tls12.  Note that SSL 2.0 support is not built in by default because some servers don't handle
              SSL 2.0 Client Hello messages gracefully.

       -s ciphers
              Use OpenSSL ciphers specification for both server and client SSL/TLS connections.  If -s is not given, a cipher list of ALL:-aNULL is used.   Normally,  SSL/TLS  implementations
              choose  the  most  secure  cipher suites, not the fastest ones.  By specifying an appropriate OpenSSL cipher list, the set of cipher suites can be limited to fast algorithms, or
              eNULL cipher suites can be added.  Note that for connections to be successful, the SSLsplit cipher suites must include at least one cipher suite supported by both the client and
              the server of each connection.  See ciphers(1) for details on how to construct OpenSSL cipher lists.

       -S logdir
              Log connection content to separate log files under logdir.  For each connection, a log file will be written, which will contain both directions of data as transmitted.  Informa‐
              tion about the connection will be contained in the filename only.  Only one of -F, -L and -S may be used (last one wins).

       -t certdir
              Use private key, certificate and certificate chain from PEM files in certdir for connections to hostnames matching the respective certificates,  instead  of  using  certificates
              forged  on-the-fly.   A single PEM file must contain a single private key, a single certificate and optionally intermediate and root CA certificates to use as certificate chain.
              When using -t, SSLsplit will first attempt to use a matching certificate loaded from certdir.  If -A is also given, when there is no match in certdir, the default key,  certifi‐
              cate  and  certificate  chain from the PEM file specified with the -A option is used instead.  Otherwise, if -c and -k are also given, certificates will be forged on-the-fly for
              sites matching none of the common names in the certificates loaded from certdir.  Otherwise, connections matching no certificate will be dropped,  or  if  -P  is  given,  passed
              through without splitting SSL/TLS.

       -T addr
              Mirror  connection content as emulated packets to destination address addr on the interface given by -I.  Only IPv4 target addresses are currently supported.  This option is not
              available if SSLsplit was built without mirroring support.

       -u user
              Drop privileges after opening sockets and files by setting the real, effective and stored user IDs to user and loading the appropriate primary and ancillary groups.   If  -u  is
              not given, SSLsplit will drop privileges to the stored UID if EUID != UID (setuid bit scenario), or to nobody if running with full root privileges (EUID == UID == 0).  User user
              needs to be allowed to make outbound TCP connections, and in some configurations, to also perform DNS resolution.  Dropping privileges enables privilege separation, which incurs
              latency for certain options, such as separate per-connection log files.  By using -u root, SSLsplit can be run as root without dropping privileges.  Due to an Apple bug, -u can‐
              not be used with pf proxyspecs on Mac OS X.

       -x engine
              Use the OpenSSL engine with identifier engine as a default engine.  The engine must be available within the OpenSSL ecosystem under the specified identifier, that is, they  must
              be  loaded  from the global OpenSSL configuration.  If engine is an absolute path, it will be interpreted as path to an engine dynamically linked library and loaded by path, re‐
              gardless of global OpenSSL configuration.  This option is only available if built against a version of OpenSSL with engine support.

       -X pcapfile
              Log connection content to pcapfile in PCAP format, with emulated TCP, IP and Ethernet headers.  SIGUSR1 will cause pcapfile to be re-opened.  Only one of -X, -Y and  -y  may  be
              used (last one wins).

       -Y pcapdir
              Log connection content to separate PCAP files under pcapdir.  For each connection, a separate PCAP file will be written.  Only one of -X, -Y and -y may be used (last one wins).

       -y pcapspec
              Log connection content to separate PCAP files with the given path specification (see LOG SPECIFICATIONS below).  For each connection, a separate PCAP file will be written.  Only
              one of -X, -Y and -y may be used (last one wins).

       -V     Display version and compiled features information and exit.

       -w gendir
              Write generated keys and certificates to individual files in gendir.  For keys, the key identifier is used as filename, which consists of the SHA-1 hash of the ASN.1 bit  string
              of  the public key, as referenced by the subjectKeyIdentifier extension in certificates.  For certificates, the SHA-1 fingerprints of the original and the used (forged) certifi‐
              cate are combined to form the filename.  Note that only newly generated certificates are written to disk.

       -W gendir
              Same as -w, but also write original certificates and certificates not newly generated, such as those loaded from -t.

       -Z     Disable SSL/TLS compression on all connections.  This is useful if your limiting factor is CPU, not network bandwidth.  The -Z option is only available  if  SSLsplit  was  built
              against a version of OpenSSL which supports disabling compression.

PROXY SPECIFICATIONS
       Proxy specifications (proxyspecs) consist of the connection type, listen address and static forward address or address resolution mechanism (NAT engine, SNI DNS lookup):

       https listenaddr port [nat-engine|fwdaddr port|sni port]
       ssl   listenaddr port [nat-engine|fwdaddr port|sni port]
       http  listenaddr port [nat-engine|fwdaddr port]
       tcp   listenaddr port [nat-engine|fwdaddr port]
       autossl listenaddr port [nat-engine|fwdaddr port]

       https  SSL/TLS  interception with HTTP protocol decoding, including the removal of HPKP, HSTS, Upgrade and Alternate Protocol response headers.  This mode currently suppresses WebSock‐
              ets and HTTP/2.

       ssl    SSL/TLS interception without any lower level protocol decoding; decrypted connection content is treated as opaque stream of bytes and not modified.

       http   Plain TCP connection without SSL/TLS, with HTTP protocol decoding, including the removal of HPKP, HSTS, Upgrade and Alternate Protocol response  headers.   This  mode  currently
              suppresses WebSockets and HTTP/2.

       tcp    Plain TCP connection without SSL/TLS and without any lower level protocol decoding; decrypted connection content is treated as opaque stream of bytes and not modified.

       autossl
              Plain  TCP  connection  until  a  Client Hello SSL/TLS message appears in the byte stream, then automatic upgrade to SSL/TLS interception.  This is generic, protocol-independent
              STARTTLS support, that may erroneously trigger on byte sequences that look like Client Hello messages even though there was no actual STARTTLS command issued.

       listenaddr port
              IPv4 or IPv6 address and port or service name to listen on.  This is the address and port where the NAT engine should redirect connections to.

       nat-engine
              NAT engine to query for determining the original destination address and port of transparently redirected connections.  If no engine is given, the default engine is used, unless
              overridden  with -e.  When using a NAT engine, sslsplit needs to run on the same system as the NAT rules redirecting the traffic to sslsplit.  See NAT ENGINES for a list of sup‐
              ported NAT engines.

       fwdaddr port
              Static destination address, IPv4 or IPv6, with port or service name.  When this is used, connections are forwarded to the given server address and port.  If fwdaddr is  a  host‐
              name, it will be resolved to an IP address.

       sni port
              Use  the  Server  Name Indication (SNI) hostname sent by the client in the Client Hello SSL/TLS message to determine the IP address of the server to connect to.  This only works
              for ssl and https proxyspecs and needs a port or service name as an argument.  Because this requires DNS lookups, it is preferable to use NAT engine lookups (see above),  except
              when  that  is  not possible, such as when there is no supported NAT engine or when running sslsplit on a different system than the NAT rules redirecting the actual connections.
              Note that when using -j with sni, you may need to prepare jaildir to make name resolution work from within the chroot directory.

LOG SPECIFICATIONS
       Log specifications are composed of zero or more printf-style directives; ordinary characters are included directly in the output path.  SSLsplit current supports the  following  direc‐
       tives:

       %T     The initial connection time as an ISO 8601 UTC timestamp.

       %d     The destination host and port, separated by a comma, IPv6 addresses using underscore instead of colon.

       %D     The destination host, IPv6 addresses using underscore instead of colon.

       %p     The destination port.

       %s     The source host and port, separated by a comma, IPv6 addresses using underscore instead of colon.

       %S     The source host, IPv6 addresses using underscore instead of colon.

       %q     The source port.

       %x     The name of the local process.  Requires -i to be used.  If process information is unavailable, this directive will be omitted from the output path.

       %X     The full path of the local process.  Requires -i to be used.  If process information is unavailable, this directive will be omitted from the output path.

       %u     The username or numeric uid of the local process.  Requires -i to be used.  If process information is unavailable, this directive will be omitted from the output path.

       %g     The group name or numeric gid of the local process.  Requires -i to be used.  If process information is unavailable, this directive will be omitted from the output path.

       %%     A literal '%' character.

NAT ENGINES
       SSLsplit currently supports the following NAT engines:

       pf     OpenBSD  packet  filter  (pf) rdr/rdr-to NAT redirects, also available on FreeBSD, NetBSD and Mac OS X.  Fully supported, including IPv6.  Note that SSLsplit needs permission to
              open /dev/pf for reading, which by default means that it needs to run under root privileges.  Assuming inbound interface em0, first in old (FreeBSD,  Mac  OS  X),  then  in  new
              (OpenBSD 4.7+) syntax:

              rdr pass on em0 proto tcp from 2001:db8::/64 to any port  80 \
                       ->       ::1 port 10080
              rdr pass on em0 proto tcp from 2001:db8::/64 to any port 443 \
                       ->       ::1 port 10443
              rdr pass on em0 proto tcp from  192.0.2.0/24 to any port  80 \
                       -> 127.0.0.1 port 10080
              rdr pass on em0 proto tcp from  192.0.2.0/24 to any port 443 \
                       -> 127.0.0.1 port 10443

              pass in quick on em0 proto tcp from 2001:db8::/64 to any \
                       port  80 rdr-to       ::1 port 10080
              pass in quick on em0 proto tcp from 2001:db8::/64 to any \
                       port 443 rdr-to       ::1 port 10443
              pass in quick on em0 proto tcp from  192.0.2.0/24 to any \
                       port  80 rdr-to 127.0.0.1 port 10080
              pass in quick on em0 proto tcp from  192.0.2.0/24 to any \
                       port 443 rdr-to 127.0.0.1 port 10443

       ipfw   FreeBSD  IP  firewall (IPFW) divert sockets, also available on Mac OS X.  Available on FreeBSD and OpenBSD using pf divert-to.  Fully supported on FreeBSD and OpenBSD, including
              IPv6.  Only supports IPv4 on Mac OS X due to the ancient version of IPFW included.  First in IPFW, then in pf divert-to syntax:

              ipfw add fwd       ::1,10080 tcp from 2001:db8::/64 to any  80
              ipfw add fwd       ::1,10443 tcp from 2001:db8::/64 to any 443
              ipfw add fwd 127.0.0.1,10080 tcp from 192.0.2.0/24  to any  80
              ipfw add fwd 127.0.0.1,10443 tcp from 192.0.2.0/24  to any 443

              pass in quick on em0 proto tcp from 2001:db8::/64 to any \
                       port  80 divert-to       ::1 port 10080
              pass in quick on em0 proto tcp from 2001:db8::/64 to any \
                       port 443 divert-to       ::1 port 10443
              pass in quick on em0 proto tcp from  192.0.2.0/24 to any \
                       port  80 divert-to 127.0.0.1 port 10080
              pass in quick on em0 proto tcp from  192.0.2.0/24 to any \
                       port 443 divert-to 127.0.0.1 port 10443

       ipfilter
              IPFilter (ipfilter, ipf), available on many systems, including FreeBSD, NetBSD, Linux and Solaris.  Note that SSLsplit needs permission to open /dev/ipnat for reading, which  by
              default means that it needs to run under root privileges.  Only supports IPv4 due to limitations in the SIOCGNATL ioctl(2) interface.  Assuming inbound interface bge0:

              rdr bge0 0.0.0.0/0 port  80 -> 127.0.0.1 port 10080
              rdr bge0 0.0.0.0/0 port 443 -> 127.0.0.1 port 10443

       netfilter
              Linux netfilter using the iptables REDIRECT target.  Fully supported including IPv6 since Linux v3.8-rc1; on older kernels only supports IPv4 due to limitations in the SO_ORIGI‐
              NAL_DST getsockopt(2) interface.

              iptables -t nat -A PREROUTING -s 192.0.2.0/24 \
                       -p tcp --dport  80 \
                       -j REDIRECT --to-ports 10080
              iptables -t nat -A PREROUTING -s 192.0.2.0/24 \
                       -p tcp --dport 443 \
                       -j REDIRECT --to-ports 10443
              # please contribute a tested ip6tables config

              Note that SSLsplit is only able to accept incoming connections if it binds to the correct IP address (e.g. 192.0.2.1) or on all interfaces (0.0.0.0).  REDIRECT  uses  the  local
              interface address of the incoming interface as target IP address, or 127.0.0.1 for locally generated packets.

       tproxy Linux netfilter using the iptables TPROXY target together with routing table magic to allow non-local traffic to originate on local sockets.  Fully supported, including IPv6.

              ip -f inet6 rule add fwmark 1 lookup 100
              ip -f inet6 route add local default dev lo table 100
              ip6tables -t mangle -N DIVERT
              ip6tables -t mangle -A DIVERT -j MARK --set-mark 1
              ip6tables -t mangle -A DIVERT -j ACCEPT
              ip6tables -t mangle -A PREROUTING -p tcp -m socket -j DIVERT
              ip6tables -t mangle -A PREROUTING -s 2001:db8::/64 \
                        -p tcp --dport 80 \
                        -j TPROXY --tproxy-mark 0x1/0x1 --on-port 10080
              ip6tables -t mangle -A PREROUTING -s 2001:db8::/64 \
                        -p tcp --dport 443 \
                        -j TPROXY --tproxy-mark 0x1/0x1 --on-port 10443
              ip -f inet rule add fwmark 1 lookup 100
              ip -f inet route add local default dev lo table 100
              iptables -t mangle -N DIVERT
              iptables -t mangle -A DIVERT -j MARK --set-mark 1
              iptables -t mangle -A DIVERT -j ACCEPT
              iptables -t mangle -A PREROUTING -p tcp -m socket -j DIVERT
              iptables -t mangle -A PREROUTING -s 192.0.2.0/24 \
                       -p tcp --dport 80 \
                       -j TPROXY --tproxy-mark 0x1/0x1 --on-port 10080
              iptables -t mangle -A PREROUTING -s 192.0.2.0/24 \
                       -p tcp --dport 443 \
                       -j TPROXY --tproxy-mark 0x1/0x1 --on-port 10443

              Note that return path filtering (rp_filter) also needs to be disabled on interfaces which handle TPROXY redirected traffic.

SIGNALS
       A  running  sslsplit  accepts  SIGINT  and  SIGTERM for a clean shutdown and SIGUSR1 to re-open the single-file log files (such as -l, -L and -X).  The canonical way to rotate or post-
       process logs is to rename the active log file, send SIGUSR1 to the PID in the PID file given by -p, give SSLsplit some time to flush buffers after closing the old file, and then  post-
       process the renamed log file.  Per-connection log files (such as -S and -F) are not re-opened because their filename is specific to the connection.

EXIT STATUS
       The  sslsplit process will exit with 0 on regular shutdown (SIGINT, SIGTERM), and 128 + signal number on controlled shutdown based on receiving a different signal such as SIGHUP.  Exit
       status in the range 1..127 indicates error conditions.

EXAMPLES
       Matching the above NAT engine configuration samples, intercept HTTP and HTTPS over IPv4 and IPv6 using forged certificates with CA private key ca.key and  certificate  ca.crt,  logging
       connections to connect.log and connection data into separate files under /tmp (add -e nat-engine to select the appropriate engine if multiple engines are available on your system):

       sslsplit -k ca.key -c ca.crt -l connect.log -S /tmp \
                https ::1 10443  https 127.0.0.1 10443 \
                http  ::1 10080  http  127.0.0.1 10080

       If  the Linux netfilter engine is used with the iptables REDIRECT target, it is important to listen to the correct IP address (e.g. 192.0.2.1) or on all interfaces (0.0.0.0), otherwise
       SSLsplit is not able to accept incoming connections.

       Intercepting IMAP/IMAPS using the same settings:

       sslsplit -k ca.key -c ca.crt -l connect.log -S /tmp \
                ssl ::1 10993  ssl 127.0.0.1 10993 \
                tcp ::1 10143  tcp 127.0.0.1 10143

       A more targeted setup, HTTPS only, using certificate/chain/key files from /path/to/cert.d and statically redirecting to www.example.org instead of querying a NAT engine:

       sslsplit -t /path/to/cert.d -l connect.log -S /tmp \
                https ::1       10443 www.example.org 443 \
                https 127.0.0.1 10443 www.example.org 443

       The original example, but using plain ssl and tcp proxyspecs to avoid header modifications, and logging to a single PCAP file for post-processing with an external tool.  To  facilitate
       log rotation via SIGUSR1, -p is also given, so external log rotation tools or scripts can read the PID from the PID file.

       sslsplit -k ca.key -c ca.crt -X log.pcap -p /var/run/sslsplit.pid \
                ssl ::1 10443  ssl 127.0.0.1 10443 \
                tcp ::1 10080  tcp 127.0.0.1 10080

       The  original  example, but using SSL options optimized for speed by disabling compression and selecting only fast cipher cipher suites and using a precomputed private key leaf.key for
       the forged certificates.  Most significant speed increase is gained by choosing fast algorithms and small keysizes for the CA and leaf private keys.  Check openssl speed for  algorithm
       performance on your system.  Note that clients may not support all algorithms and key sizes.  Also, some clients warn their users about cipher suites they consider weak.

       sslsplit -Z -s NULL:RC4:AES128:-DHE -K leaf.key \
                -k ca.key -c ca.crt -l connect.log -S /tmp \
                https ::1 10443  https 127.0.0.1 10443 \
                http  ::1 10080  http  127.0.0.1 10080

       The original example, but running as a daemon under user sslsplit and writing a PID file:

       sslsplit -d -p /var/run/sslsplit.pid -u sslsplit \
                -k ca.key -c ca.crt -l connect.log -S /tmp \
                https ::1 10443  https 127.0.0.1 10443 \
                http  ::1 10080  http  127.0.0.1 10080

       To generate a CA private key ca.key  and certificate ca.crt using OpenSSL:

       cat >x509v3ca.cnf <<'EOF'
       [ req ]
       distinguished_name = reqdn

       [ reqdn ]

       [ v3_ca ]
       basicConstraints        = CA:TRUE
       subjectKeyIdentifier    = hash
       authorityKeyIdentifier  = keyid:always,issuer:always
       EOF

       openssl genrsa -out ca.key 2048
       openssl req -new -nodes -x509 -sha256 -out ca.crt -key ca.key \
               -config x509v3ca.cnf -extensions v3_ca \
               -subj '/O=SSLsplit Root CA/CN=SSLsplit Root CA/' \
               -set_serial 0 -days 3650

NOTES
       SSLsplit  is  able to handle a relatively high number of listeners and connections due to a multithreaded, event based architecture based on libevent, taking advantage of platform spe‐
       cific select() replacements such as kqueue.  The main thread handles the listeners and signaling, while a number of worker threads equal to twice the number of CPU cores  is  used  for
       handling the actual connections in separate event bases, including the CPU-intensive SSL/TLS handling.

       Care  has  been taken to choose well-performing data structures for caching certificates and SSL sessions.  Logging is implemented in separate disk writer threads to ensure that socket
       event handling threads don't have to block on disk I/O.  DNS lookups are performed asynchronously.  SSLsplit uses SSL session caching on both ends to minimize the amount  of  full  SSL
       handshakes, but even then, the limiting factor in handling SSL connections are the actual bignum computations.

       For  high  performance and low latency and when running SSLsplit as root or otherwise in a privilege separation mode, avoid using options which require a privileged operation to be in‐
       voked through privilege separation for each connection.  These are currently all per-connection log types: content log to per-stream file in dir or filespec (-F, -S),  content  log  to
       per-stream PCAP in dir or filespec (-Y, -y), and generated or all certificates to files in directory (-w, -W).  Instead, use the respective single-file variants where available.  It is
       possible, albeit not recommended, to bypass the default privilege separation when run as root by using -u root, thereby bypassing privilege separation entirely.

SEE ALSO
       sslsplit.conf(5), openssl(1), ciphers(1), speed(1), pf(4), ipfw(8), iptables(8), ip6tables(8), ip(8), hostapd(8), arpspoof(8), parasite6(8), yersinia(8), https://www.roe.ch/SSLsplit

AUTHORS
       SSLsplit was written by Daniel Roethlisberger <daniel@roe.ch>.  SSLsplit is currently maintained by Daniel Roethlisberger and Soner Tari.

       The following individuals have contributed code or documentation, in chronological order of their first contribution: Steve Wills, Landon Fuller, Wayne Jensen, Rory McNamara, Alexander
       Neumann,  Adam  Jacob  Muller,  Richard  Poole,  Maciej  Kotowicz, Eun Soo Park, Christian Groschupp, Alexander Savchenkov, Soner Tari, Petr Vanek, Hilko Bengen, Philip Duldig, Levente
       Polyak, Nick French, Cihan Komecoglu and Sergey Pinaev.

       SSLsplit contains work sponsored by HackerOne.

BUGS
       Use Github for submission of bug reports or patches:

              https://github.com/droe/sslsplit

sslsplit 0.5.5                                                                             2019-11-13                                                                               sslsplit(1)
