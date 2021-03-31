discover(1)                                                                         General Commands Manual                                                                         discover(1)

NAME
       discover — hardware detection utility

SYNOPSIS
       discover [DATA_OPTIONS]  [DISPLAY_OPTIONS]  [--bus-summary]  [bus ...]

       discover [DATA_OPTIONS]  [DISPLAY_OPTIONS] --type-summary  [type ...]

       discover [DATA_OPTIONS] --data-path=path/to/data ...  [--data-version=version]  [--normalize-whitespace]  [--format=format string]  [type | id ...]

       DATA_OPTIONS

                    •  -d | --disable-bus=bus

                    •  -e | --enable-bus=bus

                    •  --insert-url=url

                    •  --append-url=url

                    •  -v | --verbose

       DISPLAY_OPTIONS

                    •  --model | --no-model

                    •  --model-id | --no-model-id

                    •  --vendor | --no-vendor

                    •  --vendor-id | --no-vendor-id

Description
       discover provides an extensible hardware detection and reporting interface. Hardware information is stored in an XML data format and can be retrieved across the network.

       Fundamental modes of operation:

          •  Display  a list of hardware devices based on type of device or system bus on which the devices reside, via --type-summary or --bus-summary (the latter of which is the default be‐
             havior).

          •  Query specified data for attached hardware, via --data-path.

Options
       -h | --help
                 Display a simple help message.

       -v | --verbose
                 Instruct the tool to provide feedback as it operates. This will affect the output as discover parses certain arguments, so this should appear early in the command line.

       -V | --version
                 Display the tool name and version.

       -b | --bus-summary
                 This is the default behavior: Display basic information regarding all devices on the appropriate buses. See "Selecting Buses" >.

       -t | --type-summary
                 Summarize devices by class of hardware. Examples of valid device types include broadband, fixeddisk, display, and network.  See "Device Types" >.

       --data-path=path/to/data
                 Query matching devices for detailed information.  Device-specific data is stored in a hierarchical fashion, and the query argument comprises strings naming each level in that
                 hierarchy.

                 Typically, the top-level component of the data path will be the ``platform'' that will need the information, such as linux or xfree86. For example, to retrieve the Linux ker‐
                 nel module name for a piece of hardware, the --data-path argument would be linux/module/name.

                 If multiple --data-path           arguments are given and no format string (see --format) is provided, only the last path is used.

                 See also the --data-version           argument.

       --data-version=version
                 Specify a version string for the platform that will use the information specified by the argument to --data-path.

                 This string must be in dotted-decimal notation in order to be matched against a range of values, and thus may be shorter than the real version.

       --format=format string
                 Dictate the output of the results of the queries specified by --data-path arguments.  This format string should follow printf(3) specifications, although only %s  and  appro‐
                 priate  flags, precision, and width values are supported (or make sense); literal text and %%           can also be used.  The behavior when the string is poorly formatted is
                 undefined.  See also --normalize-whitespace.

       -d | --disable-bus=bus
                 Use this option to override the list of buses to scan by default as defined in discover.conf. Use all as an argument to disable all buses; this is useful only if followed  by
                 --enable-bus (or -e) arguments.

       -e | --enable-bus=bus
                 Specify a bus to be scanned.

       --insert-url=url
                 Insert  a  URL  at the head of the list of network resources to include in the search for hardware information.  Earlier data overrides later data; to override the local data
                 sources, insert URLs into the list.  See also --append-url.

       --append-url=url
                 Append a URL to the end of the list of network resources to search for hardware information. See also --insert-url.

       --model   Include the model description in summary information. This is enabled by default.

       --model-id
                 Include the numeric model identifier in summary information.

       --no-model
                 Do not include the model description in summary information.

       --no-model-id
                 Do not include the numeric model identifier in summary information. This is the default.

       --vendor  Include the vendor description in summary information. This is enabled by default.

       --vendor-id
                 Include the numeric vendor identifier in summary information.

       --no-vendor
                 Do not include the vendor description in summary information.

       --no-vendor-id
                 Do not include the numeric vendor identifier in summary information. This is the default.

       --normalize-whitespace
                 Consolidate whitespace in the results of a --data-path query.  The default is not to do so, which faithfully reproduces all text in the raw XML data.

                 With this option enabled, leading and trailing whitespace is removed, and any consecutive internal whitespaces are compressed to a single space character.

Selecting Buses
       discover.conf defines two lists of system buses: one to scan by default (used by the discover     command), and one never to scan (used by the Discover library).

       You can override and/or extend the list of default buses with --disable-bus and --enable-bus.  The list of buses not to scan cannot be overridden  without  changing  discover.conf,  so
       that list should be used only for buses that may be dangerous to probe.

       Both arguments take the string ``all'' as a value.

       If  a  bus summary is being performed, which is indicated either by the presence of --bus-summary or the absence of --type-summary and --data-path, any unattached arguments on the com‐
       mand line will be interpreted as the only buses to scan.  This is equivalent to using --disable-bus all before invoking --enable-bus     for the buses of interest.

       The following buses are currently supported by Discover:

          •  ata

          •  pci

          •  pcmcia

          •  scsi

          •  usb

Device Types
       Discover defines its own device types, to which the device types used by each bus are mapped.  Discover     currently recognizes the following device types:

          •  audio

                 A device capable of producing an analog or digital sound signal is an audio device.  Typically, any device commonly referred to as a ``sound card'' is classified by  Discover
                 as an audio device.

          •  bridge

                 A  device that provides access to devices of a different type, commonly on a different bus, is a bridge device.  For instance, consumer PCI chipsets often feature a bridge to
                 ATA (also known as IDE) devices.

          •  broadband

                 An interface device to a computer communications network implemented on top of a technology not explicitly designed for that purpose is a broadband     device.  Examples  in‐
                 clude ISDN terminal adapters as well as DSL and cable ``modems''; analog phone-line modems are not included in this classification (see ``modem'' below).

          •  display

                 A  device controlled by the host machine's CPU and capable of producing an analog or digital video signal for output purposes is a display device.  Typically, any device com‐
                 monly referred to as a ``video card'' is classified by Discover as a display device.

          •  fixeddisk

                 A high-speed, fixed magnetic storage device such as a hard disk drive is a fixeddisk device.  Removable media devices such as floppy disk drives, CD-ROM drives, magneto-opti‐
                 cal devices, tape drives, and Compact Flash card readers are not included in this classification.

          •  humaninput

                 A  device  that receives tactile input from a person for the purpose of directing a computer's activity is a humaninput device.  Examples include keyboards, mice, trackballs,
                 joysticks, gamepads, digital tablets manipulated with a stylus or finger, and so forth.  Input devices that rely upon non-tactile means of determining a person's intent, such
                 as speech-recognition devices or cameras, are not included in this classification.

          •  imaging

                 A  device  that  captures still images for input purposes is an imaging device.  Scanners and digital cameras are examples of imaging devices.  Motion-capture devices such as
                 television tuner cards, webcams, and digital video cameras are not included in this classification.

          •  miscellaneous

                 Any device that cannot logically be classified as another device type is a miscellaneous     device.

          •  modem

                 An analog phone-line modulator/demodulator (modem) is classified by Discover as a modem device.  No other kind of device is so classified.

          •  network

                 An interface device to a conventional computer data communications network that does not require the use of a terminal adapter is a network device.  For example, Ethernet and
                 Token  Ring  network interface cards are network devices.  Analog phone-line modems; terminal adapters for technologies such as ISDN and DSL; and ``cable modems''     are not
                 ``network'' devices.

          •  optical

                 An optical-technology storage device, often using read-only media, is an optical device.  By far the most common examples of these devices are CD-ROM and DVD-ROM drives,  in‐
                 cluding versions of these drives that can ``burn'' (write to) optical discs.

          •  printer

                 A  device  that  renders  visual  output  in  a  permanent  or  semi-permanent  manner to a physical medium is a printer.  Typically, any device colloquially referred to as a
                 ``printer'' is also classified by Discover as a printer.

          •  removabledisk

                 Storage devices that feature removable media using just about any technology except that of magnetic tape, CD-ROM, and DVD-ROM drives are removabledisk devices.  Examples in‐
                 clude floppy disk drives, magneto-optical drives, and Compact Flash card readers.

          •  tape

                 A sequential-access mass storage device using magnetic tape is a tape device.  Commonly used for archival and backup purposes, DAT drives are examples of tape devices.

          •  video

                 A device that produces a real-time digital video signal for input purposes is a video     device.  Webcams, digital video cameras, and television tuners are examples of video
                 devices.  Note that still digital cameras with ``movie'' capability are not considered video devices unless they can transmit the live video signal to the host in real time.

Examples
       Scan the local buses

       # discover
       Intel Corporation 82815 Chipset Host Bridge and Memory Controller Hub
       unknown unknown
       unknown unknown
       unknown unknown
       Intel Corporation 82815 Chipset IDE controller
       Intel Corporation 82815 Chipset USB (A)
       Intel Corporation 82815 System Management bus controller
       ATI Technologies, Inc. Rage 128 Pro GL [PF]
       3Com Corporation 3c905C-TX [Fast Etherlink]
       Ensoniq ES1371 [AudioPCI-97]
       unknown unknown

       View PCI video cards

       # discover -v --type-summary --disable-bus all --enable-bus pci display
       Disabled pci
       Disabled pcmcia
       Disabled scsi
       Disabled usb
       Enabled pci
       Loading XML data... pci Done
       Scanning buses... pci Done
       ATI Technologies, Inc. Rage 128 Pro GL [PF]

       Query for the driver module for XFree86 server version 4.2.0

       # discover --data-path=xfree86/server/device/driver --data-version=4.2.0 display
       ati

       Get model and vendor information by type

       $ discover -t --no-model
       Intel Corporation
       NVIDIA Corporation
       3Com Corporation
       $ discover -t --no-vendor
       82815 System Management bus controller
       Vanta [NV6]
       3c905C-TX [Fast Etherlink]

Files
       /etc/discover.conf.d
                 The directory containing configuration files that control the default behavior for both the discover tool and the Discover library.

       file:///lib/discover/list.xml
                 An XML file containing URLs with hardware information. This list can be extended with --append-url and --extend-url.

Authors
       Josh Bressers, John R. Daily, and G. Branden Robinson developed the current implementation of Discover for Progeny Linux Systems.

       The Linux implementation of the system-dependent interfaces is derived from detect, by MandrakeSoft SA.

See Also
       discover.conf(5), discover-modprobe(8)

                                                                                                                                                                                    discover(1)
