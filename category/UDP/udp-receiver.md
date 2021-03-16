UDP-RECEIVER(1)                                                                Udpcast                                                               UDP-RECEIVER(1)

NAME
       udp-receiver - receive files broadcast by udp-sender

SYNOPSIS
       ./udp-receiver [--file file] [--pipe pipe] [--portbase portbase] [--interface net-interface] [--log file] [--ttl time-to-live] [--mcast-rdv-address mcast-
       rdv-address] [--nokbd] [--exitWait milliseconds] [--stat-period n] [--print-uncompressed-position flag]

DESCRIPTION
       "Udp-receiver" is used to receive files sent by "udp-sender" (for instance a disk image).

OPTIONS
   Basic options
       --file file
           Writes received data to file. If this parameter is not supplied, received data is written to stdout instead.

       --pipe command
           Sends data through pipe after receiving it. This is useful for decompressing the data, or for filling in unused filesystem blocks that may have been
           stripped out by udp-sender. The command gets a direct handle on the output file or device, and thus may seek inside it, if needed. "Udpcast" itself also
           keeps a handle on the file, which is used for an informational progress display. The command's stdin is a pipe from udp-receiver. Example: "udp-receiver
           -p "gzip -dc""

       --log file
           Logs some stuff into file.

       --nosync
           Do not open target in synchronous mode. This is the default when writing to a file or a pipe.

       --sync
           Write to target in synchronous mode. This is the default when writing to a device (character or block)

       --nokbd
           Do not read start signal from keyboard, and do not display any message telling the user to press any key to start.

       --start-timeout sec
           receiver aborts at start if it doesn't see a sender within this many seconds. Furthermore, the sender needs to start transmission of data within this
           delay. Once transmission is started, the timeout no longer applies.

       --receive-timeout sec
           receiver aborts during transmission if it doesn't see a packet from the sender within this many seconds. This timeout only applies once transmission has
           started.

   Networking options
       --portbase portbase
           Default ports to use for udpcast. Two ports are used: portbase and portbase+1 . Thus, Portbase must be even. Default is 9000. The same portbase must be
           specified for both "udp-sender" and "udp-receiver".

       --interface interface
           Network interface used to send out the data. Default is "eth0"

       --ttl ttl
           Time to live for connection request packet (by default connection request is broadcast to the LAN's broadcast address. If ttl is set, the connection
           request is multicast instead to 224.0.0.1 with the given ttl, which should enable udpcast to work between LANs. Not tested though.

       --mcast-rdv-address address
           Uses a non-standard multicast address for the control connection (which is used by the sender and receivers to "find" each other). This is not the
           address that is used to transfer the data. By default "mcast-rdv-address" is the Ethernet broadcast address if "ttl" is 1, and 224.0.0.1 otherwise. This
           setting should not be used except in very special situations, such as when 224.0.0.1 cannot be used for policy reasons.

       --exit-wait milliseconds
           When transmission is over, receiver will wait for this time after receiving the final REQACK. This is done in order to guard against loss of the final
           ACK. Is 500 milliseconds by default.

       --ignore-lost-data
           Do not stop reception when data loss is detected, but instead fill with random data. This is useful for multimedia transmission where 100% integrity is
           not need.

   Statistics options
       --stat-period seconds
           Every so much milliseconds, print some statistics to stderr: how much bytes received so far log, position in uncompressed file (if applicable), overall
           bitrate... By default, this is printed every half second.

       --print-uncompressed-position flag
           By default, udp-receiver only prints the position in uncompressed file if the 2 following conditions are met:

           •   Output is piped via a compressor ("-p " option).

           •   The final output is seekable (file or device)

           With the "--print-uncompressed-position", options, you can change this behavior:

           •   If flag is 0, uncompressed position will never be printed, even if above conditions are met

           •   If flag is 1, uncompressed position will always be printed, even if above conditions are not met

SEE ALSO
       udp-sender

AUTHOR
       Alain Knaff

current                                                                     July 29, 2019                                                            UDP-RECEIVER(1)
