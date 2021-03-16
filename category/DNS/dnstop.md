DNSTOP(8)                                                            BSD System Manager's Manual                                                           DNSTOP(8)

NAME
     dnstop — displays various tables of DNS traffic on your network

SYNOPSIS
     dnstop [-46apsQR] [-b expression] [-i address] [-f filter] [-r interval] [device] [savefile]

DESCRIPTION
     dnstop is a small tool to listen on device or to parse the file savefile and collect and print statistics on the local network's DNS traffic. You must have
     read access to /dev/bpf*.

COMMAND LINE OPTIONS
     The options are as follows:

     -4      count only messages with IPv4 addresses

     -6      count only messages with IPv6 addresses

     -Q      count only DNS query messages

     -R      count only DNS reply messages

     -a      anonymize addresses

     -b expression
             BPF filter expression
             (default: udp port 53)

     -i address
             ignore select addresses

     -p      Do not put the interface into promiscuous mode.

     -r      Redraw interval (seconds).

     -l level
             keep counts on names up to level domain name levels.

             For example, with -l 2 (the default), dnstop will keep two tables: one with top-level domain names, and another with second-level domain names.  In‐
             creasing the level provides more details, but also requires more memory and CPU.

     -f      input filter name

             The "unknown-tlds" filter includes only queries for TLDs that are bogus.  Useful for identifying hosts/servers that leak queries for things like "lo‐
             calhost" or "workgroup."

             The "A-for-A" filter includes only A queries for names that are already IP addresses.  Certain Microsoft Windows DNS servers have a known bug that for‐
             ward these queries.

             The "rfc1918-ptr" filter includes only PTR queries for addresses in RFC1918 space.  These should never leak from inside an organization.

             The "refused" filter, when used with the -R option, tells dnstop to count only replies with rcode REFUSED.

             The "qtype-any" filter tells dnstop to count only message of type ANY.

     -n name
             Only count messages within the domain name

     -P      Print "progress" messages on stderr when in non-interactive mode.

     -B buckets
             Use buckets hash table buckets.

     -X      Do not tabulate the sources + query name counters.  This can significantly reduce memory usage on busy servers and large savefiles.

     savefile
             a captured network trace in pcap format

     device  ethernet device (ie fxp0)

RUN TIME OPTIONS
     While running, the following options are available to alter the display:

     s       display the source address table

     d       display the destination address table

     t       display the breakdown of query types seen

     r       display the breakdown of response codes seen

     o       display the breakdown of opcodes seen

     1       show 1st level query names

     2       show 2nd level query names

     3       show 3rd level query names

     4       show 4th level query names

     5       show 5th level query names

     6       show 6th level query names

     7       show 7th level query names

     8       show 8th level query names

     9       show 9th level query names

     !       show sources + 1st level query names

     @       show sources + 2nd level query names

     #       show sources + 3rd level query names

     $       show sources + 4th level query names

     %       show sources + 5th level query names

     ^       show sources + 6th level query names

     &       show sources + 7th level query names

     *       show sources + 8th level query names

     (       show sources + 9th level query names

     ^R      reset the counters

     ^X      exit the program

     space   redraw

     ?       help

NON-INTERACTIVE MODE
     If stdout is not a tty, dnstop runs in non-interactive mode.  In this case, you must supply a savefile for reading, instead of capturing live packets.  After
     reading the entire savefile, dnstop prints the top 50 entries for each table.

HOW MESSAGES ARE COUNTED
     By default dnstop examines only query messages and ignores replies.  In this case the response code table is meaningless and will likely show 100% "Noerror."

     If you supply (only) the -R command line option, dnstop examines replies and ignores queries.  This allows you to see meaningful response code values, as well
     as all the other tables.  In this case all the query attributes (such as type and name) are taken from the Question section of the reply.

     Note, however, that it is common for a stream of DNS messages to contain more queries than replies.  This could happen, for example, if the server is too busy
     to respond to every single query, or if the server is designed to ignore malformed query messages.  Therefore, you might want to examine both queries and
     replies by giving both -R and -Q command line options.  In this case, only the response code counts are taken from the replies and all other attributes are
     taken from the queries.

AUTHORS
     Duane Wessels (wessels@measurement-factory.com)
     Mark Foster (mark@foster.cc)
     Jose Nazario (jose@monkey.org)
     Sam Norris <@ChangeIP.com>
     Max Horn <@quendi.de>
     John Morrissey <jwm@horde.net>
     Florian Forster <octo@verplant.org>
     Dave Plonka <plonka@cs.wisc.edu>
     http://dnstop.measurement-factory.com/

BUGS
     Does not support TCP at this time.

BSD                                                                        21 March, 2008                                                                        BSD
