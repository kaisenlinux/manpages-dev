ATFTP(1)                                                                          General Commands Manual                                                                         ATFTP(1)

NAME
       atftp - TFTP client (RFC1350).

SYNOPSIS
       atftp [options] [host [port]]

DESCRIPTION
       atftp can be used interactively or in batch mode to retrieve files from TFTP servers. When used interactively, a summary of the commands can be printed by typing 'help'. This TFTP
       client support all basic features from RFC1350, RFC2347, RFC2348 and RFC2349. It also support multicast implementation of RFC2090 and mtftp as defined in the PXE specification.

OPTIONS
       This program supports both the usual GNU command line syntax, with long options starting with two dashes ('--') as well as short options. Some options are  usable  in  batch  mode
       only, they have no meaning when atftp is use interactively. A description of the options is shown below.

       -g, --get
              Non interactive invocation only. Instruct atftp to fetch a file from a tftp server.

       --mget Non interactive invocation only. Used to fetch a file from a mtftp capable server.

       -p, --put
              Non interactive invocation only. Instruct atftp to send a file to a tftp server.

       -P, --password
              Give password to tftp server. This is a non-standard extension to the atftp client necessary for Linksys routers and shouldn't be used elsewhere.

       -l, --local-file
              Non interactive invocation only. The client side (locat) file name to read or write. Must be used in conjunction with --get or --put.

       -r, --remote-file
              Non interactive invocation only. The server side (remote) file name to get or put. Must be used in conjunction with --get or --put.

       --tftp-timeout <value>
              Number of seconds for timeout of the client. Default is 5 seconds.

       --option <"name value">
              Set option "name" to "value". This command supports exactly the same arguments as the interactive one. For example, use: --option "blksize 1428" to configure block size.
              Possible Values are:
                --option "tsize enable"
                --option "tsize disable"
                --option "blksize 8"
                --option "blksize 65464"

       --mtftp <"name value">
              Set mtftp possible options. Accepts the same options as the interactive mtftp command. For example, use: --mtftp "client-port 76" to configure client side port to use.

       --no-source-port-checking
              See atftpd's man page.

       --verbose
              Instruct atftp to be verbose. It will print more information about what's going on.

       --trace
              This is useful for debugging purpose to display all packet going to and from the network.

       -V, --version
              Print version.

       -h, --help
              Print a summary of command line arguments.

AUTHOR
       This manual page was written by Remi Lefebvre <remi@debian.org> and Jean-Pierre Lefebvre <helix@step.polymtl.ca>.

                                                                                     December 27, 2000                                                                            ATFTP(1)
