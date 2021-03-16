SCAPY(1)                                                               General Commands Manual                                                              SCAPY(1)

NAME
       scapy - Interactive packet manipulation tool

SYNOPSIS
       scapy [options]

DESCRIPTION
       This manual page documents briefly the Scapy tool.

       Scapy  is  a  powerful interactive packet manipulation tool, packet generator, network scanner, network discovery, packet sniffer, etc. It can for the moment
       replace hping, parts of nmap, arpspoof, arp-sk, arping, tcpdump, tshark, p0f, ...

       Scapy uses the Python interpreter as a command board. That means that you can use directly Python language (assign variables, use  loops,  define  functions,
       etc.) If you give a file a parameter when you run Scapy, your session (variables, functions, instances, ...) will be saved when you leave the interpreter and
       restored the next time you launch Scapy.

       The idea is simple. Those kinds of tools do two things : sending packets and receiving answers. That's what Scapy does : you define  a  set  of  packets,  it
       sends  them, receives answers, matches requests with answers and returns a list of packet couples (request, answer) and a list of unmatched packets. This has
       the big advantage over tools like nmap or hping that an answer is not reduced to (open/closed/filtered), but is the whole packet.

       On top of this can be used to build more high-level functions, for example, one that does traceroutes and give as a result only the start TTL of the  request
       and  the  source  IP of the answer. One that pings a whole network and gives the list of machines answering. One that does a portscan and returns a LaTeX re‐
       port.

OPTIONS
       Options for Scapy are:

       -h     display usage

       -d     increase log verbosity. Can be used many times.

       -s FILE
              use FILE to save/load session values (variables, functions, instances, ...)

       -p PRESTART_FILE
              use PRESTART_FILE instead of $HOME/.scapy_prestart.py as pre-startup file

       -P     do not run prestart file

       -c STARTUP_FILE
              use STARTUP_FILE instead of $HOME/.scapy_startup.py as startup file

       -C     do not run startup file

COMMANDS
       Only the vital commands to begin are listed here for the moment.

       ls()   lists supported protocol layers.  If a protocol layer is given as parameter, lists its fields and types of fields.  If a string is given as parameter,
              it is used to filter the layers.

       explore()
              explores  available  protocols.   Allows to look for a layer or protocol through an interactive GUI.  If a Scapy module is given as parameter, explore
              this specific module.

       lsc()  lists scapy's main user commands.

       conf   this object contains the configuration.

FILES
       $HOME/.scapy_prestart.py This file is run before Scapy core is loaded. Only the conf object is available. This file can be used to manipulate  conf.load_lay‐
       ers list to choose which layers will be loaded:

       conf.load_layers.remove("bluetooth")
       conf.load_layers.append("new_layer")

       $HOME/.scapy_startup.py This file is run after Scapy is loaded. It can be used to configure some of the Scapy behaviors:

       conf.prog.pdfreader = "xpdf"
       split_layers(UDP,DNS)

EXAMPLES
       More verbose examples are available in the documentation https://scapy.readthedocs.io/ Just run scapy and try the following commands in the interpreter.

       Test the robustness of a network stack with invalid packets:
       sr(IP(dst="172.16.1.1", ihl=2, options=["verb$2"], version=3)/ICMP(), timeout=2)

       Packet sniffing and dissection (with a bpf filter or tshark-like output):
       a=sniff(filter="tcp port 110")
       a=sniff(prn = lambda x: x.display)

       Sniffed packet re-emission:
       a=sniff(filter="tcp port 110")
       sendp(a)

       Pcap file packet re-emission:
       sendp(rdpcap("file.cap"))

       Manual TCP traceroute:
       sr(IP(dst="www.google.com", ttl=(1,30))/TCP(seq=RandInt(), sport=RandShort(), dport=dport)

       Protocol scan:
       sr(IP(dst="172.16.1.28", proto=(1,254)))

       ARP ping:
       srp(Ether(dst="ff:ff:ff:ff:ff:ff")/ARP(pdst="172.16.1.1/24"))

       ACK scan:
       sr(IP(dst="172.16.1.28")/TCP(dport=(1,1024), flags="A"))

       Passive OS fingerprinting:
       sniff(prn=prnp0f)

       Active OS fingerprinting:
       nmap_fp("172.16.1.232")

       ARP cache poisoning:
       sendp(Ether(dst=tmac)/ARP(op="who-has", psrc=victim, pdst=target))

       Reporting:
       report_ports("192.168.2.34", (20,30))

SEE ALSO
       The official website: https://scapy.net/
       The GitHub Development repository: https://github.com/secdev/scapy/
       The official documentation: https://scapy.readthedocs.io/en/latest/

BUGS
       Does not give the right source IP for routes that use interface aliases.

       May miss packets under heavy load. This is a restriction from python itself

       Session  saving is limited by Python ability to marshal objects. As a consequence, lambda functions and generators can't be saved, which seriously reduce the
       usefulness of this feature.

       BPF filters don't work on Point-to-point interfaces.

AUTHOR
       Philippe Biondi <phil@secdev.org>

       This manual page was written by Alberto Gonzalez Iniesta <agi@agi.as> and Philippe Biondi.

                                                                             May 8, 2018                                                                    SCAPY(1)
