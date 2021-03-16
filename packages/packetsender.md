  packetsender
 
## NAME
        packetsender - Network utility for sending and receiving TCP, UDP, SSL packets
 
## SYNOPSIS
        packetsender [options] address port data
 
## DESCRIPTION
        Packet Sender is a utility that sends and receives TCP, UDP and SSL (encrypted TCP) packets on the ports of your choosing. It supports IPv4 and IPv6 and pro‐
        vides a GUI for final users. However, is also possible use Packet Sender in text mode via command line.
 
        Some features:
 
               •  Can act as client/server to send and receive network traffic.
 
               •  A payload can be created in ASCII or hex.
 
               •  Command line mode is available for automation and scripting.
 
               •  Packet Sender cloud is a disposable resource to be used to publicly display and distribute packets (via an URL) for collaboration,  tutorials,  end
                  users, etc. Packet Sender may import public packet sets with public URL.
 
        Some uses:
 
               •  Control network-based devices in ways beyond their original apps.
 
               •  Test automation (using command line tool and/or hotkeys).
 
               •  Test network APIs (using the built-in TCP, UDP, SSL clients).
 
               •  Malware analysis (using the built-in UDP, TCP, SSL servers).
 
               •  Troubleshoot secure connections (using SSL).
 
               •  Test network connectivity/firewalls (by having 2 Packet Senders talk to each other).
 
               •  Stress-test a device (using intense network generator tool).
 
               •  Tech support (by sending customers a portable Packet Sender with pre-defined settings and packets).
 
               •  Share/Save/Collaborate using the Packet Sender Cloud service.
 
## OPTIONS
        -h, --help
               Displays this help.
 
        -v, --version
               Displays version information.
 
        -q, --quiet
               Quiet mode. Only output received data.
 
        -x, --hex
               Parse data-to-send as hex (default).
 
        -a, --ascii
               Parse data-to-send as mixed-ascii (like the GUI).
 
        -A, --ASCII
               Parse data-to-send as pure ascii (no \xx translation).
 
        -w, --wait <ms>
               Wait  up  to  <milliseconds>  for  a  response after sending.  Zero means do not wait (Default). It is compulsory if a reply from a server, as an HTTP
               server, is needed. In this case, -w 500 is a good start value.
 
        -f, --file <path>
               Send contents of specified path. Max 10 MiB for UDP, 100 MiB for TCP/SSL.
 
        -b, --bind <port>
               Bind port. Default is 0 (dynamic).
 
        -6, --ipv6
               Force IPv6. Same as -B "::". Default is IP:Any.
 
        -4, --ipv4
               Force IPv4.  Same as -B "0.0.0.0". Default is IP:Any.
 
        -B, --bindip <IP>
               Bind custom IP. Default is IP:Any.
 
        -t, --tcp
               Send TCP (default).
 
        -s, --ssl
               Send SSL and ignore errors.
 
        -S, --SSL
               Send SSL and stop for errors.
 
        -u, --udp
               Send UDP.
 
        -n, --name <name>
               Send previously saved packet named <name>. Other options overrides saved packet parameters.
 
        Arguments:
 
               address
                      Destination address. Optional for saved packet.
 
               port   Destination port. Optional for saved packet.
 
               data   Data to send. Optional for saved packet.
 
## EXAMPLES
        The following command line will send a TCP packet, with a mixed-ascii as payload, to example.com, port 22. The command will wait 500 ms for a reply.
 
            $ packetsender -taw 500 example.com 22 "Hello\nWorld"
 
        Similar to last command, but the TCP packet will be sent to port 21. An anonymous authentication will be used.
 
            $ packetsender -taw 500 example.com 21 "## USER anonymous\r\nPASS chrome@example.com\r\n"
 
        The command below uses SSL and will ignore SSL errors. The command will wait 500 ms for a reply.
 
            $ packetsender -saw 500 expired.packetsender.com 443 "GET / HTTP/1.0\r\n\r\n"
 
        Other good example how to access a homepage:
 
            $ packetsender -w 500 -a example.com 80 "GET / HTTP/1.1\r\nHost: example.com\r\n\r\n"
 
        Packet Sender command line also can bind to custom ports to force IPv4/6 modes or multiple NIC, as shown below:
 
            $ packetsender -taw 3000 fe80::c07b:d517:e339:5a08 5005 "Hello\r"
            $ packetsender -taw 3000 192.168.0.201 5005 "Hello\r"
            $ packetsender -B 192.168.0.200 -taw 3000 192.168.0.201 5005 "Hello\r"
            $ packetsender -B fe80::a437:399a:3091:266a%ethernet_32769 -taw 3000 fe80::c07b:d517:e339:5a08 5005 "Hello\r"
            $ packetsender -B fe80::a437:399a:3091:266a -taw 3000 fe80::c07b:d517:e339:5a08 5005 "Hello\r"
 
## SEE ALSO
        tcpdump(8), wireshark(1), https://packetsender.com/documentation
 
## AUTHOR
        Packet Sender was written by Dan Nagle <dan@dannagle.com> and is available at https://packetsender.com
 
        This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).
 
 packetsender-7.0.5                                                           02 Aug 2020                                                             packetsender(1)
