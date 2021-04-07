PCAPFIX(1)                                                                        General Commands Manual                                                                       PCAPFIX(1)

NAME
       pcapfix - repair pcap and pcapng files

SYNOPSIS
       pcapfix [-d] [-n] [-o filename] [-t DATA_LINK_TYPE] [-v] filename

DESCRIPTION
       Pcapfix is a tool to repair your damaged or corrupted pcap and pcapng files. It is written in C and released under the GNU General Public License.

       To fix your pcap files the tool first checks for an intact pcap global header and repairs it if there are some corrupted bytes. It there seems to be no global header at all, pcap‐
       fix adds a self-created one at the beginning of the file. In a second step the tool tries to find pcap packet headers inside the file, below the global header. It  checks  if  the
       values are correct (or seem to be correct) and tries to repair a packet if there is something wrong.

       To  fix  your pcapng files the tool loops through all packet headers that can be found in the file. It checks for mandatory Section Header and Interface Description Block and cre‐
       ates them if missing. Pcapfix checks for correct block sizes and valid option fields. If something is wrong, invalid fields are repaired (if possible) or skipped and  adjusted  to
       finally get a proper pcapng file.

OPTIONS
       -d, --deep-scan
            Force deep scan (default = 0)
            -s, --soft-mode Switch to soft mode packet detection (default = 0)
            This option will force pcapfix to scan for any packet inside the whole file (instead of the first 262144 (max snaplen) bytes only).

       -n, --pcapng
            Force File Format to PCAPNG (default = 0)
            This option will force pcapfix to repair the input file as it were in pcapng format (useful for destroyed file headers).

       -o, --outfile <filename>
            Set the output file name. Default will be input file prepended by "fixed_".

       -t, --data-link-type <nr>
            Data Link Type (default = 1)
            (See NOTES section below.)

       -v, --verbose
            Enable verbose output (default = 0)
            You can use multiple -v options to increase verbosity.
            An verbosity of 2 will result in very much output data during package search.

EXAMPLES
       Repair the pcap file using deep scan mode, because large blocks of the file are corrupted.
            pcapfix -d file.pcap

       Repair the file damaged_file.pcapng using verbose output.
            pcapfix -v damaged_file.pcapng

       Repair the file wlan_traffic.pcap and force the data link type to be 119 (PRISM HEADER).
            pcapfix -t 119 wlan_traffic.pcap

       Repair the file damaged.pcapng which file header is corrupted and force its format to be pcapng.
            pcapfix -n damaged.pcapng

NOTES
       Output file name

            If  you  want  to  perform the reparation process on the input file without creating a separate output file - e.g. in case you are out of space, you can use the -o option and
            give the same name as the input file.

            WARNING: This process is DANGEROUS and may destroy your data. You should only use this option if you know what you are doing and accept the risk of losing the input file.

       Deep scan

            In classic pcap files, pcapfix will only scan the first 65536 bytes (maximum packet length) for a proper first packet. If you want to force packet detection even  above  this
            limit (e.g. because your file has been heavily destroyed) you can use the deep scan option (-d).

            This  option  is  not  necessary  for  pcapng files because the whole file is arranged in blocks that are 'unlimited' by default. In result pcapfix will always scan the whole
            pcapng file for further blocks.

       Soft mode

            There are programs that breach some pcap conventions when writing files. Ignoring those rules do not break the pcap file but they make it difficult for  pcapfix  to  identify
            the packets in case of broken files.

            By default pcapfix uses hard mode. If you encounter problems when repairing files, try to switch to soft mode (-s). Pcapfix will then try to find the packets in a more toler‐
            ant way.

       PCAPNG Format

            Pcapfix will try to identify the file format to repair (pcap / pcapng) before doing any further checks. If the header itself is corrupted, it will assume  the  format  to  be
            classic pcap. To change this behaviour you can force the tool to do a pcapng-repair by supplying -n (--pcapng) option.

       Verbosity

            You can use multiple -v options to increase verbosity. An verbosity of 2 will result in very much output data during package search.

       ASCII-mode transferred Files (FTP)

            Pcapfix  is  able  to repair pcap files that have been transferred in ascii-mode via FTP. In those files a proper pcap structure will be created only to make them readable by
            wireshark etc. The data inside the packets (and some pcap headers) might still be corrupted. To repair those packets a deeper look inside the packet structure (e.g. checksum)
            will be necessary.

       Data Link Types

            You  can  make pcapfix change / select your data link type by supplying -t option. Although you may select a data link type number between 0 and 255, only the following types
            are assigned: If the data link type field is corrupt, pcapfix will select LINKTYPE_ETHERNET by default.

            See http://www.tcpdump.org/linktypes.html for further information.

            NUMBER    LINK_TYPE

            0    LINKTYPE_NULL
            1    LINKTYPE_ETHERNET
            6    LINKTYPE_TOKEN_RING
            7    LINKTYPE_ARCNET_BSD
            8    LINKTYPE_SLIP
            9    LINKTYPE_PPP
            10   LINKTYPE_FDDI
            50   LINKTYPE_PPP_HDLC
            51   LINKTYPE_PPP_ETHER
            100  LINKTYPE_ATM_RFC1483
            101  LINKTYPE_RAW
            104  LINKTYPE_C_HDLC
            105  LINKTYPE_IEEE802_11
            107  LINKTYPE_FRELAY
            108  LINKTYPE_LOOP
            113  LINKTYPE_LINUX_SLL
            114  LINKTYPE_LTALK
            117  LINKTYPE_PFLOG
            119  LINKTYPE_PRISM_HEADER
            122  LINKTYPE_IP_OVER_FC
            123  LINKTYPE_SUNATM
            127  LINKTYPE_IEEE802_11_RADIO
            129  LINKTYPE_ARCNET_LINUX
            138  LINKTYPE_APPLE_IP_OVER_IEEE1394
            139  LINKTYPE_MTP2_WITH_PHDR
            140  LINKTYPE_MTP2
            141  LINKTYPE_MTP3
            142  LINKTYPE_SCCP
            143  LINKTYPE_DOCSIS
            144  LINKTYPE_LINUX_IRDA
            147-162   LINKTYPE_USER0-LINKTYPE-USER15
            163  LINKTYPE_IEEE802_11_RADIO_AVS
            166  LINKTYPE_PPP_PPPD
            169  LINKTYPE_GPRS_LLC
            177  LINKTYPE_LINUX_LAPD
            187  LINKTYPE_BLUETOOTH_HCI_H4
            189  LINKTYPE_USB_LINUX
            192  LINKTYPE_PPI
            195  LINKTYPE_IEEE802_15_4
            196  LINKTYPE_SITA
            197  LINKTYPE_ERF
            201  LINKTYPE_BLUETOOTH_HCI_H4_WITH_PHDR
            202  LINKTYPE_AX25_KISS
            203  LINKTYPE_LAPD
            204  LINKTYPE_PPP_WITH_DIR
            205  LINKTYPE_C_HDLC_WITH_DIR
            206  LINKTYPE_FRELAY_WITH_DIR
            209  LINKTYPE_IPMB_LINUX
            215  LINKTYPE_IEEE802_15_4_NONASK_PHY
            220  LINKTYPE_USB_LINUX_MMAPPED
            224  LINKTYPE_FC_2
            225  LINKTYPE_FC_2_WITH_FRAME_DELIMS
            226  LINKTYPE_IPNET
            227  LINKTYPE_CAN_SOCKETCAN
            228  LINKTYPE_IPV4
            229  LINKTYPE_IPV6
            230  LINKTYPE_IEEE802_15_4_NOFCS
            231  LINKTYPE_DBUS
            235  LINKTYPE_DVB_CI
            236  LINKTYPE_MUX27010
            237  LINKTYPE_STANAG_5066_D_PDU
            239  LINKTYPE_NFLOG
            240  LINKTYPE_NETANALYZER
            241  LINKTYPE_NETANALYZER_TRANSPARENT
            242  LINKTYPE_IPOIB
            243  LINKTYPE_MPEG_2_TS
            244  LINKTYPE_NG40
            245  LINKTYPE_NFC_LLCP

DEVELOPMENT
       This tool is still under development! Please send any further wishes, feature requests or problems in compiling and execution to  ruport@f00l.de.  Additionally  You  may  send  me
       pcap/pcapng files that could not be repaired too in order to improve pcapfix and get your file repaired.

       For further information visit the pcapfix homepage at http://f00l.de/pcapfix/.

MESSAGES AND EXIT CODES
        1   , file was corrupted and has been repaired
        0   , file is proper; nothing to repair
       -1   , invalid options / parameters given
       -2   , cannot open input file for reading
       -3   , cannot open output file for writing
       -4   , input file is empty
       -5   , input file is too small
       -6   , file type not supported
       -11  , not a pcap/pcapng file
       -12  , unable to repair the file
       -13  , EOF while reading input file
       -255 , unknown error

HISTORY
       1.1.4 - 22.01.2019
            * added support for extended pcap file format (kuznetzov)
            * fixed dtl 113 (linux cooked) handling (thanks to Andre Luyer)
            * improved hard and soft mode checks for younger/older packets
            * minor fixes and improvements

       1.1.3 - 04.09.2018
            * implemtented soft mode (for plausibility checks)

       1.1.2 - 16.07.2018
            * fixed cross compiling (thanks to Helmut Grohne)
            * increased maximum snap length to 262144

       1.1.1 - 25.12.2017
            * added write buffers and support to perform repair process without creation of a separate output file
            * fixed another MacOS build problem
            * fixed minor bugs

       1.1.0 - 31.08.2013
            * added checks for valid pcapng format (epb)
            * added --outfile parameter to chose fixed file name
            * improved pcapng packet alignment (pb, spb, nrb)
            * improved pcapng option fields handling
            * improved status and verbosity outputs
            * fixed reparation bugs with swapped pcap files
            * fixed MacOS compile problem
            * fixed windows output file name extension missing
            * fixed many minor bugs

       1.0.2 - 18.02.2013
            * added support for files larger than 2GB on 32bit systems

       1.0.1 - 03.11.2013
            * added reparation block type id zero (pcapng)
            * added reparation of capture length inside EPB (pcapng)
            * set data link type to ethernet on missing header (pcap)
            * changed missing pcap header threshold
            * fixed minor bugs

       1.0.0 - 12.10.2013
            * added pcapng support
            * added nanoseconds support (Issue #1)
            * improved console output
            * minor bugs fixed

       0.7.3 - 16.06.2013
            * added snoop file detection
            * added large file support on 32bit architectures
            * improved missing header detection
            * fixed compiling errors on hurd and kfreebsd architectures
            * fixed minor bugs

       0.7.2 - 30.03.2013
            * compiles on Apple systems properly now
            * fixed problems installing man-pages (on some systems)

       0.7.1 - 03.01.2013
            * REALLY fixed file pointer exception on windows64 systems
            * updated man-page

       0.7 - 18.10.2012
            * added support for swapped (big endian) pcap files
            * compiles on OpenBSD properly now
            * fixed file pointer exception on windows64 systems
            * fixed detection bug when corrupted packet is larger than 65536 bytes
            * fixed minimal packet limit to cope with wlan traffic

       0.6 - 20.05.2012
            * added deep scan option (-d) to force packet detection inside the whole file
            * detects ascii-corruption in pcap header (unix->win)
            * improved global header and packet checks (0 <= usec <= 1000000)
            * repair files that first packet is entirely corrupted
            * repair oversized packets
            * improved last packet mismatch correction
            * fixed reading packets over EOF

       0.5 - 05.05.2012
            * repair files that packets were not saved chronologically
            * detect and repair overlapping packets
            * detect and repair cut-off pcap files
            * detect and repair ascii-mode transferred pcap files (pcap headers only!)
            * added progress bar
            * added man-page

       0.4 - 27.04.2012
            * completely redesigned packet detection algorithm (replaced bottom-up-recovery with brute-force-packet-guessing)
            * improved detection rate by additional plausibility checks
            * increased speed when repairing large pcap files

       0.3 - 31.03.2012
            * when recovering packets size will be checked to be smaller than 65536
            * added recognition when a file does not seem to be a pcap file at all
            * compiles on windows systems properly now (tested with dev-cpp)
            * added option to manually select data link type

       0.2 - 11.03.2012
            * pcapfix compiles on 64bit systems correctly now
            * fixed segfault when no filename was given
            * fixed (input) file not found bug on directory differ
            * added recognition of other data link types beside ethernet in global header
            * added source code documentation

       0.1 - 01.03.2012
            * this is the first version, everything has changed thou :-)

COPYRIGHT
       Copyright (c) 2012-2018 Robert Krause

       Pcapfix is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3
       of the License, or any later version.

       Pcapfix is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
       the GNU General Public License for more details.

AUTHOR
       Written by Robert Krause <ruport@f00l.de>.

                                                                                        22 JAN 2019                                                                             PCAPFIX(1)
