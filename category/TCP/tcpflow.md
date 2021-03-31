tcpflow(1)                                                                               tcpflow 1.5.1                                                                               tcpflow(1)

NAME
       tcpflow - TCP flow recorder

SYNOPSIS
       tcpflow [-aBcCDIpsZ] [-b max_bytes] [-d debug_level] [-[eE] scanner] [-f max_fds] [-F[ctTXMkmg]] [-h|--help] [-i iface] [-l file1.pcap file2.pcap...]  [-L semlock] [-m min_bytes]
       [-o outdir] [-r file1.pcap] [-R file0.pcap] [-S name=value] [-T[filename template]] [-U|--relinquish-privileges username] [-v|--verbose] [-V|--version] [-w file] [-x scanner]
       [-X file.xml] [-z|--chroot directory] [expression]

DESCRIPTION
       tcpflow is a program that captures data transmitted as part of TCP connections (flows), and stores the data in a way that is convenient for protocol analysis or debugging.  Rather than
       showing packet-by-packet information, tcpflow reconstructs the actual data streams and stores each flow in a separate file for later analysis.  tcpflow understands TCP sequence numbers
       and will correctly reconstruct data streams regardless of retransmissions or out-of-order delivery. tcpflow provides control over filenames for automatic binning of connections by pro‐
       tocol, IP address or connection number, and has a sophisticated plug-in system for decompressing compressed HTTP connections, undoing MIME encoding, or calling user-provided programs
       for post-processing.

       By default tcpflow stores all captured data in files that have names of the form:

            192.168.101.102.02345-010.011.012.013.45103

       ...where the contents of the above file would be data transmitted from host 192.168.101.102 port 2345, to host 10.11.12.13 port 45103.

       If you want to simply process a few hundred thousand packets and see what you have, try this:

            tcpflow -a -o outdir -Fk -r packets.pcap

       This will cause tcpflow to perform (-a) all processing, store the output in a directory called outdir, bin the output in directories of 1000 connections each, and read its input from
       the file packets.pcap. More sophisticated processing is possible, of course.

OPTIONS
       -a     Enable all processing. Same as -e all.

       -B     Force binary output even when printing to console with -C or -c.

       -b max_bytes
              Specifies the maximum size of a captured flow.  Any bytes beyond max_bytes from the first byte captured will be discarded.  The default is to store an unlimited number of bytes
              per flow. Note: before version 1.4, tcpflow could only store a maximum of 4GiB per flow.

       -c     Console print.  Print the contents of packets to stdout as they are received, without storing any captured data to files (implies -s).

       -C     Console print without the packet source and destination details being printed.  Print the contents of packets to stdout as they are received, without storing any captured data
              to files (implies -s).

       -D     Console output should be in hex.

       -d     Debug level.  Set the level of debugging messages printed to stderr to debug_level.  Higher numbers produce more messages.  -d 0 causes completely silent operation.  -d 1 , the
              default, produces minimal status messages.  -d 10 produces verbose output equivalent to -v .  Numbers higher than 10 can produce a large amount of debugging information useful
              only to developers.

       -E name
              Disable all scanners and then enable scanner name

       -e name
              Enable scanner name.

       -e all Enables all scanners. Same as -a

       -e http
              Perform HTTP post-processing ("After" processing). If the output file is

                   208.111.153.175.00080-192.168.001.064.37314,

              Then the post-processing will create the files:

                   208.111.153.175.00080-192.168.001.064.37314-HTTP
                   208.111.153.175.00080-192.168.001.064.37314-HTTPBODY

              If the HTTPBODY was compressed with GZIP, you may get a third file as well:

                   208.111.153.175.00080-192.168.001.064.37314-HTTPBODY-GZIP

              Additional information about these streams, such as their MD5 hash value, is also written to the DFXML report file.

       -e python -S py_path=path -S py_module=module -S py_function=foo
              Post-process TCP payload by an external python function.

              The python function must take a single string parameter.  The python function can return a string (else the function does must not return).  The returned string (if any) is
              written in the DFXML report file inside the XML tag <scan_python_result>...</scan_python_result>.  A sample python script is available within the tcpflow source code in direc‐
              tory python/plugins.

              Example:

                  tcpflow -r my.cap -e python -S py_path=python/plugins -S py_module=samplePlugin -S py_function=sampleFunction

       -F[format]
              Specifies format for output filenames.

              Format specifiers:

              c      Appends the connection counter to ALL filenames.

              t      Prepends each filename with a Unix timestamp (seconds since epoch).

              T      Prepends each filename with an ISO-8601 timestamp.

              X      Do not output any files (other than the DFXML report file).

       -FM    Include MD5 of each flow in the DFXML report file.

       -FX    Suppresses file output entirely, DFXML report file is still produced.

       -Fk    bin output in 1K directories

       -Fm    bin output in 1M directories (2 levels)

       -Fg    bin output in 1G directories (3 levels)

       -fmax_fds
              Max file descriptors used.  Limit the number of file descriptors used by tcpflow to max_fds.  Higher numbers use more system resources, but usually perform better.  If the un‐
              derlying operating system supports the setrlimit() system call, the OS will be asked to enforce the requested limit.  The default is for tcpflow to use the maximum number of
              file descriptors allowed by the OS.  The -v option will report how many file descriptors tcpflow is using.

       -g     Output flow information to console in multiple colors. (Blue for client to server flows, red for server to client flows, green for undecided flows.)  Note: This option was dif‐
              ferent from tcpflow 1.3 (-e) and 1.4.4 (-J).

       -h --help
              Help.  Print usage information and exit.

       -hh    More help.  Print more usage information and exit.

       -i iface
              Interface name.  Capture packets from the network interface named iface.  If no interface is specified with -i , a reasonable default will be used by libpcap automatically.

       -I     Store the reception timestamps (of TCP packets) in a companion file *.findx.  Therefore each flow will have two files: (1) the usual file containing payload bytes and (2) the
              text file containing the corresponding timestamps.  This last file *.findx has three columns using the pipe '|' as separator:

                  byte-index|timestamp|length

              The byte-index column is the postion within the file containing the payload bytes.  The timestamp column represents the number of seconds since epoch as a floating point number.
              The precision is the microsecond but may also be the nanosecond in a future tcpflow version.  The length column is the number of successive bytes concerned by timestamp and can
              include several TCP frames (TCP packets).  The extension findx may become from the fact that the timestamps are frame indexed.

       -L semlock_name
              Specifies that semlock_name should be used as a Unix semaphore to prevent two different copies of tcpflow running in two different processes but outputting to the same standard
              output from printing on top of each other. This is an application of Unix named semaphores; bet you have never seen one before.

       -l     Treat the following arguments as filenames with an assumed -r command before each one.  This allows you to read a lot of files at once with shell globbing. For example, to
              process all of the pcap files in the current directory, use this:

                   tcpflow -o out -a -l *.pcap

       -m min_size
              Forces a new connection output file when there is a skip in the TCP session of min_size bytes or more.

       -o outdir
              Specifies the output directory where the transcript files will be written.

       -P     No purge. Normally tcpflow removes connections from the hash table after the connection is closed with a FIN. This conserves memory but takes additional CPU time. Selecting this
              option causes the std::tr1:unordered_map to grow without bounds, as tcpflow did prior to version 1.1. That makes tcpflow run faster if there are less than 10 million connec‐
              tions, but can lead to out-of-memory errors.

       -p     No promiscuous mode.  Normally, tcpflow attempts to put the network interface into promiscuous mode before capturing packets.  The -p option tells tcpflow not to put the inter‐
              face into promiscuous mode.  Note that it might already be in promiscuous mode for some other reason.

       -q     Quiet mode --- don't print warnings. Currently the only warning that tcpflow prints is a warning when more than 10,000 files are created that the user should have provided the
              -Fk, -Fm, or -Fg options. We might have other warnings in the future.

       --relinquish-privileges=username
              When tcpflow is run as root, this option changes the user ID and group ID to write files owned by username.  The group ID is the first one from the username groups list.  This
              operation is performed just after opening the capture device or just after opening the first input PCAP file.  This option does not support multi root-only readable input files
              as the root privileges are dropped after opening the first file (e.g.  -r root-only-access.pcap -R root-only.pcap -l root-only*.pcap).  This option has the same behaviour as the
              tcpdump(1) option having the same name --relinquish-privileges

       -r     Read from file.  Read packets from file, which was created using the -w option of tcpdump(1).  This option may be repeated any number of times. Standard input is used if file is
              "-".  Note that for this option to be useful, tcpdump's -s option should be used to set the snaplen to the MTU of the interface (e.g., 1500) while capturing packets.

       -R     Read from a file, but only to complete TCP flows. This option is used when tcpflow is used to process a series of files that are captured over time.  For each time period n,
              file  file(n).pcap should be processed with  -R file(n).pcap, while file(n-1).pcap should be processed with -r file(n-1).pcap.

       -Sname=value
              Sets a name parameter to be equal to value for a plug-in.  Use -hh to find out all of the settable parameters.

       -s     Strip non-printables.  Convert all non-printable characters to the "." character before printing packets to the console or storing them to a file.

       -T[format]
              Specifies an arbitrary template for filenames.

              %A     expands to source IP address.

              %a     expands to source IP port.

              %B     expands to destination IP address.

              %b     expands to destination IP port.

              %T     expands to timestamp in ISO8601 format.

              %t     expands to timestamp in Unix time_t format.

              %V     expands to "--" if a VLAN is present.

              %v     expands to the VLAN number if a VLAN is present.

              %C     expands to "c" if the connection count>0.

              %c     expands to the connection count if the connection count>0.

              %#     always expands to the connection count.

              %N     (connection_number )             % 1000

              %K     (connection_number / 1000)       % 1000

              %M     (connection_number / 1000000)    % 1000

              %G     (connection_number / 1000000000) % 1000

              %%     prints a "%".

              When the option -T is used, tcpflow ignores options -Fk, -Fm and -Fg.
              However, the option -T handles '/' within the filename template patern to create sub-directories.  For example the following line will create a directory tree out/IP-src/port-
              src/IP-dst/port-dst.

                  tcpflow -r packets.pcap -o out -T %A/%a/%B/%b/%c%N.flow

       -V --version
              Print the version number and exit.

       -v --verbose
              Verbose operation.  Verbosely describe tcpflow's operation.  Equivalent to  -d 10.

       -w filename.pcap
              Write packets that were not processed to filename.pcap. Typically this will be UDP packets.

       -X filename.xml
              Write a DFXML report to filename.xml. The file contains a record of every tcp connection, how the tcpflow program was compiled, and the computer on which tcpflow was run.  By
              default tcpflow writes the DFXML report in file report.xml.

       -Z     Don't decompress gzip-compressed streams.

       expression
              selects which packets will be captured.  If no expression is given, all packets on the net will be captured.  Otherwise, only packets for which expression is `true' will be cap‐
              tured.

              For the expression syntax, see pcap-filter(7).

              The expression argument can be passed to tcpflow as either a single Shell argument, or as multiple Shell arguments, whichever is more convenient.  Generally, if the expression
              contains Shell metacharacters, such as backslashes used to escape protocol names, it is easier to pass it as a single, quoted argument rather than to escape the Shell metachar‐
              acters.  Multiple arguments are concatenated with spaces before being parsed.

DFXML report
       The DFXML report is the XML file written by tcpflow to provide tcpflow build details, command line arguments and information about processed flows.

       By default the DFXML file is named report.xml.  But this filename can be changed using command line option -X.

       DFXML file respects the DFXML schema defined by project https://github.com/dfxml-working-group/dfxml_schema.
       Moreover tcpflow adds two extra XML tags, as illustrated by the following example:

              <tcpflow startime='2017-07-22T00:12:21.962782Z' endtime='2017-07-22T00:12:22.097591Z'
                       family='2' mac_daddr='40:3d:78:57:ed:d4' mac_saddr='00:c5:42:d2:cb:f2'
                       src_ipn='141.134.34.12' dst_ipn='192.168.0.40' srcport='80' dstport='38797'
                       packets='4' len='677' caplen='611' />

              <tcpflow:result scanner="python" path="python/plugins" module="samplePlugin"
                              function="sampleFunction">bla bla bla</tcpflow:result>

       The first XML tag <tcpflow> provide information about the captured flow.  This tag should be renamed <tcpflow:cap> in a future version in order to conform better to DFXML schema.

       The second XML tag <tcpflow:result> collects processing results.  For the moment, only the scanner python uses this feature.

       The XML attributes of <tcpflow> are:

       •      startime Reception time of first packet

       •      endtime Reception time of last packet

       •      family

       •      mac_daddr Destination MAC address of first packet (printed if any)

       •      mac_saddr Source MAC address of first packet (printed if any)

       •      src_ipn IP source

       •      dst_ipn IP destination

       •      srcport TCP port source

       •      dstport TCP port destination

       •      packets Nummber of packets

       •      out_of_order_count Number of times tcpflow has replaced missing payload by zeros in the flow file, for example when capture does not contain the TCP session begin (printed if
              any)

       •      violations Number of protocol violations (printed if any)

       •      len Sum of un-truncated length of all packet data (including headers, see https://stackoverflow.com/q/1491660)

       •      caplen Sum of captured bytes of all packet data (including headers, printed if different from len)

       The XML attributes of <tcpflow:result> are:

       •      scanner Name of the scanner

       •      path Directory of the scanner module (printed if relevant)

       •      module Module name (printed if relevant, used to indicate the python script)

       •      function Function name (printed if relevant, used to indicate the function within the python module)

EXAMPLES
       To record all packets arriving at or departing from sundown and extract all of the HTTP attachments:
              tcpflow -e scan_http -o outdir host sundown

       To record traffic between helios and either hot or ace and bin the results into 1000 files per directory and calculate the MD5 of each flow:
              tcpflow -X report.xml -e scan_md5 -o outdir -Fk host helios and \( hot or ace \)

BUGS
       Please send bug reports to simsong@acm.org.

       tcpflow currently does not understand IP fragments.  Flows containing IP fragments will not be recorded correctly.

AUTHORS
       Originally by Jeremy Elson <jelson@circlemud.org>.  Substantially modified and maintained by Simson L. Garfinkel <simsong@acm.org>.  Network visualization code by Michael Shick
       <mike@shick.in>

       The current version of this software is available at
              http://digitalcorpora.org/downloads/tcpflow/

       An announcement mailing list for this program is at:
              http://groups.google.com/group/tcpflow-users

SEE ALSO
       tcpdump(1), nit(4P), bpf(4), pcap(3), pcap-savefile(5), pcap-filter(7)

tcpflow 1.5.1                                                                              2013-04-13                                                                                tcpflow(1)
