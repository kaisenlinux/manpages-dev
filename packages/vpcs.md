
VPCS(1)                                                                               Virtual PC Simulator                                                                              VPCS(1)

NAME
       vpcs - Virtual PC Simulator

SYNOPSIS
       vpcs [OPTIONS] [FILENAME]

DESCRIPTION
       VPCS provides a command line interface to nine simulated virtual PCs.  You can ping/trace route from/to them, or ping/trace route other hosts/routers from the virtual PCs, making it an
       ideal study tool when you simulate Cisco or Juniper routers in a Dynamips or GNS3 environment.

       Virtual PCs are able to generate and respond to ICMP (ping), TCP and UDP packets delivered to the application via a UDP pipe or Unix tap interface.  If scriptfile is specified, then
       vpcs reads the file on start-up and executes the commands in the scriptfile.  scriptfile must be in vpcs script file format.

       vpcs listens for messages on nine consecutive UDP ports and sends messages on nine consecutive UDP ports.  By the default, vpcs listens on UDP ports 20000 to 20008 and sends messages
       on UDP ports 30000 to 30008.  Each UDP port pair (20000/30000, 20001/30001...20008/30008) represents a virtual PC.  Virtual PCs are numbered 1 to 9.

OPTIONS
       -h, --help
              Print the command line options and exit

       -v     Print the version information and exit

       -R     Disable the relay function

       [-i] num
              Start vpcs with num vitrual PCs, maximum 9.  If omitted vpcs will start with 9 virtual PCs. If num is 1, such as when GNS3 v1.x spawns PCs, commands that reference other PCs
              will have restricted options and the prompt will not display the PC number.

       -p port
              Run vpcs as a daemon process listening on TCP port specified by port.  As a daemon process, vpcs does not present a command line interface to the user, but the command line
              interface can be accessed remotely using a TCP stream application such as telnet or netcat (nc).  Once the daemon has been started, there is no internal mechanism for
              terminating the program, and the program must be terminated by sending a system signal 9, typically by using the command kill -9 PID (where PID is the process id of the vpcs
              instance)

       -m num vpcs uses 9 consecutive MAC addresses for the 9 vpcs stating at 00:50:79:66:68:00 by default. The -m option adds num to the last byte of the base MAC address.  Should any
              increment cause the last byte exceed 0xFF during this process, it will increment to 0x00.

       [-r] FILENAME
              If FILENAME is specified, then vpcs reads the file on start-up and executes the commands in the FILENAME.  FILENAME  must be in vpcs script file format.  By default, if a file
              named startup.vpc exists in the directory where the vpcs program was started, it will be read and executed when vpcs starts.  The -r option is optional if FILENAME is the last
              parameter.

       -e     On systems that support the /dev/tapx interface (Unix/Linux), run vpcs in tap mode rather than UDP mode.  In tap mode, IP packets are sent and received via /dev/tapx interfaces
              rather than via UDP streams.  Typically /dev/tapx interfaces are only available to the root user, meaning vpcs would also be required to be run by the root user (sudo vpcs -e)
              to use tap mode.

       [-u]   This option is the default and not necessary, but included to contrast with the -e option.  By default, vpcs sends and receives IP packets to and from specified UDP ports. vpcs
              listens on UDP port 20000 and sends to port 127.0.0.1:30000 by default.  The listening and sending ports can be manipulated using the -s, -c and -t options.

   UDP Mode Options
       -s port
              port specifies the base port number that vpcs uses to listen for messages. By default vpcs listens for messages on UDP ports 20000 to 20008.  By changing the base port that vpcs
              listens to using the -s option causes nine consecutive UDP ports to be used starting at the port specified by port.

       -t ip  vpcs streams packets to nine UDP ports commencing at 127.0.0.1:30000 by default.  The -t option allows you to stream packets to a remote host as specified by IPv4 address ip.
              Typically the remote host will be running dynamips with a cloud connection configured to link to this host’s IP address.

       -c port
              vpcs streams packets to nine UDP ports commencing at 127.0.0.1:30000.  The -c option allows you to stream packets to a different set of nine ports commencing at the base port
              number specified by port.

   TAP Mode Options
       -d device
              Device name, works only when -i is set to 1

   Hypervisor Mode Option
       -H port
              Run as a hypervisor, listening on TCP port specified by port.  In the hypervisor mode, you can connect this control port with telnet, start or stop an instance of vpcs.

EXAMPLES
   No command line options
       If you start the vpcs with no arguments, vpcs will start and look for the script startup.vpc in the current directory.  If it exists, it will run the script.  This is the normal way of
       running the vpcs.  It is simply evoked from the command line like this:

       vpcs

   Starting vpcs with an alternative startup file
       To start  vpcs with a startup script file called say alternate.vpc, use the file name as an argument to the vpcs command:

       vpcs alternate.vpc

   Running more than nine Virtual PCs
       Suppose you needed more than nine Virtual PCs, so you want to run a second instance of vpcs on your local host.  You would have to consider:

       1. The VPCs MAC addresses for the second instance would need to be different,

       2. The "local" or listening UDP port numbers for the second instance would have to differ from the first instance.

       3. The remote UDP port numbers for the second instance would have to differ from the first instance.

       Since the default local listening port is 20000, and the default remote port is 30000, you would want to start vpcs with a local listening port of 20009 (or greater) and remote port of
       30009 (or greater) .  You would also want the base MAC address to be offset by at least nine to avoid any clashes.  In this case you would use the command:

       vpcs -s 20009 -c 30009 -m 9

       A far better way to run more than nine Virtual PCs is to use the Hypervisor mode.  In Hypervisor mode, vpcs will automatically take care of incrementing MAC addresses and UDP port
       numbers so here is no clash.

BASE INTERFACE
       vpcs presents the user with a command line interface (unless daemon mode has been invoked by the -p option). The interface prompt indicates which of the 9 virtual PCs currently has
       focus by indicating the VPC number in brackets.  Eg.:
       VPCS[1]>
       Here the digit 1 inside the brackets indicates that VPC 1 has focus, and any traffic generated will be sent from VPC 1, and basic show commands will relate to VPC 1.

       Note: When started with the -i 1 option, VPC 1 always has focus, and the prompt does NOT display the VPC number in brackets. Eg.:
       VPCS>

   Basic commands supported are:
       ?      Print help

       ! COMMAND [ARG ...]
              Invoke an OS COMMAND with optional ARG(S) as its arguments

       digit  Switch to the VPCdigit. digit range 1 to 9

       arp [digit|all]
              Shortcut for: show arp. Show arp table for VPC digit (default this VPC) or all VPCs

       clear ip|ipv6|arp|neighbor|hist
              Clear IPv4/IPv6, arp/neighbor cache, command history

       dhcp [OPTION]
              Shortcut for: ip dhcp. Attempt to obtain IPv4 address, mask, gateway and DNS via DHCP

       disconnect
              Exit the telnet session (daemon mode)

       echo TEXT
              Display TEXT in output

       help   Print help

       history
              Shortcut for: show history. List the command history

       ip ARG ... [OPTION]
              Configure the current VPC's IP settings

              ARG ...:
              address [mask] [gateway]
              address [gateway] [mask]

                 Set the VPC's ip, default gateway ip and network mask.
                 Default IPv4 mask is /24, IPv6 is /64. Example:
                 ip 10.1.1.70/26 10.1.1.65 sets the VPC's ip to 10.1.1.70, the gateway to 10.1.1.65, the netmask to 255.255.255.192.
                 In tap mode, the ip of the tapx is the maximum host ID of the subnet. In the example above the tapx ip would be 10.1.1.126
                 mask may be written as /26, 26 or 255.255.255.192

              auto
                 Attempt to obtain IPv6 address, mask and gateway using SLAAC

              dhcp [OPTION]
                 Attempt to obtain IPv4 address, mask, gateway, DNS via DHCP
                 OPTION:
                   -d   Show DHCP packet decode
                   -r   Renew DHCP lease
                   -x   Release DHCP lease

              dns ip
                 Set DNS server ip, delete if ip is '0'

              domain NAME
                 Set local domain name to NAME.  The domain name will be added to host names when using commands that support names. Example: If the domain name was set to example.com, then a
                 command of ping abcd would cause the VPCS to attempt to resolve the name abcd.example.com.

       load [FILENAME[.vpc]]
              Load the configuration/scriptfile from the file FILENAME. If FILENAME ends with '.vpc', then the '.vpc' can be omitted. If FILENAME is omitted then startup.vpc will be loaded if
              it exists. When the file is loaded, each line of the file is executed as a VPCS command. If the state of the echo flag is on, the command will be echoed to the console before
              execution, except:

              * If the command is prefixed with a '@' symbol (eg @set echo color red);

              * If the command is an echo command;

              * If the command is a sleep command
                Note: The command sleep 0 will be echoed if the echo flag is on
                See set echo and show echo

                Note: Press Ctrl+C to interrupt the running script.

       ping HOST [OPTION ...]
              Ping the network HOST with ICMP (default) or TCP/UDP. HOST can be an ip address or name
               OPTIONS:
               -1          ICMP mode, default
               -2          UDP mode
               -3          TCP mode
               -c count    Packet count, default 5
               -D          Set the Don't Fragment bit
               -f FLAG     Tcp header FLAG |C|E|U|A|P|R|S|F|
                                      bits |7 6 5 4 3 2 1 0|
               -i ms       Wait ms milliseconds between sending each packet
               -l size     Data size
               -P protocol Use IP protocol in ping packets
                             1 - ICMP (default), 17 - UDP, 6 - TCP
               -p port     Destination port
               -s port     Source port
               -T ttl      Set ttl, default 64
               -t          Send packets until interrupted by Ctrl+C
               -w ms       Wait ms milliseconds to receive the response
               Notes: 1. Using names requires DNS to be set.
                      2. Use Ctrl+C to stop the command.

       quit   Quit program

       relay ARG ...
              Configure packet relay between UDP ports.

              The relay command allows the VPCS to become a virtual patch panel where connections can be dynamically changed using the relay command.  There are three steps required to use
              VPCS as a virtual patch panel.

              1. A relay hub port must be defined using the relay port port command.

              2. Remote NIO_UDP connections (cloud connections in GNS3) use this hub port as the remote port, ensuring each NIO_UDP connection has a unique local port. (The local port numbers
                 will be used to 'patch' the connection). VPC instances can be directed to use this hub port as their remote port using the command set rport port.

              3. The 'patching' is completed using the command:
                 relay add [ip1:]port1 [ip2:]port2, where port1 and port2 are the local port numbers used in step 2.

            ARG:

            add [ip1:]port1 [ip2:]port2   Relay the packets between ip1 and ip2

            del [ip1:]port1 [ip2:]port2   Delete the relay rule

            del id                        Delete the relay rule

            dump [on|off]                 Dump relay packets to file

            port port                     Set relay hub port

            show                          Show the relay rules

                                          Note: ip1 and ip2 are 127.0.0.1 by default

       rlogin [ip] port
              Telnet to port on host at ip (relative to host PC). To attach to the console of a virtual router running on port 2000 of this host PC, use rlogin 2000
              To telnet to the port 2004 of a remote host 10.1.1.1, use rlogin 10.1.1.1 2004

       save [FILENAME[.vpc]]
              Save the configuration to the scriptfile FILENAME.vpc. If there is no '.' in FILENAME then a '.vpc' extension is added. If FILENAME is omitted then the configuration will be
              saved to startup.vpc

       set ARG ...
              Set hostname, connection port, ipfrag state, dump options and echo options

            ARG:

            dump FLAG [[FLAG]...]
                         Set the packet dump flags for this VPC.

                 FLAG:

                 all     All the packets including incoming.
                          must use [detail|mac|raw] as well as 'all'

                 detail  Print protocol

                 file    Dump packets to file vpcs[id]_yyyymmddHHMMSS.pcap'

                 off     Clear all the flags

                 mac     Print hardware MAC address

                 raw     Print the first 40 bytes

           echo on|off|[color clear|FGCOLOR [BGCOLOR]]
                         Sets the state of the echo flag used when executing script files, or sets the color of text to FGCOLOR with optional BGCOLOR.  set echo color clear resets colors to
                         their defaults.
                         Color list: black, red, green, yellow, blue, magenta, cyan, white

           lport port    Local port

           mtu value     Set the size of the maximum transmission unit of the interface

           pcname NAME   Set the hostname of the current VPC to NAME

           rport port    Remote peer port

           rhost ip      Remote peer host IPv4 address

       show [ARG ...]
              Show information for ARG

           ARG:

           arp [digit|all]
                         Show arp table for VPC digit or all VPCs

           dump [digit|all]
                         Show dump flags for VPC digit or all VPCs

           echo          Show the status of the echo flag. See set echo ?

           history       List the command history

           ip [digit|all]
                         Show IPv4 details for VPC digit or all VPCs.  Shows VPC Name, IP address, mask, gateway, DNS, MAC, lport, rhost:rport and MTU

           ipv6 [digit|all]
                         Show IPv6 details for VPC digit or all VPCs.  Shows VPC Name, IPv6 addresses/mask, gateway, MAC, lport, rhost:rport and MTU

           version       Show the version information

                         Notes:
                         1. If no parameter is given, the key information of all VPCs will be displayed
                         2. If no parameter is given for arp/dump/ip/ipv6 information for the current VPC will be displayed.

       sleep [seconds] [text]
              Print text and pause execution of script for time seconds.  If seconds is zero or missing, pause until a key is pressed.  Default text when no parameters given: 'Press any key
              to continue'

       trace HOST [OPTION ...]
              Print the path packets take to the network  HOST.  HOST can be an ip address or name.

           OPTIONS:

             -P protocol Use IP protocol in trace packets
                          1 - icmp, 17 - udp (default), 6 - tcp

             -m ttl      Maximum ttl, default 8

             Notes: 1. Using names requires DNS to be set.
                    2. Use Ctrl+C to stop the command.

       version
              Shortcut for: show version

       write [FILENAME[.vpc]]
              Do the same as save

   VPCS script file format
       Any text file consisting of valid vpcs commands can be used as a vpcs script file.  Lines in the file beginning with the # character will be treated as comments and ignored.  As the
       script is being executed, the VPCS will either display each command immediately before it is executed or not depending on the state of the echo flag.  The @ character can also be used
       to supress command echoing.  Commands pre-pended by the @ character are not echoed.  The echo and sleep commands are never echoed except the sleep 0 command which is always echoed.

       Command files can make use of the echo and sleep commands to create some form of interactive script.

       Script file exececution can be aborted at any time by pressing Ctrl+c.  This means that the ping HOST -t command (which must be terimated by Ctrl+c) is not useful in vpcs script files.

HYPERVISOR INTERFACE
       When vpcs is started with the -H port option, vpcs starts in hypervisor mode as a daemon process.

       To access the vpcs hypervisor interface, you need to start a telnet session to the port number you specified with the -H option.  If for example you started vpcs with a command of vpcs
       -H 20000, then you would typically open a telnet session to port 20000  on your localhost  IP address (127.0.0.1).

       In this mode, an alternative interface is presented to allow the user to create and kill multiple vpcs sessions.  These sessions are always run as a daemon process and must be accessed
       via either an external telnet application, or by using the telnet or rlogin  command within the vpcs hypervisor session.

       In hypervisor  mode, the commands supported are:

       help | ?                 Print help

       disconnect               Exit the telnet session

       list                     List vpcs process and ids

       quit [-f]                Stop all vpcs processes and hypervisor, -f force quit without prompting

       stop id                  Stop vpcs process number id

       rlogin [ip] port         Same as telnet

       telnet [ip] port         Telnet to port at ip (default 127.0.0.1)

       vpcs [parameters]        Start vpcs daemon with parameters.

       A typical hypervisor session might run something like this:

       -------------------------------------------------------
       ~$ vpcs -H 20000
       ~$ telnet 127.0.0.1 20000
       Trying 127.0.0.1...
       Connected to localhost.
       Escape character is '^]'.
       HV > vpcs
       100-VPCS started with -p 20001 -s 20000 -c 30000
       HV > rlogin 20001
       Connect 127.0.0.1:20001, press Ctrl+X to quit
       NOTES: you will be back to the starting point, NOT THE LAST,
              if using Ctrl+X to quit.

       Welcome to Virtual PC Simulator,   ... <output omitted> ...
       VPCS[1] disconnect
       Good-bye
       Disconnected from 127.0.0.1:20001
       HV >
       -------------------------------------------------------

       Note that when the vpcs instance was initiated from within the hypervisor interface, it spawned a vpcs daemon process listening on TCP port 20001.  To access that process, the rlogin
       command was used to port 20001 initiating a session with that instance.  However, you could have just as easily started another independent telnet session in another shell instance to
       127.0.0.1 20001.

       Also note that once you have finished with the vpcs session, you can exit either using the disconnect command, or use the key combination of Ctrl+X.  If you have nested rlogin
       sessions, Ctrl+X will return you to the hypervisor, disconnect will take you back one level in the nesting.

BUGS
       IPv6 implementation is a basic implementation that is not fully implemented.

       The ping HOST -t command (which must be terminated by Ctrl+c) can not be used in vpcs script files because when Ctrl+c is pressed to stop the ping, it also aborts the script file
       execution.

       Please send problems, bugs, questions, desirable enhancements, patches etc to the author.

AUTHOR
       Paul Meng <mirnshi[AT]gmail.com>
       Documentation by Chris Welsh <rednectar.chris[AT]gmail.com>

COPYRIGHT
       VPCS is free software, distributed under the terms of the "BSD" licence.
       Source code and license can be found at vpcs.sf.net.
       For more information, please visit wiki.freecode.com.cn.

0.8                                                                                        2013-12-16                                                                                   VPCS(1)
