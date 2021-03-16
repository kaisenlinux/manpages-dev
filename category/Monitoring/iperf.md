IPERF(1)                                                                    User Manuals                                                                    IPERF(1)

NAME
       iperf - perform network throughput tests

SYNOPSIS
       iperf -s [options]

       iperf -c server [options]

       iperf -u -s [options]

       iperf -u -c server [options]

DESCRIPTION
       iperf  2 is a tool for performing network throughput and latency measurements. It can test using either TCP or UDP protocols. It supports both unidirectional
       and bidirectional traffic. Multiple simultaneous traffic streams are also supported. Metrics are displayed to help isolate the causes  which  impact  perfor‐
       mance. Setting the enhanced (-e) option provides all available metrics.

       The user must establish both a both a server (to discard traffic) and a client (to generate traffic) for a test to occur. The client and server typically are
       on different hosts or computers but need not be.

GENERAL OPTIONS
       -b, --bandwidth
              set the target bandwidth and optional standard deviation per <mean>,[<stdev>] (See NOTES for suffixes)

       -e, --enhanced
              Display enhanced output in reports otherwise use legacy report (ver 2.0.5) formatting (see notes)

       -f, --format [abkmgBKMG]
              format to report: adaptive, bits, Bytes, Kbits, Mbits, Gbits, KBytes, MBytes, GBytes (see NOTES for more)

       -h, --help
              print a help synopsis

       -i, --interval < n[p] | f >
              sample or display interval reports every n seconds (default) or n packets (per optional p suffix.) If f is used then the interval will be  each  frame
              or burst. The frame interval reporting is experimental.  Also suggest a compile with fast-sampling, i.e. ./configure --enable-fastsampling

       -l, --len n[kmKM]
              set read/write buffer size (TCP) or length (UDP) to n (TCP default 128K, UDP default 1470)

           --l2checks
              perform layer 2 length checks on received UDP packets (requires systems that support packet sockets, e.g. Linux)

       -m, --print_mss
              print TCP maximum segment size (MTU - TCP/IP header)

           --NUM_REPORT_STRUCTS <count>
              Override  the  default  shared  memory size between the traffic thread(s) and reporter thread in order to mitigate mutex lock contentions. The default
              value of 5000 should be sufficient for 1Gb/s networks. Increase this upon seeing the Warning message of reporter thread too slow. If the Warning  mes‐
              sage isn't seen, then increasing this won't have any significant effect (other than to use some additional memory.)

       -o, --output filename
              output the report or error message to this specified file

       -p, --port n
              set server port to listen on/connect to to n (default 5001)

           --sum-only
              set the output to sum reports only. Useful for -P at large values

       -u, --udp
              use UDP rather than TCP

       -w, --window n[kmKM]
              TCP window size (socket buffer size)

       -z, --realtime
              Request real-time scheduler, if supported.

       -B, --bind host[:port][%dev]
              bind to host, ip address or multicast address, optional port or device (see NOTES)

       -C, --compatibility
              for use with older versions does not sent extra msgs

       -M, --mss n
              set TCP maximum segment size (MTU - 40 bytes)

       -N, --nodelay
              set TCP no delay, disabling Nagle's Algorithm

       -v, --version
              print version information and quit

       -x, --reportexclude [CDMSV]
              exclude C(connection) D(data) M(multicast) S(settings) V(server) reports

       -y, --reportstyle C|c
              if set to C or c report results as CSV (comma separated values)

       -Z, --tcp-congestion
              Set  the  default  congestion-control algorithm to be used for new connections. Platforms must support setsockopt's TCP_CONGESTION. (Notes: See sysctl
              and tcp_allowed_congestion_control for available options. May require root privileges.)

SERVER SPECIFIC OPTIONS
       -1, --singleclient
              set the server to process only one client at a time

       -b, --bandwidth n[kmgKMG]
              set target read rate to n bits/sec. TCP only for the server.

       -s, --server
              run in server mode

           --histograms[=binwidth[u],bincount,[lowerci],[upperci]]
              enable latency histograms for udp packets (-u), for tcp writes (with --trip-times), or for either udp or tcp with --isochronous clients.  The  binning
              can  be  modified. Bin widths (default 1 millisecond, append u for microseconds,) bincount is total bins (default 1000), ci is confidence interval be‐
              tween 0-100% (default lower 5%, upper 95%, 3 stdev 99.7%)

       -B, --bind ip | ip%device
              bind src ip addr and optional src device for receiving

       -D, --daemon
              run the server as a daemon. On Windows this will run the specified command-line under the IPerfService, installing the service if necessary. Note  the
              service  is  not  configured to auto-start or restart - if you need a self-starting service you will need to create an init script or use Windows "sc"
              commands.

       -H, --ssm-host host
              Set the source host (ip addr) per SSM multicast, i.e. the S of the S,G

       -R, --remove
              remove the IPerfService (Windows only).

       -U, --single_udp
              run in single threaded UDP mode

       -V, --ipv6_domain
              Enable IPv6 reception by setting the domain and socket to AF_INET6 (Can receive on both IPv4 and IPv6)

CLIENT SPECIFIC OPTIONS
       -b, --bandwidth n[kmgKMG] | npps
              set target bandwidth to n bits/sec (default 1 Mbit/sec) or n packets per sec. This may be used  with  TCP  or  UDP.  For  variable  loads  use  format
              mean,standard deviation

       -c, --client host | host%device
              run in client mode, connecting to host  where the optional %dev will SO_BINDTODEVICE that output interface (requires root and see NOTES)

           --connect-only
              only perform a TCP connect without any data transfer - useful to measure TCP connect() times

       -d, --dualtest
              Do a bidirectional test simultaneous test using two unidirectional sockets

           --fq-rate n[kmgKMG]
              Set  a  rate  to  be  used  with  fair-queueing  based  socket-level  pacing,  in bytes or bits per second. Only available on platforms supporting the
              SO_MAX_PACING_RATE socket option. (Note: Here the suffixes indicate bytes/sec or bits/sec per use of uppercase or lowercase, respectively)

           --full-duplex
              run a full duplex test, i.e. traffic in both transmit and receive directions using the same socket

           --incr-dstip
              increment the destination ip address when using the parallel (-P) option

           --ipg n
              set the interpacket gap to n (units of seconds) for packets or within a frame/burst when --isochronous is set

           --isochronous[=fps:mean,stdev]
              send isochronous traffic with frequency frames per second and load defined by mean and standard deviation using a log normal distribution, defaults to
              60:20m,0.  (Note:  Here the suffixes indicate bytes/sec or bits/sec per use of uppercase or lowercase, respectively. Also the p suffix is supported to
              set the burst size in packets, e.g. isochronous=2:25p will send two 25 packet bursts every second, or one 25 packet burst every 0.5 seconds.)

           --no-connect-sync
              By default, parallel traffic threads (per -P greater than 1) will synchronize after their TCP connects and prior to each sending traffic, i.e. all the
              threads  first complete (or error) the TCP 3WHS before any traffic thread will start sending. This option disables that synchronization such that each
              traffic thread will start sending immediately after completing its successful connect.

           --no-udp-fin
              Don't perform the UDP final server to client exchange which means there won't be a final server report displayed on the client. All  packets  per  the
              test  will  be from the client to the server and no packets should be sent in the other direction.  It's highly suggested that -t be set on the server
              if this option is being used.  This is because there will be only one trigger ending packet sent from client to server  and  if  it's  lost  then  the
              server will continue to run. (Requires ver 2.0.14 or better)

       -n, --num n[kmKM]
              number of bytes to transmit (instead of -t)

       -r, --tradeoff
              Do a bidirectional test individually - client-to-server, followed by a reversed test, server-to-client

       -t, --time n
              time in seconds to listen for new traffic connections, receive traffic or transmit traffic (Defaults: transmit is 10 secs while listen and receive are
              indefinite)

           --trip-times
              enable the measurement of end to end write to read latencies (client and server clocks must be synchronized)

           --txdelay-time
              time in seconds to hold back or delay after the TCP connect and prior to the socket writes. For UDP it's the delay between the traffic thread starting
              and the first write.

           --txstart-time n.n
              set  the  txstart-time  to n.n using unix or epoch time format (supports microsecond resolution, e.g 1536014418.123456) An example to delay one second
              using command subsitution is iperf -c 192.168.1.10 --txstart-time $(expr $(date +%s) + 1).$(date +%N)

       -B, --bind ip | ip:port | ipv6 -V | [ipv6]:port -V
              bind src ip addr and optional port as the source of traffic (see notes)

       -F, --fileinput name
              input the data to be transmitted from a file

       -I, --stdin
              input the data to be transmitted from stdin

       -L, --listenport n
              port to receive bidirectional tests back on

       -P, --parallel n
              number of parallel client threads to run

       -R, --reverse
              reverse the traffic flow (useful for testing through firewalls, see NOTES)

       -S, --tos
              set the socket's IP_TOS (byte) field

       -T, --ttl n
              time-to-live, for multicast (default 1) -V, --ipv6_domain Set the domain to IPv6 (send packets over IPv6)

       -X, --peerdetect
              run peer version detection prior to traffic.

       -Z, --linux-congestion algo
              set TCP congestion control algorithm (Linux only)

EXAMPLES
       TCP tests (client)

       iperf -c <host> -e -i 1
       ------------------------------------------------------------
       Client connecting to <host>, TCP port 5001 with pid 5149
       Write buffer size:  128 KByte
       TCP window size:  340 KByte (default)
       ------------------------------------------------------------
       [  3] local 45.56.85.133 port 49960 connected with 45.33.58.123 port 5001 (ct=3.23 ms)
       [ ID] Interval        Transfer    Bandwidth       Write/Err  Rtry     Cwnd/RTT        NetPwr
       [  3] 0.00-1.00 sec   126 MBytes  1.05 Gbits/sec  1006/0          0       56K/626 us  210636.47
       [  3] 1.00-2.00 sec   138 MBytes  1.15 Gbits/sec  1100/0        299      483K/3884 us  37121.32
       [  3] 2.00-3.00 sec   137 MBytes  1.15 Gbits/sec  1093/0         24      657K/5087 us  28162.31
       [  3] 3.00-4.00 sec   126 MBytes  1.06 Gbits/sec  1010/0        284      294K/2528 us  52366.58
       [  3] 4.00-5.00 sec   117 MBytes   980 Mbits/sec  935/0        373      487K/2025 us  60519.66
       [  3] 5.00-6.00 sec   144 MBytes  1.20 Gbits/sec  1149/0          2      644K/3570 us  42185.36
       [  3] 6.00-7.00 sec   126 MBytes  1.06 Gbits/sec  1011/0        112      582K/5281 us  25092.56
       [  3] 7.00-8.00 sec   110 MBytes   922 Mbits/sec  879/0         56      279K/1957 us  58871.89
       [  3] 8.00-9.00 sec   127 MBytes  1.06 Gbits/sec  1014/0         46      483K/3372 us  39414.89
       [  3] 9.00-10.00 sec   132 MBytes  1.11 Gbits/sec  1054/0          0      654K/3380 us  40872.75
       [  3] 0.00-10.00 sec  1.25 GBytes  1.07 Gbits/sec  10251/0       1196       -1K/3170 us  42382.03

       where (per -e,)
              ct= TCP connect time (or three way handshake time 3WHS)
              Write/Err Total number of successful socket writes. Total number of non-fatal socket write errors
              Rtry Total number of TCP retries
              Cwnd/RTT (*nix only) TCP congestion window and round trip time (sampled where NA indicates no value)
              NetPwr (*nix only) Network power defined as (throughput / RTT)

       TCP tests (server)

       iperf -s -e -i 1 -l 8K
       ------------------------------------------------------------
       Server listening on TCP port 5001 with pid 13430
       Read buffer size: 8.00 KByte
       TCP window size: 85.3 KByte (default)
       ------------------------------------------------------------
       [  4] local 45.33.58.123 port 5001 connected with 45.56.85.133 port 49960
       [ ID] Interval        Transfer    Bandwidth       Reads   Dist(bin=1.0K)
       [  4] 0.00-1.00 sec   124 MBytes  1.04 Gbits/sec  22249    798:2637:2061:767:2165:1563:589:11669
       [  4] 1.00-2.00 sec   136 MBytes  1.14 Gbits/sec  24780    946:3227:2227:790:2427:1888:641:12634
       [  4] 2.00-3.00 sec   137 MBytes  1.15 Gbits/sec  24484    1047:2686:2218:810:2195:1819:728:12981
       [  4] 3.00-4.00 sec   126 MBytes  1.06 Gbits/sec  20812    863:1353:1546:614:1712:1298:547:12879
       [  4] 4.00-5.00 sec   117 MBytes   984 Mbits/sec  20266    769:1886:1828:589:1866:1350:476:11502
       [  4] 5.00-6.00 sec   143 MBytes  1.20 Gbits/sec  24603    1066:1925:2139:822:2237:1827:744:13843
       [  4] 6.00-7.00 sec   126 MBytes  1.06 Gbits/sec  22635    834:2464:2249:724:2269:1646:608:11841
       [  4] 7.00-8.00 sec   110 MBytes   921 Mbits/sec  21107    842:2437:2747:592:2871:1903:496:9219
       [  4] 8.00-9.00 sec   126 MBytes  1.06 Gbits/sec  22804    1038:1784:2639:656:2738:1927:573:11449
       [  4] 9.00-10.00 sec   133 MBytes  1.11 Gbits/sec  23091    1088:1654:2105:710:2333:1928:723:12550
       [  4] 0.00-10.02 sec  1.25 GBytes  1.07 Gbits/sec  227306    9316:22088:21792:7096:22893:17193:6138:120790

       where (per -e,)
              Reads Total number of socket reads
              Dist(bin=size) Eight bin histogram of the socket reads returned byte count. Bin width is set per size. Bins are separated by a colon. In the  example,
              the bins are 0-1K, 1K-2K, .., 7K-8K.

       TCP tests (server with --trip-times on client) iperf -s -i 1 -w 4M
       ------------------------------------------------------------
       Server listening on TCP port 5001
       TCP window size: 8.00 MByte (WARNING: requested 4.00 MByte)
       ------------------------------------------------------------
       [  4] local 192.168.1.4%eth0 port 5001 connected with 192.168.1.7 port 44798 (trip-times) (MSS=1448) (peer 2.0.14-alpha)
       [ ID] Interval        Transfer    Bandwidth    Burst Latency avg/min/max/stdev (cnt/size) inP NetPwr  Reads=Dist
       [  4] 0.00-1.00 sec  19.0 MBytes   159 Mbits/sec  52.314/10.238/117.155/19.779 ms (151/131717) 1.05 MByte 380.19  781=306:253:129:48:18:15:8:4
       [  4] 1.00-2.00 sec  20.0 MBytes   168 Mbits/sec  53.863/21.264/79.252/12.277 ms (160/131080) 1.08 MByte 389.38  771=294:236:126:60:18:24:10:3
       [  4] 2.00-3.00 sec  18.2 MBytes   153 Mbits/sec  58.718/22.000/137.944/20.397 ms (146/130964) 1.06 MByte 325.64  732=299:231:98:52:18:19:10:5
       [  4] 3.00-4.00 sec  19.7 MBytes   165 Mbits/sec  50.448/ 8.921/82.728/14.627 ms (158/130588)  997 KByte 409.00  780=300:255:121:58:15:18:7:6
       [  4] 4.00-5.00 sec  18.8 MBytes   158 Mbits/sec  53.826/11.169/115.316/15.541 ms (150/131420) 1.02 MByte 366.24  761=302:226:134:52:22:17:7:1
       [  4] 5.00-6.00 sec  19.5 MBytes   164 Mbits/sec  50.943/11.922/76.134/14.053 ms (156/131276) 1.03 MByte 402.00  759=273:246:149:45:16:18:4:8
       [  4] 6.00-7.00 sec  18.5 MBytes   155 Mbits/sec  57.643/10.039/127.850/18.950 ms (148/130926) 1.05 MByte 336.16  710=262:228:133:37:16:20:8:6
       [  4] 7.00-8.00 sec  19.6 MBytes   165 Mbits/sec  52.498/12.900/77.045/12.979 ms (157/131003) 1.00 MByte 391.78  742=288:200:135:68:16:23:4:8
       [  4] 8.00-9.00 sec  18.0 MBytes   151 Mbits/sec  58.370/ 8.026/150.243/21.445 ms (144/131255) 1.06 MByte 323.81  716=268:241:108:51:20:17:8:3
       [  4] 9.00-10.00 sec  18.4 MBytes   154 Mbits/sec  56.112/12.419/79.790/13.668 ms (147/131194) 1.05 MByte 343.70  822=330:303:120:26:16:14:9:4
       [  4] 10.00-10.06 sec  1.03 MBytes   146 Mbits/sec  69.880/45.175/78.754/10.823 ms (9/119632) 1.74 MByte 260.40  62=26:30:5:1:0:0:0:0
       [  4] 0.00-10.06 sec   191 MBytes   159 Mbits/sec  54.183/ 8.026/150.243/16.781 ms (1526/131072) 1.03 MByte 366.98  7636=2948:2449:1258:498:175:185:75:48

       where (per -e,)
              Burst Latency One way TCP write() to read() latency in mean/minimum/maximum/standard deviation format (Note: requires the client's and server's system
              clocks to be synchronized to a common reference, e.g. using precision time protocol PTP. A GPS disciplined OCXO is a recommended reference.)
              cnt Number of completed bursts received and used for the burst latency calculations
              size Average burst size in bytes (computed average and estimate only)
              inP inP, short for in progress, is the average number of bytes in progress or in flight. This is taken from an application write to read  perspective.
              (Requires --trip-times on client. See Little's law in NOTES.)
              NetPwr Network power defined as (throughput / one way latency)

       UDP tests (client)

       iperf -c <host> -e -i 1 -u -b 10m
       ------------------------------------------------------------
       Client connecting to <host>, UDP port 5001 with pid 5169
       Sending 1470 byte datagrams, IPG target: 1176.00 us (kalman adjust)
       UDP buffer size:  208 KByte (default)
       ------------------------------------------------------------
       [  3] local 45.56.85.133 port 32943 connected with 45.33.58.123 port 5001
       [ ID] Interval        Transfer     Bandwidth      Write/Err  PPS
       [  3] 0.00-1.00 sec  1.19 MBytes  10.0 Mbits/sec  852/0      851 pps
       [  3] 1.00-2.00 sec  1.19 MBytes  10.0 Mbits/sec  850/0      850 pps
       [  3] 2.00-3.00 sec  1.19 MBytes  10.0 Mbits/sec  850/0      850 pps
       [  3] 3.00-4.00 sec  1.19 MBytes  10.0 Mbits/sec  851/0      850 pps
       [  3] 4.00-5.00 sec  1.19 MBytes  10.0 Mbits/sec  850/0      850 pps
       [  3] 5.00-6.00 sec  1.19 MBytes  10.0 Mbits/sec  850/0      850 pps
       [  3] 6.00-7.00 sec  1.19 MBytes  10.0 Mbits/sec  851/0      850 pps
       [  3] 7.00-8.00 sec  1.19 MBytes  10.0 Mbits/sec  850/0      850 pps
       [  3] 8.00-9.00 sec  1.19 MBytes  10.0 Mbits/sec  851/0      850 pps
       [  3] 0.00-10.00 sec  11.9 MBytes  10.0 Mbits/sec  8504/0      850 pps
       [  3] Sent 8504 datagrams
       [  3] Server Report:
       [  3] 0.00-10.00 sec  11.9 MBytes  10.0 Mbits/sec   0.047 ms    0/ 8504 (0%)  0.537/ 0.392/23.657/ 0.497 ms  850 pps  2329.37

       where (per -e,)
              Write/Err Total number of successful socket writes. Total number of non-fatal socket write errors
              PPS Transmit packet rate in packets per second

       UDP tests (server) iperf -s -i 1 -w 4M -u
       ------------------------------------------------------------
       Server listening on UDP port 5001
       Receiving 1470 byte datagrams
       UDP buffer size: 8.00 MByte (WARNING: requested 4.00 MByte)
       ------------------------------------------------------------
       [  3] local 192.168.1.4 port 5001 connected with 192.168.1.1 port 60027 (WARN: winsize=8.00 MByte req=4.00 MByte) (trip-times) (0.0) (peer 2.0.14-alpha)
       [ ID] Interval        Transfer     Bandwidth        Jitter   Lost/Total  Latency avg/min/max/stdev PPS  inP NetPwr
       [  3] 0.00-1.00 sec  44.5 MBytes   373 Mbits/sec   0.071 ms 52198/83938 (62%) 75.185/ 2.367/85.189/14.430 ms 31854 pps 3.64 MByte 620.58
       [  3] 1.00-2.00 sec  44.8 MBytes   376 Mbits/sec   0.015 ms 59549/143701 (41%) 79.609/75.603/85.757/ 1.454 ms 31954 pps 3.56 MByte 590.04
       [  3] 2.00-3.00 sec  44.5 MBytes   373 Mbits/sec   0.017 ms 59494/202975 (29%) 80.006/75.951/88.198/ 1.638 ms 31733 pps 3.56 MByte 583.07
       [  3] 3.00-4.00 sec  44.5 MBytes   373 Mbits/sec   0.019 ms 59586/262562 (23%) 79.939/75.667/83.857/ 1.145 ms 31767 pps 3.56 MByte 583.57
       [  3] 4.00-5.00 sec  44.5 MBytes   373 Mbits/sec   0.081 ms 59612/322196 (19%) 79.882/75.400/86.618/ 1.666 ms 31755 pps 3.55 MByte 584.40
       [  3] 5.00-6.00 sec  44.7 MBytes   375 Mbits/sec   0.064 ms 59571/381918 (16%) 79.767/75.571/85.339/ 1.556 ms 31879 pps 3.56 MByte 588.02
       [  3] 6.00-7.00 sec  44.6 MBytes   374 Mbits/sec   0.041 ms 58990/440820 (13%) 79.722/75.662/85.938/ 1.087 ms 31820 pps 3.58 MByte 586.73
       [  3] 7.00-8.00 sec  44.7 MBytes   375 Mbits/sec   0.027 ms 59679/500548 (12%) 79.745/75.704/84.731/ 1.094 ms 31869 pps 3.55 MByte 587.46
       [  3] 8.00-9.00 sec  44.3 MBytes   371 Mbits/sec   0.078 ms 59230/559499 (11%) 80.346/75.514/94.293/ 2.858 ms 31590 pps 3.58 MByte 577.97
       [  3] 9.00-10.00 sec  44.4 MBytes   373 Mbits/sec   0.073 ms 58782/618394 (9.5%) 79.125/75.511/93.638/ 1.643 ms 31702 pps 3.55 MByte 588.99
       [  3] 10.00-10.08 sec  3.53 MBytes   367 Mbits/sec   0.129 ms 6026/595236 (1%) 94.967/80.709/99.685/ 3.560 ms 31107 pps 3.58 MByte 483.12
       [  3] 0.00-10.08 sec   449 MBytes   374 Mbits/sec   0.129 ms 592717/913046 (65%) 79.453/ 2.367/99.685/ 5.200 ms 31776 pps (null) 587.91

       where (per -e,)
              Latency  End  to  end latency in mean/minimum/maximum/standard deviation format (Note: requires the client's and server's system clocks to be synchro‐
              nized to a common reference, e.g. using precision time protocol PTP. A GPS disciplined OCXO is a recommended reference.)
              PPS Received packet rate in packets per second
              inP inP, short for in progress, is the average number of bytes in progress or in flight. This is taken from an application write to read  perspective.
              (Requires --trip-times on client. See Little's law in NOTES.)
              NetPwr Network power defined as (throughput / latency)

       Isochronous UDP tests (client)

       iperf -c 192.168.100.33 -u -e -i 1 --isochronous=60:100m,10m --realtime
       ------------------------------------------------------------
       Client connecting to 192.168.100.33, UDP port 5001 with pid 14971
       UDP isochronous: 60 frames/sec mean= 100 Mbit/s, stddev=10.0 Mbit/s, Period/IPG=16.67/0.005 ms
       UDP buffer size:  208 KByte (default)
       ------------------------------------------------------------
       [  3] local 192.168.100.76 port 42928 connected with 192.168.100.33 port 5001
       [ ID] Interval        Transfer     Bandwidth      Write/Err  PPS  frames:tx/missed/slips
       [  3] 0.00-1.00 sec  12.0 MBytes   101 Mbits/sec  8615/0     8493 pps   62/0/0
       [  3] 1.00-2.00 sec  12.0 MBytes   100 Mbits/sec  8556/0     8557 pps   60/0/0
       [  3] 2.00-3.00 sec  12.0 MBytes   101 Mbits/sec  8586/0     8586 pps   60/0/0
       [  3] 3.00-4.00 sec  12.1 MBytes   102 Mbits/sec  8687/0     8687 pps   60/0/0
       [  3] 4.00-5.00 sec  11.8 MBytes  99.2 Mbits/sec  8468/0     8468 pps   60/0/0
       [  3] 5.00-6.00 sec  11.9 MBytes  99.8 Mbits/sec  8519/0     8520 pps   60/0/0
       [  3] 6.00-7.00 sec  12.1 MBytes   102 Mbits/sec  8694/0     8694 pps   60/0/0
       [  3] 7.00-8.00 sec  12.1 MBytes   102 Mbits/sec  8692/0     8692 pps   60/0/0
       [  3] 8.00-9.00 sec  11.9 MBytes   100 Mbits/sec  8537/0     8537 pps   60/0/0
       [  3] 9.00-10.00 sec  11.8 MBytes  99.0 Mbits/sec  8450/0     8450 pps   60/0/0
       [  3] 0.00-10.01 sec   120 MBytes   100 Mbits/sec  85867/0     8574 pps  602/0/0
       [  3] Sent 85867 datagrams
       [  3] Server Report:
       [  3] 0.00-9.98 sec   120 MBytes   101 Mbits/sec   0.009 ms  196/85867 (0.23%)  0.665/ 0.083/ 1.318/ 0.174 ms 8605 pps  18903.85

       where (per -e,)
              frames:tx/missed/slips Total number of isochronous frames or bursts. Total number of frame ids not sent. Total number of frame slips

       Isochronous UDP tests (server)

       iperf -s -e -u --udp-histogram=100u,2000 --realtime
       ------------------------------------------------------------
       Server listening on UDP port 5001 with pid 5175
       Receiving 1470 byte datagrams
       UDP buffer size:  208 KByte (default)
       ------------------------------------------------------------
       [  3] local 192.168.100.33 port 5001 connected with 192.168.100.76 port 42928 isoch (peer 2.0.13-alpha)
       [ ID] Interval        Transfer     Bandwidth        Jitter   Lost/Total  Latency avg/min/max/stdev PPS  NetPwr  Frames/Lost
       [  3] 0.00-9.98 sec   120 MBytes   101 Mbits/sec   0.010 ms  196/85867 (0.23%)  0.665/ 0.083/ 1.318/ 0.284 ms 8585 pps  18903.85  601/1
       [    3]   0.00-9.98  sec  T8(f)-PDF:  bin(w=100us):cnt(85671)=1:2,2:844,3:10034,4:8493,5:8967,6:8733,7:8823,8:9023,9:8901,10:8816,11:7730,12:4563,13:741,14:1
       (5.00/95.00%=3/12,Outliers=0,obl/obu=0/0)
       [   3]  0.00-9.98  sec  F8(f)-PDF:  bin(w=100us):cnt(598)=   15:2,16:1,17:27,18:68,19:125,20:136,21:103,22:83,23:22,24:23,25:5,26:3   (5.00/95.00%=17/24,Out‐
       liers=0,obl/obu=0/0)

       where, Frames/lost Total number of frames (or bursts) received. Total number of bursts lost or error-ed
              T8-PDF(f) Latency histogram for packets
              F8-PDF(f) Latency histogram for frames

ENVIRONMENT
       Note:  The environment variable option settings haven't been maintained well.  See the source code if these are of interest.

NOTES
       Numeric  options:  Some  numeric options support format characters per '<value>c' (e.g. 10M) where the c format characters are k,m,g,K,M,G.  Lowercase format
       characters are 10^3 based and uppercase are 2^n based, e.g. 1k = 1000, 1K = 1024, 1m = 1,000,000 and 1M = 1,048,576

       Rate limiting: The -b option supports read and write rate limiting at the application level.  The -b option on the  client  also  supports  variable  offered
       loads  through  the <mean>,<standard deviation> format, e.g.  -b 100m,10m. The distribution used is log normal. Similar for the isochronous option. The -b on
       the server rate limits the reads. Socket based pacing is also supported using the --fq-rate long option. This will work with the --reverse and  --full-duplex
       options as well.

       Synchronized  clocks:  The --trip-times option indicates that the client's and server's clocks are synchronized to a common reference.  Network Time Protocol
       (NTP) or Precision Time Protocol (PTP) are commonly used for this. The reference clock(s) error and the synchronization protocols will affect the accuracy of
       any end to end latency measurements.

       Binding  is  done  at  the logical level (ip address or layer 3) using the -B option and at the device (or layer 2) level using the percent (%) separator for
       both the client and the server. On the client, the -B option affects the bind(2) system call, and will set the source ip address and the  source  port,  e.g.
       iperf -c <host> -B 192.168.100.2:6002. This controls the packet's source values but not routing.  These can be confusing in that a route or device lookup may
       not be that of the device with the configured source IP.  So, for example, if the IP address of eth0 is used for -B and the routing table for the destination
       IP  address  resolves  the  output  interface to be eth1, then the host will send the packet out device eth1 while using the source IP address of eth0 in the
       packet.  To affect the physical output interface (e.g. dual homed systems) either use -c <host>%<dev> (requires root) which bypasses this  host  route  table
       lookup,  or  configure  policy  routing per each -B source address and set the output interface appropriately in the policy routes. On the server or receive,
       only packets destined to -B IP address will be received. It's also useful for multicast. For example, iperf -s -B 224.0.0.1%eth0 will only accept  ip  multi‐
       cast  packets  with  dest  ip 224.0.0.1 that are received on the eth0 interface, while iperf -s -B 224.0.0.1 will receive those packets on any interface, Fi‐
       nally, the device specifier is required for v6 link-local, e.g. -c [v6addr]%<dev> -V, to select the output interface.

       Reverse, full-duplex, dualtest (-d) and tradeoff (-r): The --reverse (-R) and --full-duplex options can be confusing when compared to the  older  options  of
       --dualtest  (-d) and --tradeoff (-r). The newer options of --reverse and --full-duplex only open one socket and read and write to the same socket descriptor,
       i.e. use the socket in full duplex mode.  The older -d and -r open second sockets in the opposite direction and do not use a socket in full duplex mode. Note
       that  full  duplex  applies to the socket and not to the network devices and that full duplex sockets are supported by the operating systems regardless if an
       underlying network supports full duplex transmission and reception.  It's suggested to use --reverse if you want to test through a NAT  firewall  (or  -R  on
       non-windows systems). This applies role reversal of the test after opening the full duplex socket.  (Note: Firewall piercing may be required to use -d and -r
       if a NAT gateway is in the path.)

       Also, the --reverse -b <rate> setting behaves differently for TCP and UDP. For TCP it will rate limit the read side, i.e. the iperf client (role reversed  to
       act  as a server) reading from the full duplex socket.  This will in turn flow control the reverse traffic per standard TCP congestion control. The --reverse
       -b <rate> will be applied on transmit (i.e. the server role reversed to act as a client) for UDP since there is no flow control with UDP. There is no  option
       to directly rate limit the writes with TCP testing when using --reverse.

       TCP  Connect  times:  The  TCP  connect  time  (or  three way handshake) can be seen on the iperf client when the -e (--enhanced) option is set. Look for the
       ct=<value> in the connected message, e.g.in '[ 3] local 192.168.1.4 port 48736 connected with 192.168.1.1 port 5001 (ct=1.84 ms)' shows the  3WHS  took  1.84
       milliseconds.

       Little's Law in queueing theory is a theorem that determines the average number of items (L) in a stationary queuing system based on the average waiting time
       (W) of an item within a system and the average number of items arriving at the system per unit of time (lambda). Mathematically, it's L = lambda * W. As used
       here, the units are bytes. The arrival rate is taken from the writes.

       Network  power:  The network power (NetPwr) metric is experimental. It's a convenience function defined as throughput/delay.  For TCP transmits, the delay is
       the sampled RTT times.  For TCP receives, the delay is the write to read latency.  For UDP the delay is the end/end latency.  Don't  confuse  this  with  the
       physics  definition  of power (delta energy/delta time) but more of a measure of a desirable property divided by an undesirable property. Also note, one must
       use -i interval with TCP to get this as that's what sets the RTT sampling rate. The metric is scaled to assist with human readability.

       Multicast: Iperf 2 supports multicast with a couple of caveats. First, multicast streams cannot take advantage of the -P option. The  server  will  serialize
       multicast  streams.  Also,  it's highly encouraged to use a -t on a server that will be used for multicast clients. That is because the single end of traffic
       packet sent from client to server may get lost and there are no redundant end of traffic packets.  Setting -t on the server will kill the  server  thread  in
       the event this packet is indeed lost.

       Fast Sampling: Use ./configure --enable-fastsampling and then compile from source to enable four digit (e.g. 1.0000) precision in reports' timestamps. Useful
       for sub-millisecond sampling.

DIAGNOSTICS
       Use ./configure --enable-thread-debug and then compile from source to enable both asserts and advanced debugging of the tool itself.

BUGS
       See https://sourceforge.net/p/iperf2/tickets/

AUTHORS
       Iperf2, based from iperf (originally written by Mark Gates and Alex Warshavsky), has a goal of maintenance with some feature  enhancement.   Other  contribu‐
       tions  from  Ajay Tirumala, Jim Ferguson, Jon Dugan <jdugan at x1024 dot net>, Feng Qin, Kevin Gibbs, John Estabrook <jestabro at ncsa.uiuc.edu>, Andrew Gal‐
       latin <gallatin at gmail.com>, Stephen Hemminger <shemminger at linux-foundation.org>, Tim Auckland <tim.auckland at gmail.com>, Robert J. McMahon <rjmcmahon
       at rjmcmahon.com>

SEE ALSO
       accept(2),bind(2),close(2),connect(2),fcntl(2),getpeername(2),getsockname(2),getsockopt(2),listen(2),read(2),recv(2),select(2),send(2),setsockopt(2),shut‐
       down(2),write(2),ip(7),socket(7),tcp(7),udp(7)

       Source code at http://sourceforge.net/projects/iperf2/

       "Unix Network Programming, Volume 1: The Sockets Networking API (3rd Edition) 3rd Edition" by W. Richard Stevens (Author), Bill Fenner  (Author),  Andrew  M.
       Rudoff (Author)

NLANR/DAST                                                                   APRIL 2008                                                                     IPERF(1)
