  CDPR
 
## NAME
        cdpr - Cisco Discovery Protocol Reporter
 
## SYNOPSIS
        cdpr [-h] [-t seconds ] [-d device | -r pcap-file ] [-u server-config-file ] [-l location ] [-n hostname ] [-s server ] [-p script-path ]
 
## DESCRIPTION
        cdpr  listens  on  specified  network  interfaces for Cisco Discovery Protocol packets. It then decodes those packets and outputs the information, optionally
        sending the information to a server for processing.
 
## OPTIONS
        -d device
               Specify device to use (eth0, hme0, etc.)
 
        -r pcap-file
               Specify file to read from instead of network device.
 
        -h     Print the usage.
 
        -t seconds
               Time in seconds to abort waiting for a packet (should be > 60)
 
        -v[vv] Set verbose mode.
 
        -u server-config-file
               Send cdpr information to a cdpr server. See /usr/share/doc/cdpr/README.cdprs
 
        -l location
               Location/description of this port; for use with -u or -s and -p.
 
        -n hostname
               Override the hostname reported to the server; for use with -u or -s and -p.
 
        -s server
               Server to send information to, specify port with a: after server/IP.  Example: 192.168.1.20:88 (default: 80) requires -p (overridden by -u)
 
        -p script-path
               Path of server script to send data to; requires -s (overridden by -u)
 
## AUTHOR
        Lance O'Connor <lance at ronnoco dot net>
 
        This manual page was written by Matt Zagrabelny <mzagrabe at d dot umn dot edu>, for the Debian system (but may be used by others).
 
 User Manuals                                                                 APRIL 2009                                                                      CDPR(8)
