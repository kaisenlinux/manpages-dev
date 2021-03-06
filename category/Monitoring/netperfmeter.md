netperfmeter(1)                                                                 BSD General Commands Manual                                                                netperfmeter(1)

NAME
     netperfmeter — Network Performance Meter

SYNOPSIS
     netperfmeter [Port]
     netperfmeter [Destination:Port] -control-over-tcp -local=Address[,Address,...] -controllocal=Address[,Address,...] -runtime=Seconds -config=Name -scalar=Name -vector=Name
                  -activenodename=Description -passivenodename=Description -quiet -verbose -verbosity=Level -v6only -pathmgr=name -scheduler=name -sndbuf=bytes -rcvbuf=bytes -tcp -sctp
                  -udp -dccp [FLOWSPEC] [...]

DESCRIPTION
     netperfmeter is a network performance meter for the UDP, TCP, MPTCP, SCTP and DCCP transport protocols. It simultaneously transmits bidirectional flows to an endpoint and measures
     the resulting flow bandwidths. The results are written as vector and scalar files.

ARGUMENTS
     The following arguments have to be provided:

     Port    The port number for the passive side's data socket. The port number of the control socket will be port+1. Specifying a port number turns netperfmeter in passive mode, i.e.
             it will wait for incoming connections.

     Destination:Port
             Specifies the destination endpoint to connect to. This will turn netperfmeter in active mode, i.e. it will connect to the specified remote endpoint.

     -control-over-tcp
             Use TCP instead of SCTP for the control connection. This is useful for NAT traversal.

     -local=Address[,Address,...]
             Specifies address(es) of the local *data* endpoint. For TCP, UDP and DCCP, only the first address is used!  On an active node, this option applies to the following flows,
             i.e. it must be set before specifying a flow!

     -controllocal=Address[,Address,...]
             Specifies address(es) of the local *control* endpoint (SCTP or TCP). For TCP, only the first address is used!

     -runtime
             Specifies the measurement runtime in seconds. After the given time span, netperfmeter will finish the measurement.

     -config=Name
             Specifies the name of the configuration file to write. Default is output.config.

     -vector=Name
             Specifies the name pattern of the vector files to write. If the suffix of this name is .bz2, the file will be BZip2-compressed on the fly. The vector name is automatically
             extended to name the flow vector files by adding -<active|passive>-<flow_id>-<stream_id> before the suffix.  Default is vector.vec.bz2, hence the name of the vector file for
             flow 5, stream 2 on the passive node will be vector-passive-00000005-0002.vec.bz2.

     -scalar=Name
             Specifies the name pattern of the scalar files to write. If the suffix of this name is .bz2, the file will be BZip2-compressed on the fly. The scalar name is automatically
             extended to name the flow scalar files by adding -<active|passive>-<flow_id>-<stream_id> before the suffix.  Default is scalar.vec.bz2, hence the name of the scalar file for
             flow 5, stream 2 on the passive node will be scalar-passive-00000005-0002.vec.bz2.

     -activenodename=Description
             Sets a textual description of the active node (e.g. Client).

     -passivenodename=Description
             Sets a textual description of the passive node (e.g. Server).

     -quiet  Reduces verbosity of log output. May be specified multiple times.

     -verbose
             Increases verbosity of log output. May be specified multiple times.

     -verbosity=Level
             Sets the verbosity of the log output to a given level, from 0 (lowest) to 6 (highest).

     -v6only
             Use sockets with IPv6 only (by setting IPV6_V6ONLY socket option).

     -pathmgr=name
             Set MPTCP path manager for the passive node (MPTCP for Linux only. Requires socket options kernel patch!).  On an active node, this option applies to the following flows,
             i.e. it must be set before specifying a flow!

     -scheduler=name
             Set MPTCP scheduler for the passive node (MPTCP for Linux only. Requires socket options kernel patch!).  On an active node, this option applies to the following flows, i.e.
             it must be set before specifying a flow!

     rcvbuf=bytes
             Sets the receiver buffer size (on the listening socket) to the given number of bytes.

     sndbuf=bytes
             Sets the sender buffer size (on the listening socket) to the given number of bytes.

     -sctp   Establish a new SCTP association. The streams of this association must be specified by one or more FLOWSPEC specifications as following parameters.

     -tcp    Establish a new TCP or MPTCP connection. The flow of this connection must be specified by a FLOWSPEC specification as following parameter. MPTCP support in NetPerfMeter is
             realized as additional "MPTCP" socket (i.e. another TCP socket, but bound to another port number and with CMT enabled). That is, for MPTCP usage, it must contain the option
             cmt=mptcp (see below) to usage the MPTCP socket instead of the TCP socket.

     -udp    Establish a new UDP connection. The flow of this connection must be specified by a FLOWSPEC specification as following parameter.

     -dccp   Establish a new DCCP connection. The flow of this connection must be specified by a FLOWSPEC specification as following parameter. Note, that DCCP is not available on all
             platforms yet. Currently, only Linux provides DCCP in its official kernel.

     FLOWSPEC
             Specifies a new flow. The format is: outgoing_frame_rate:outgoing_frame_size:incoming_frame_rate:incoming_frame_size:option:...  The first four parameters (outgo‐
             ing_frame_rate:outgoing_frame_size:incoming_frame_rate:incoming_frame_size:option) may be substituted by the option "default", creating a flow with some more or less useful
             default parameters.

             outgoing_frame_rate
                     The frame rate of the outgoing transfer (i.e. active node to passive node). If set to const0, the sender will be saturarted, i.e. it will try to send as much as pos‐
                     sible.

             outgoing_frame_size
                     The frame size of the outgoing transfer (i.e. active node to passive node). If set to const0, there will be *no* data transmission in this direction.

             incoming_frame_rate
                     The frame rate of the incoming transfer (i.e. passive node to active node). See outgoing_frame_rate for details.

             incoming_frame_size
                     The frame size of the incoming transfer (i.e. active node to passive node). See outgoing_frame_size for details.

             Possible options:

                     id=Flow Identifier
                             Sets an ID number for the flow. The IDs within a measurement must be unique!

                     description=Description
                             Sets a textual description of the flow (e.g. HTTP-Flow). Do not use spaces in the description!

                     maxmsgsize=Bytes
                             Splits frames into messages of at most the given number of bytes. Messages may not exceed 65535 bytes.

                     defragtimeout=Milliseconds
                             Messages not received within this timeout after the last successfully received message are accounted as lost. NOTE: this also happens if the transport proto‐
                             col is reliable and the message is actually received later!

                     unordered=Fraction
                             Specifies the fraction of the messages that will be sent in unordered mode (SCTP only).

                     ordered=Fraction
                             Specifies the fraction of the messages that will be sent in ordered mode (SCTP only).

                     reliable=Fraction
                             Specifies the fraction of the messages that will be sent in reliable mode (SCTP only).

                     unreliable=Fraction
                             Specifies the fraction of the messages that will be sent in unreliable mode (SCTP only).

                     rtx_timeout=Milliseconds
                             Sets the retransmission timeout for unreliable messages (SCTP only; not available on all platforms!)

                     rtx_trials=Trials
                             Sets the retransmission trials for unreliable messages (SCTP only; not available on all platforms!)

                     rcvbuf=Bytes
                             Sets the receiver buffer size to the given number of bytes.

                     sndbuf=Bytes
                             Sets the sender buffer size to the given number of bytes.

                     onoff=t1,t2,...[,repeat]
                             A list of time stamps when the flow should be activated or deactivated. If onoff is given, the flow is off at startup. At t1, it will be turned on; at t2, it
                             will be turned off, etc.. Time stamps can be given as absolute values (e.g. onoff=0,10,30 - to turn on at t=0, turn off at t=10 and turn on again at t=30 un‐
                             til end of measurement) or relative values (e.g. on=10,+30,+60 - to turn on at t=10, turn off at t=40 and turn on again at t=100 until end of measurement).
                             A repetition of the list is possible with the keyword "repeat" at the end of the list. Then, all values need to be relative values and the number of items
                             must be even.

                     error_on_abort=on|off
                             By default, the active side stops with an error when a transmission tails (e.g. on connection abort). This parameter turns this behaviour on or off.

                     nodelay=on|off
                             Deactivate Nagle algorithm (TCP and SCTP only; default: off).

                     debug=on|off
                             Set debug mode on socket (currently: MPTCP for Linux only. Requires socket options kernel patch!).

                     ndiffports=number
                             Set number of different MPTCP subflows (MPTCP for Linux only. Requires socket options kernel patch!).

                     -v6only
                             Use socket with IPv6 only (by setting IPV6_V6ONLY socket option).

                     pathmgr=name
                             Set MPTCP path manager (MPTCP for Linux only. Requires socket options kernel patch!).

                     scheduler=name
                             Set MPTCP scheduler (MPTCP for Linux only. Requires socket options kernel patch!).

                     cc=name
                             Set congestion control name (TCP and MPTCP for Linux only).

                     cmt=off|cmt|cmtrpv1|cmtrpv2|like-mptcp|mptcp-like|mptcp
                             Configures usage of Concurrent Multipath Transfer (CMT): off (turned off; default), cmt (independent paths), cmtrpv1 (CMT/RPv1), cmtrpv1 (CMT/RPv2),
                             mptcp/like-mptcp/mptcp-like (MPTCP), 0-255 (custom value).  Currently only supported by CMT-SCTP on FreeBSD systems and MPTCP on Linux systems. Note: CMT for
                             MPTCP always uses MPTCP congestion control.

EXAMPLES
     Some netperfmeter usage examples:

     netperfmeter 9000
             Start in passive mode, i.e. accepting connections, on port 9000.

     netperfmeter 172.16.255.254:9000 -vector=output.vec.bz2 -scalar=output.sca.bz2 -sctp const5:exp1000:const3:exp500:description="Alpha":onoff=+10
             const5:exp1000:const3:exp500:description="Beta":onoff=+30 -tcp const5:exp1000:const3:exp500:description="Gamma":onoff=+60 -runtime=300
             Start in active mode, i.e. establish connection to 172.16.255.254, port 9000.  Frames will be segmented into messages of up to 4096 bytes.  Write vectors to output.vec.bz2
             (BZip2-compressed).  Write scalars to output.sca.bz2 (BZip2-compressed).  Establish SCTP association.  At t=10s, start flow "Alpha" as first stream of this association, us‐
             ing a frame rate of 5 (constant) and average frame size of 1000 bytes (negative exponential distribution) for the outgoing data and a frame rate of 3 (constant) and average
             frame size of 500 bytes (negative exponential distribution) for the incoming data.  At t=30s, start flow "Beta" as second stream on the SCTP association (same parameters as
             flow "Alpha").  Start TCP connection.  At t=60s, start flow "Gamma" over the TCP connection (same parameters as flow "Alpha").  At t=300s, stop the measurement.

     netperfmeter 172.16.255.254:9000 -control-over-tcp -tcp const2:const1000
             Start in active mode, i.e. establish connection to 172.16.255.254, port 9000. The control connection uses TCP instead of SCTP.

AUTHORS
     Thomas Dreibholz
     https://www.uni-due.de/~be0001/netperfmeter
     mailto://dreibh@iem.uni-due.de

netperfmeter                                                                          April 29, 2016                                                                          netperfmeter
