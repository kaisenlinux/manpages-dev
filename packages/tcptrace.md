tcptrace(1)                                                                         General Commands Manual                                                                         tcptrace(1)

NAME
       tcptrace - a TCP connection analysis tool

SYNOPSIS
       tcptrace [options] filename

DESCRIPTION
       tcptrace takes a tcpdump file specified on the command line (or from standard input) and produces a summarization of the connections.

OPTIONS
       Output format options

       -b   brief output format

       -l   long output format

       -r   print rtt statistics (slower for large files)

       -W   report on estimated congestion window (not generally useful)

       -q   no output (if you just want modules output)

       Graphing options

       -T   create throughput graph[s], (average over 10 segments, see -A)

       -R   create rtt sample graph[s]

       -S   create time sequence graph[s]

       -N   create owin graph[s] (_o_utstanding data on _N_etwork)

       -F   create segsize graph[s]

       -G   create ALL graphs

       Output format detail options

       -D   print in decimal

       -X   print in hexadecimal

       -n   don't resolve host or service names (much faster)

       -s   use short names (list "picard.cs.ohiou.edu" as just "picard")

       Connection filtering options

       -iN  ignore connection N (can use multiple times)

       -oN[-M]
            only connection N (or N through M).  Arg can be used many times.  In N is a file rather than a number, read list from file instead.

       -c   ignore non-complete connections (didn't see syn's and fin's)

       -BN  first segment number to analyze (default 1)

       -EN  last segment number to analyze (default last in file)

       Graphing detail options

       -C   produce color plot[s]

       -M   produce monochrome (b/w) plot[s]

       -AN  Average N segments for throughput graphs, default is 10

       -z   zero axis options:

       -z   plot time axis from 0 rather than wall clock time (backward compat)

       -zx  plot time axis from 0 rather than wall clock time

       -zy  plot sequence numbers from 0 (time sequence graphs only)

       -zxy plot both axes from 0

       -y   omit the (yellow) instantaneous throughput points in tput graph

       Misc options

       -Z   dump raw rtt sample times to file[s]

       -p   print all packet contents (can be very long)

       -P   print packet contents for selected connections

       -t   ´tick' off the packet numbers as a progress indication

       -v   print version information and exit

       -w   print various warning messages

       -d   whistle while you work (enable debug, use -d -d for more output)

       -e   extract contents of each TCP stream into file

       -h   print help messages

       -u   print minimal UDP information too

       -Ofile
            dump matched packets to tcpdump file 'file'

       +[v] reverse the setting of the -[v] flag (for booleans)

       Extended boolean options (unambiguous prefixes also work)

       --showsacks
            show SACK blocks on time sequence graphs (default)

       --noshowsacks
            DON'T show SACK blocks on time sequence graphs

       --showrexmit
            mark retransmits on time sequence graphs (default)

       --noshowrexmit
            DON'T mark retransmits on time sequence graphs

       --showoutorder
            mark out-of-order on time sequence graphs (default)

       --noshowoutorder
            DON'T mark out-of-order on time sequence graphs

       --showzerowindow
            mark zero windows on time sequence graphs (default)

       --noshowzerowindow
            DON'T mark zero windows on time sequence graphs

       --showurg
            mark packets with URGENT bit set on the time sequence graphs (default)

       --noshowurg
            DON'T mark packets with URGENT bit set on the time sequence graphs

       --showrttdongles
            mark non-RTT-generating ACKs with special symbols

       --noshowrttdongles
            DON'T mark non-RTT-generating ACKs with special symbols (default)

       --showdupack3
            mark triple dupacks on time sequence graphs (default)

       --noshowdupack3
            DON'T mark triple dupacks on time sequence graphs

       --showzerolensegs
            show zero length packets on time sequence graphs (default)

       --noshowzerolensegs
            DON'T show zero length packets on time sequence graphs

       --showzwndprobes
            show zero window probe packets on time sequence graphs (default)

       --noshowzwndprobes
            DON'T show zero window probe packets on time sequence graphs

       --showtitle
            show title on the graphs (default)

       --noshowtitle
            DON'T show title on the graphs

       --res_addr
            resolve IP addresses into names (may be slow) (default)

       --nores_addr
            DON'T resolve IP addresses into names (may be slow)

       --res_port
            resolve port numbers into names (default)

       --nores_port
            DON'T resolve port numbers into names

       --checksum
            verify IP and TCP checksums

       --nochecksum
            DON'T verify IP and TCP checksums (default)

       --dupack3_data
            count a duplicate ACK carrying data as a triple dupack

       --nodupack3_data
            DON'T count a duplicate ACK carrying data as a triple dupack (default)

       --check_hwdups
            check for 'hardware' dups (default)

       --nocheck_hwdups
            DON'T check for 'hardware' dups

       --warn_ooo
            print warnings when packets timestamps are out of order

       --nowarn_ooo
            DON'T print warnings when packets timestamps are out of order (default)

       --warn_printtrunc
            print warnings when packets are too short to analyze

       --nowarn_printtrunc
            DON'T print warnings when packets are too short to analyze (default)

       --warn_printbadmbz
            print warnings when MustBeZero TCP fields are NOT 0

       --nowarn_printbadmbz
            DON'T print warnings when MustBeZero TCP fields are NOT 0 (default)

       --warn_printhwdups
            print warnings for hardware duplicates

       --nowarn_printhwdups
            DON'T print warnings for hardware duplicates (default)

       --warn_printbadcsum
            print warnings when packets with bad checksums

       --nowarn_printbadcsum
            DON'T print warnings when packets with bad checksums (default)

       --warn_printbad_syn_fin_seq
            print warnings when SYNs or FINs rexmitted with different sequence numbers

       --nowarn_printbad_syn_fin_seq
            DON'T print warnings when SYNs or FINs rexmitted with different sequence numbers (default)

       --dump_packet_data
            print all packets AND dump the TCP/UDP data

       --nodump_packet_data
            DON'T print all packets AND dump the TCP/UDP data (default)

       --continuous
            run continuously and don't provide a summary

       --nocontinuous
            DON'T run continuously and don't provide a summary (default)

       --print_seq_zero
            print sequence numbers as offset from initial sequence number

       --noprint_seq_zero
            DON'T print sequence numbers as offset from initial sequence number (default)

       --limit_conn_num
            limit the maximum number of connections kept at a time in real-time mode

       --nolimit_conn_num
            DON'T limit the maximum number of connections kept at a time in real-time mode (default)

       --xplot_all_files
            display all generated xplot files at the end

       --noxplot_all_files
            DON'T display all generated xplot files at the end (default)

       --ns_hdrs
            assume that ns has the useHeaders_flag true (uses IP+TCP headers) (default)

       --nons_hdrs
            DON'T assume that ns has the useHeaders_flag true (uses IP+TCP headers)

       --csv
            display the long output as comma separated values

       --nocsv
            DON'T display the long output as comma separated values (default)

       --tsv
            display the long output as tab separated values

       --notsv
            DON'T display the long output as tab separated values (default)

       Extended variable options (unambiguous prefixes also work)

       --output_dir=``STR''
            directory where all output files are placed (default: '<NULL>')

       --output_prefix=``STR''
            prefix all output files with this string (default: '<NULL>')

       --xplot_title_prefix=``STR''
            prefix to place in the titles of all xplot files (default: '<NULL>')

       --update_interval=``STR''
            time interval for updates in real-time mode (default: '<NULL>')

       --max_conn_num=``STR''
            maximum number of connections to keep at a time in real-time mode (default: '<NULL>')

       --remove_live_conn_interval=``STR''
            idle time after which an open connection is removed in real-time mode (default: '<NULL>')

       --remove_closed_conn_interval=``STR''
            time interval after which a closed connection is removed in real-time mode (default: '<NULL>')

       --xplot_args=``STR''
            arguments to pass to xplot, if we are calling xplot from here (default: '<NULL>')

       --sv=``STR''
            separator to use for long output with <STR>-separated-values (default: '<NULL>')

       Included Modules

         http             Http analysis package

         tcplib           TCPLib analysis package

         traffic          traffic analysis package

         slice            traffic efficiency data by time slices

         rttgraph         round trip time analysis graphs

         collie           connection summary package

         realtime         example real-time package

       For module-specific options, please use `tcptrace -hxargs`

       Filter Variables:

       Please use 'tcptrace -hfilter' for the complete listing of filter variables.

       Filter Syntax:

       Please use 'tcptrace -hfilter' for filter syntax.

ENVIRONMENT
       Options are first read from the file $HOME/.tcptracerc (if it exists), and then from the environment variable TCPTRACEOPTS (if it exists), and finally from the command line.

AUTHOR
       Shawn Ostermann (ostermann@cs.ohiou.edu)

CREDITS
       Thanks to Mark Foster (mafoster@george.arc.nasa.gov) for writing this manual page. Thanks to Avinash Lakhiani (alakhian@irg.cs.ohiou.edu) for updating it.

FILES
       Dump File Names
       Trailing (unrecognized) arguments are taken to be one or more filenames.  The files can be compressed, see compress.h for configuration.  If the dump file name is 'stdin', then we read
       from standard input rather than from a file.

SEE ALSO
       xplot   an interactive tool for examining .xpl files output by tcptrace.

       jPlot   a Java version of xplot.

                                                                                          14 Oct 2002                                                                               tcptrace(1)
