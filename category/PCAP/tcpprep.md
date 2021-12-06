tcpprep(1)                                                                             User Commands                                                                            tcpprep(1)

NAME
       tcpprep - Create a tcpreplay cache cache file from a pcap file.

SYNOPSIS
       tcpprep [-flags] [-flag [value]] [--option-name[[=| ]value]]

       All arguments must be options.

       tcpprep is a pcap(3) file pre-processor which creates a cache file which provides "rules" for tcprewrite(1) and tcpreplay(1) on how to process and send packets.

DESCRIPTION
       The  basic  operation  of  tcpreplay is to resend all packets from the input file(s) out a single file.  Tcpprep processes a pcap file and applies a set of user-specified rules to
       create a cache file which tells tcpreplay whether or not to send each packet and which interface the packet should be sent out of.

       For more details, please see the Tcpreplay Manual at: http://tcpreplay.appneta.com

OPTIONS
       -d number, --dbug=number
              Enable debugging output.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 5
              The default number for this option is:
                   0

              If configured with --enable-debug, then you can specify a verbosity level for debugging output.  Higher numbers increase verbosity.

       -a string, --auto=string
              Auto-split mode.  This option may appear up to 1 times.  This option must not appear in combination with any of the following options: cidr, port, regex, mac.

              Tcpprep will try to automatically determine the primary function of hosts based on the traffic captured and classify each host as client or server.  In order to do so, you
              must provide a hint to tcpprep as to how to search for clients and servers.  Valid hints are:

              bridge Bridge mode processes each packet to try to determine if the sender is a client or server.  Once all the packets are processed, the results are weighed according to
              the server/client ratio (--ratio) and systems are assigned an interface.  If tcpprep is unable to determine what role a system plays, tcpprep will abort.

              router Router mode works just like bridge mode, except that after weighing is done, systems which are undetermined are considered a server if they fall inside a network
              known to contain other servers.  Router has a greater chance of successfully splitting clients and servers but is not 100% foolproof.

              client Client mode works just like bridge mode, except that unclassified systems are treated as clients.  Client mode should always complete successfully.

              server Server mode works just like bridge mode, except that unclassified systems are treated as servers.  Server mode should always complete successfully.

              first First mode works by looking at the first time each IP is seen in the SRC and DST fields in the IP header.  If the host is first seen in the SRC field, it is a client
              and if it's first seen in the DST field, it is marked as a server.   This effectively replicates the processing of the tomahawk test tool.  First mode should always com‐
              plete successfully.

       -c string, --cidr=string
              CIDR-split mode.  This option may appear up to 1 times.  This option must not appear in combination with any of the following options: auto, port, regex, mac.

              Specify a comma delimited list of CIDR netblocks to match against the source IP of each packet.  Packets matching any of the CIDR's are classified as servers.

              IPv4 Example:
                  --cidr=192.168.0.0/16,172.16.0.0/12,10.0.0.0/8
              IPv6 Example:
                  --cidr=[::ffff:0:0/96],[fe80::/16]

       -r string, --regex=string
              Regex-split mode.  This option may appear up to 1 times.  This option must not appear in combination with any of the following options: auto, port, cidr, mac.

              Specify a regular expression to match against the source IP of each packet.  Packets matching the regex are classified as servers.

       -p, --port
              Port-split mode.  This option may appear up to 1 times.  This option must not appear in combination with any of the following options: auto, regex, cidr, mac.

              Specifies that TCP and UDP traffic over IPv4 and IPv6 should be classified as client or server based upon the destination port of the header.

       -e string, --mac=string
              Source MAC split mode.  This option may appear up to 1 times.  This option must not appear in combination with any of the following options: auto, regex, cidr, port.

              Specify a list of MAC addresses to match against the source MAC of each packet.  Packets matching one of the values are classified as servers.

       --reverse
              Matches to be client instead of server.  This option may appear up to 1 times.

              Normally the --mac, --regex and --cidr flags specify are used to specify the servers and non-IP packets are classified as clients.  By using --reverse, these features are
              reversed so that the flags specify clients and non-IP packets are classified as servers.

       -C string, --comment=string
              Embedded cache file comment.  This option may appear up to 1 times.

              Specify a comment to be imbedded within the output cache file and later viewed.

       --no-arg-comment
              Do not embed any cache file comment.  This option may appear up to 1 times.

              By default, tcpprep includes the arguments passed on the command line in the cache file comment (in addition to any user specified --comment).  If for some reason you do
              not wish to include this, specify this option.

       -x string, --include=string
              Include only packets matching rule.  This option may appear up to 1 times.  This option must not appear in combination with any of the following options: exclude.

              Override default of processing all packets stored in the capture file and only send/edit packets which match the provided rule.  Rules can be one of:

              S:<CIDR1>,...  - Source IP must match specified IPv4/v6 CIDR(s)

              D:<CIDR1>,...  - Destination IP must match specified IPv4/v6 CIDR(s)

              B:<CIDR1>,...  - Both source and destination IP must match specified IPv4/v6 CIDR(s)

              E:<CIDR1>,...  - Either IP must match specified IPv4/v6 CIDR(s)

              P:<LIST> - Must be one of the listed packets where the list corresponds to the packet number in the capture file.
                  -x P:1-5,9,15,72-
              would process packets 1 through 5, the 9th and 15th packet, and packets 72 until the end of the file

              F:'<bpf>' - BPF filter.  See the tcpdump(8) man page for syntax.

       -X string, --exclude=string
              Exclude any packet matching this rule.  This option may appear up to 1 times.  This option must not appear in combination with any of the following options: include.

              Override default of processing all packets stored in the capture file and only send/edit packets which do NOT match the provided rule.  Rules can be one of:

              S:<CIDR1>,...  - Source IP must not match specified IPv4/v6 CIDR(s)

              D:<CIDR1>,...  - Destination IP must not match specified IPv4/v6 CIDR(s)

              B:<CIDR1>,...  - Both source and destination IP must not match specified IPv4/v6 CIDR(s)

              E:<CIDR1>,...  - Either IP must not match specified IPv4/v6 CIDR(s)

              P:<LIST> - Must not be one of the listed packets where the list corresponds to the packet number in the capture file.
                  -x P:1-5,9,15,72-
              would skip packets 1 through 5, the 9th and 15th packet, and packets 72 until the end of the file

       -o string, --cachefile=string
              Output cache file.  This option may appear up to 1 times.

       -i string, --pcap=string
              Input pcap file to process.  This option may appear up to 1 times.

       -P string, --print-comment=string
              Print embedded comment in the specified cache file.  This option may appear up to 1 times.

       -I string, --print-info=string
              Print basic info from the specified cache file.  This option may appear up to 1 times.

       -S string, --print-stats=string
              Print statistical information about the specified cache file.  This option may appear up to 1 times.

       -s string, --services=string
              Load services file for server ports.  This option may appear up to 1 times.  This option must appear in combination with the following options: port.

              Uses a list of ports used by servers in the same format as of /etc/services: <service_name>        <port>/<protocol> # comment

              Example: http            80/tcp

       -N, --nonip
              Send non-IP traffic out server interface.  This option may appear up to 1 times.

              By default, non-IP traffic which can not be classified as client or server is classified as "client".  Specifying --nonip will reclassify non-IP traffic as "server".  Note
              that the meaning of this flag is reversed if --reverse is used.

       -R string, --ratio=string
              Ratio of client to server packets.  This option may appear up to 1 times.  This option must appear in combination with the following options: auto.  The default string for
              this option is:
                   2.0

              Since a given host may have both client and server traffic being sent to/from it, tcpprep uses a ratio to weigh these packets.  If you would like to override the default of
              2:1 server to client packets required for a host to be classified as a server, specify it as a floating point value.

       -m number, --minmask=number
              Minimum network mask length in auto mode.  This option may appear up to 1 times.  This option must appear in combination with the following options: auto.  This option
              takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 32
              The default number for this option is:
                   30

              By default, auto modes use a minimum network mask length of 30 bits to build networks containing clients and servers.  This allows you to override this value.  Larger val‐
              ues will increase performance but may provide inaccurate results.

       -M number, --maxmask=number
              Maximum network mask length in auto mode.  This option may appear up to 1 times.  This option must appear in combination with the following options: auto.  This option
              takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 32
              The default number for this option is:
                   8

              By default, auto modes use a maximum network mask length of 8 bits to build networks containing clients and servers.  This allows you to override this value.  Larger values
              will decrease performance and accuracy but will provide greater chance of success.

       -v, --verbose
              Print decoded packets via tcpdump to STDOUT.  This option may appear up to 1 times.

       -A string, --decode=string
              Arguments passed to tcpdump decoder.  This option may appear up to 1 times.  This option must appear in combination with the following options: verbose.

              When enabling verbose mode (-v) you may also specify one or more additional arguments to pass to tcpdump to modify the way packets are decoded.  By default, -n and -l are
              used.  Be sure to quote the arguments so that they are not interpreted by tcprewrite.  The following arguments are valid:
                  [ -aAeNqRStuvxX ]
                  [ -E spi@ipaddr algo:secret,... ]
                  [ -s snaplen ]

       -V, --version
              Print version information.

       -h, --less-help
              Display less usage information and exit.

              This option has not been fully documented.

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
       tory.  In that case, the file ".tcppreprc" is searched for within that directory.

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
       This manual page was AutoGen-erated from the tcpprep option definitions.

tcpprep                                                                                 01 May 2021                                                                             tcpprep(1)
