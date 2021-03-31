ipv6calc(8)                                                                          system administration                                                                          ipv6calc(8)

NAME
       ipv6calc - format and calculate IPv6/IPv4/MAC

SYNOPSIS
       ipv6calc [OPTIONS] [<input data>]

DESCRIPTION
       This program formats and calculates IPv6/IPv4/MAC addresses and can do many more tricky things, e.g. includes a pipe filter capability.

OPTIONS
       If no data is presented as command-line arguments, data is read from standard input.

       General options:

       [-d|--debug DEBUGVALUE]
              debug value (bitwise like) can also be set by IPV6CALC_DEBUG environment value

       [-v|--version [-v [-v]]]
              version information (2 optional detail levels)

       [-v|--version -h]
              explanation of feature tokens

       [-V|--verbose]
              be more verbose

       [-h|--help|-?]
              this online help

       External database options (depending on compiled-in suppport):

       [--db-ip2location-disable]
              IP2Location support disabled

       [--db-ip2location-dir DIRECTORY]
              IP2Location database directory (default: /usr/share/IP2Location)

       [--db-geoip-disable]
              GeoIP support disabled

       [--db-geoip-dir DIRECTORY]
              GeoIP database directory (default: /usr/share/GeoIP)

       Special options:

       [-q|--quiet]
              be more quiet (auto-enabled in pipe mode)

       [-f|--flush]
              flush each line in pipe mode

       Usage with new style options:

       [--in|-I INPUT-TYPE]
              specify input  type (default: autodetect)

       [--out|-O OUTPUT-TYPE]
              specify output type (sometimes: autodetect)

       [--action|-A ACTION]
              specify action (default: format conversion, sometimes: autodetect)

       [<format option> ...]
              specify format options

       <input data> [...]
              input data

              Available input  types:
                     [-m] -I|--in     -?|-h|--help

              Available output types:
                     [-m] -O|--out    -?|-h|--help

              Available action types:
                     [-m] -A|--action -?|-h|--help

        Other usage:

       --showinfo|-i [--machine_readable|-m]
              show information about input data

       --showinfo|-i --show_types
              show available types on '-m'

       Usage with shortcut options: <shortcut option> [<format option> ...] <input data>

       For more information and available format options use: <shortcut option> -?|-h|--help

       -r|--addr2ip6_int (-O revnibbles.int)

       -r|--addr_to_ip6int (-O revnibbles.int)

       -a|--addr2ip6_arpa (-O revnibbles.arpa)

       -a|--addr_to_ip6arpa (-O revnibbles.arpa)

       -b|--addr_to_bitstring (-O bitstring)

          --addr2compaddr (--printcompressed)

          --addr_to_compressed (--printcompressed)

          --addr2uncompaddr (--printuncompressed)

          --addr_to_uncompressed (--printuncompressed)

          --addr_to_base85 (-I ipv6addr -O base85)

          --base85_to_addr (-I base85 -O ipv6addr)

          --mac_to_eui64 (-I mac -O eui64)

          --addr2fulluncompaddr (--printfulluncompressed)

          --addr_to_fulluncompressed (--printfulluncompressed)

          --addr2if_inet6 (-I ipv6addr -O ifinet6)

          --addr_to_ifinet6 (-I ipv6addr -O ifinet6)

          --if_inet62addr (-I ifinet6 -O ipv6addr --printcompressed)

          --ifinet6_to_compressed (-I ifinet6 -O ipv6addr --printcompressed)

          --eui64_to_privacy (-I iid_token -O iid_token -A genprivacyiid)

          --ipv4_to_6to4addr (-I ipv4 -O ipv6addr -A conv6to4)

       See inline help or documentation for more.

REPORTING BUGS
       Report bugs to <ipv6calc@lists.deepspace6.net> or to the authors.
       Homepage: http://www.deepspace6.net/projects/ipv6calc.html

EXAMPLES
       To run this program the standard way type:

       ipv6calc --showinfo -i -m ::1

       ipv6calc --showinfo -m 127.0.0.1

       ipv6calc --showinfo --show_types

       ipv6calc --ipv4_to_6to4addr 127.0.0.1

       ipv6calc --addr_to_uncompressed ::1

       Usage of filters in pipe mode:
              cat <Apache-Logfile> | ipv6calc -E ipv6.db.cc=US,iid-random

COPYRIGHT
       GPLv2

AUTHORS
       Peter Bieringer <pb@bieringer.de>

Peter Bieringer <pb@bieringer.de>                                                            0.99.0                                                                                 ipv6calc(8)
