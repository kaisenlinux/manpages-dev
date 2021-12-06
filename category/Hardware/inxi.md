INXI(1)                                                                                 inxi manual                                                                                INXI(1)

NAME
       inxi  - Command line system information script for console and IRC

SYNOPSIS
       inxi

       inxi [-AbBCdDEfFGhiIjJlLmMnNopPrRsSuUVwzZ]

       inxi [-c NUMBER] [--sensors-exclude SENSORS] [--sensors-use SENSORS] [-t [c|m|cm|mc][NUMBER]] [-v NUMBER] [-W LOCATION] [--weather-unit {m|i|mi|im}] [-y WIDTH]

       inxi [--memory-modules] [--memory-short] [--recommends] [--sensors-default] [--slots]

       inxi [-x|-xx|-xxx|-a] -OPTION(s)

       All short form options have long form variants - see below for these and more advanced options.

DESCRIPTION
       inxi is a command line system information script built for console and IRC. It is also used a debugging tool for forum technical support to quickly ascertain users' system config‐
       urations and hardware. inxi shows system hardware, CPU, drivers, Xorg, Desktop, Kernel, gcc version(s), Processes, RAM usage, and a wide variety of other useful information.

       inxi output varies depending on whether it is being used on CLI or IRC, with some default filters and color options applied only for IRC use.  Script colors can be turned  off  if
       desired with -c 0, or changed using the -c color options listed in the STANDARD OPTIONS section below.

PRIVACY AND SECURITY
       In  order to maintain basic privacy and security, inxi used on IRC automatically filters out your network device MAC address, WAN and LAN IP, your /home username directory in par‐
       titions, and a few other items.

       Because inxi is often used on forums for support, you can also trigger this filtering with the -z option (-Fz, for example). To override the IRC filter, you can use the -Z option.
       This can be useful in debugging network connection issues online in a private chat, for example.

USING OPTIONS
       Options can be combined if they do not conflict. You can either group the letters together or separate them.

       Letters  with numbers can have no gap or a gap at your discretion, except when using  -t. Note that if you use an option that requires an additional argument, that must be last in
       the short form group of options. Otherwise you can use those separately as well.

       For example: inxi -AG | inxi -A -G | inxi -b | inxi -c10 | inxi -FxxzJy90 | inxi -bay

       Note that all the short form options have long form equivalents, which are listed below. However, usually the short form is used in examples in order to keep things simple.

STANDARD OPTIONS
       -A, --audio
              Show Audio/sound device(s) information, including device driver. Show running sound server(s). See -xxA to show all sound servers detected.

       -b, --basic
              Show basic output, short form. Same as: inxi -v 2

       -B, --battery
              Show system battery (ID-x) data, charge, condition, plus extra information (if battery present). Uses /sys or, for BSDs without systctl battery  data,  use  --dmidecode  to
              force  its  use.  dmidecode  does not have very much information, and none about current battery state/charge/voltage. Supports multiple batteries when using /sys or sysctl
              data.

              Note that for charge:, the output shows the current charge, as well as its value as a percentage of the available capacity, which can be less than the original  design  ca‐
              pacity. In the following example, the actual current available capacity of the battery is 22.2 Wh.

              charge: 20.1 Wh (95.4%)

              The condition: item shows the remaining available capacity / original design capacity, and then this figure as a percentage of original capacity available in the battery.

              condition: 22.2/36.4 Wh (61%)

              With -x, or if voltage difference is critical, volts: item shows the current voltage, and the min: voltage. Note that if the current is below the minimum listed the battery
              is essentially dead and will not charge.  Test that to confirm, but that's technically how it's supposed to work.

              volts: 12.0 min: 11.4

              With -x shows attached Device-x information (mouse, keyboard, etc.) if they are battery powered.

       --bluetooth - See -E

       -c, --color [0-42]
              Set color scheme. If no scheme number is supplied, 0 is assumed.

       -c [94-99]

              These color selectors run a color selector option prior to inxi starting which lets you set the config file value for the selection.

              NOTE: All configuration file set color values are removed when output is piped or redirected. You must use the explicit runtime -c <color number> option if you  want  color
              codes to be present in the piped/redirected output.

              Color selectors for each type display (NOTE: IRC and global only show safe color set):

       -c 94  - Console, out of X.

       -c 95  - Terminal, running in X - like xTerm.

       -c 96  - GUI IRC, running in X - like XChat, Quassel, Konversation etc.

       -c 97  - Console IRC running in X - like irssi in xTerm.

       -c 98  - Console IRC not in X.

       -c 99  - Global - Overrides/removes all settings.

              Setting a specific color type removes the global color selection.

       -C, --cpu
              Show  full CPU output, including per CPU clock speed and CPU max speed (if available). If max speed data present, shows (max) in short output formats (inxi, inxi -b) if ac‐
              tual CPU speed matches max CPU speed. If max CPU speed does not match actual CPU speed, shows both actual and max speed information. See -x for more options.

              For certain CPUs (some ARM, and AMD Zen family) shows CPU die count.

              The details for each CPU include a technical description e.g. type: MT MCP

              * MT - Multi/Hyper Threaded CPU, more than 1 thread per core (previously HT).

              * MCM - Multi Chip Model (more than 1 die per CPU).

              * MCP - Multi Core Processor (more than 1 core per CPU).

              * SMP - Symmetric Multi Processing (more than 1 physical CPU).

              * UP - Uni (single core) Processor.

              Note that min/max: speeds are not necessarily true in cases of overclocked CPUs or CPUs in turbo/boost mode. See -Ca for alternate base/boost: speed data.

       -d, --disk-full,--optical
              Show optical drive data as well as -D hard drive data. With -x, adds a feature line to the output. Also shows floppy disks if present. Note that there is no current way  to
              get any information about the floppy device that we are aware of, so it will simply show the floppy ID without any extra data. -xx adds a few more features.

       -D, --disk
              Show  Hard  Disk  info.  Shows  total disk space and used percentage. The disk used percentage includes space used by swap partition(s), since those are not usable for data
              storage. Also, unmounted partitions are not counted in disk use percentages since inxi has no access to the used amount.

              If the system has RAID or other logical storage, and if inxi can determine the size of those vs their components, you will see the storage total raw and usable sizes,  plus
              the  percent  used of the usable size. The no argument short form of inxi will show only the usable (or total if no usable) and used percent. If there is no logical storage
              detected, only total: and used: will show. Sample (with RAID logical size calculated):

              Local Storage: total: raw: 5.49 TiB usable: 2.80 TiB used: 1.35 TiB (48.3%)

              Without logical storage detected:

              Local Storage: total: 2.89 TiB used: 1.51 TiB (52.3%)

              Also shows per disk information: Disk ID, type (if present), vendor (if detected), model, and size. See Extra Data Options (-x options) and Admin Extra Data Options  (--ad‐
              min options) for many more features.

       -E, --bluetooth
              Show  bluetooth device(s), drivers. Show Report: with HCI ID, state, address per device (requires bt-adapter or hciconfig), and if available (hciconfig only) bluetooth ver‐
              sion (bt-v).  See Extra Data Options for more.

              If bluetooth shows as status: down, shows bt-service: state and rfkill software and hardware blocked states, and rfkill ID.

              Note that Report-ID: indicates that the HCI item was not able to be linked to a specific device, similar to IF-ID: in -n.

              If your internal bluetooth device does not show, it's possible that it has been disabled, if you try enabling it using for example:

              hciconfig hci0 up

              and it returns a blocked by RF-Kill error, you can do one of these:

              connmanctl enable bluetooth

              or

              rfkill list bluetooth

              rfkill unblock bluetooth

       --filter, --filter-override - See -z, -Z.

       --filter-label
              Filter partition label names from -j, -o, -p, -P, and -Sa (root=LABEL=...). Generally only useful in very specialized cases.

       --filter-uuid
              Filter partition UUIDs from -j, -o, -p, -P, and -Sa (root=UUID=...). Generally only useful in very specialized cases.

       -f, --flags
              Show all CPU flags used, not just the short list. Not shown with -F in order to avoid spamming. ARM CPUs: show features items.

       -F, --full
              Show Full output for inxi. Includes all Upper Case line letters (except -J and -W) plus --swap, -s and -n. Does not show extra verbose options such as -d -f -i -J -l -m  -o
              -p -r -t -u -x unless you use those arguments in the command, e.g.: inxi -Frmxx

       -G, --graphics
              Show Graphic device(s) information, including details of device and display drivers (loaded:, and, if applicable: unloaded:, failed:), display protocol (if available), dis‐
              play server (and/or Wayland compositor), vendor and version number, e.g.:

              Display: x11 server: Xorg 1.15.1

              If protocol is not detected, shows:

              Display: server: Xorg 1.15.1

              Also shows screen resolution(s) (per monitor/X screen), OpenGL renderer, OpenGL core profile version/OpenGL version.

              Compositor information will show if detected using -xx option or always if detected and Wayland.

       -h, --help
              The help menu. Features dynamic sizing to fit into terminal window. Set script global COLS_MAX_CONSOLE if you want a different default value, or use -y <width> to temporar‐
              ily override the defaults or actual window width.

       -i, --ip
              Show WAN IP address and local interfaces (latter requires ifconfig or ip network tool), as well as network output from -n.  Not shown with -F for user security reasons. You
              shouldn't paste your local/WAN IP. Shows both IPv4 and IPv6 link IP addresses.

       -I, --info
              Show Information: processes, uptime, memory, IRC client (or shell type if run in shell, not IRC), inxi version. See -Ix, -Ixx, and -Ia for extra information (init type/ver‐
              sion, runlevel, packages).

              Note: if -m is used or triggered, the memory item will show in the main Memory: report of -m, not in Info:.

              Raspberry Pi only: uses vcgencmd get_mem gpu to get gpu RAM amount, if user is in video group and vcgencmd is installed. Uses this result to increase the Memory: amount and
              used: amounts.

       -j, --swap
              Shows all active swap types (partition, file, zram). When this option is used, swap partition(s) will not show on the -P line to avoid redundancy.

              To show partition labels or UUIDs (when available and relevant), use with -l or -u.

       -J, --usb
              Show USB data for attached Hubs and Devices. Hubs also show number of ports.  Be aware that a port is not always external, some may be internal, and either used  or  unused
              (for example, a motherboard USB header connector that is not used).

              Hubs and Devices are listed in order of BusID.

              BusID is generally in this format: BusID-port[.port][.port]:DeviceID

              Device  ID  is  a  number created by the kernel, and has no necessary ordering or sequence connection, but can be used to match this output to lsusb values, which generally
              shows BusID / DeviceID (except for tree view, which shows ports).

              Examples: Device-3: 4-3.2.1:2 or Hub: 4-0:1

              The rev: 2.0 item refers to the USB revision number, like 1.0 or 3.1.

       -l, --label
              Show partition labels. Use with -j, -o, -p, and -P to show partition labels. Does nothing without one of those options.

              Sample: -ojpl.

       -L, --logical
              Show Logical volume information, for LVM, LUKS, bcache, etc. Shows size, free space (for LVM VG). For LVM, shows Device-[xx]: VG: (Volume Group) size/free, LV-[xx] (Logical
              Volume).  LV  shows  type, size, and components. Note that components are made up of either containers (aka, logical devices), or physical devices. The full report requires
              doas[BSDs]/sudo/root.

              Logical block devices can be thought of as devices that are made up out of either other logical devices, or physical devices. inxi does its best to show what  each  logical
              device is made out of. RAID devices form a subset of all possible Logical devices, but have their own section, -R.

              If  -R  is  used with -Lxx, -Lxx will not show RAID information for LVM RAID devices since it's redundant. If -R is not used, a simple RAID line will appear for LVM RAID in
              -Lxx.

              -Lxx also shows all components and devices. Note that since components can go in many levels, each level per primary component is indicated by either another 'c',  or  ends
              with a 'p' device, the physical device. The number of c's or p's indicates the depth, so you can see which component belongs to which.

              -L  shows  only the top level components/devices (like -R).  -La shows component/device size, maj:min ID, mapped name (if applicable), and puts each component/device on its
              own line.

              Sample:

              Device-10: mybackup type: LUKS dm: dm-28 size: 6.36 GiB Components: c-1: md1 cc-1: dm-26 ppp-1: sdj2 cc-2: dm-27 ppp-1: sdk2

              LV-5: lvm_raid1 type: raid1 dm: dm-16 size: 4.88 GiB
              RAID: stripes: 2 sync: idle copied: 100% mismatches: 0
              Components: c-1: dm-10 pp-1: sdd1 c-2: dm-11 pp-1: sdd1 c-3: dm-13
              pp-1: sde1 c-4: dm-15 pp-1: sde1

              It is easier to follow the flow of components and devices using -y1. In this example, there is one primary component  (c-1),  md1,  which  is  made  up  of  two  components
              (cc-1,2), dm-26 and dm-27. These are respectively made from physical devices (p-1) sdj2 and sdk2.

              Device-10: mybackup
                maj-min: 254:28
                type: LUKS
                dm: dm-28
                size: 6.36 GiB
                Components:
                  c-1: md1
                  maj-min: 9:1
                  size: 6.37 GiB
                  cc-1: dm-26
                    maj-min: 254:26
                    mapped: vg5-level1a
                    size: 12.28 GiB
                    ppp-1: sdj2
                      maj-min: 8:146
                      size: 12.79 GiB
                  cc-2: dm-27
                    maj-min: 254:27
                    mapped: vg5-level1b
                    size: 6.38 GiB
                    ppp-1: sdk2
                      maj-min: 8:162
                      size: 12.79 GiB

              Other types of logical block handling like LUKS, bcache show as:

              Device-[xx] [name/id] type: [LUKS|Crypto|bcache]:

       -m, --memory
              Memory  (RAM)  data.  Does  not display with -b or -F unless you use -m explicitly. Ordered by system board physical system memory array(s) (Array-[number]), and individual
              memory devices (Device-[number]). Physical memory array data shows array capacity, number of devices supported, and Error Correction information. Devices shows locator data
              (highly variable in syntax), size, speed, type (eg: type: DDR3).

              Note:  -m  uses  dmidecode, which must be run as root (or start inxi with sudo), unless you figure out how to set up doas[BSDs]/sudo to permit dmidecode to read /dev/mem as
              user.  speed and bus-width will not show if No Module Installed is found in size.

              Note: If -m is triggered RAM total/used report will appear in this section, not in -I or -tm items.

              Because dmidecode data is extremely unreliable, inxi will try to make best guesses. If you see (check) after the capacity number, you should check it  with  the  specifica‐
              tions.  (est) is slightly more reliable, but you should still check the real specifications before buying RAM. Unfortunately there is nothing inxi can do to get truly reli‐
              able data about the system RAM; maybe one day the kernel devs will put this data into /sys, and make it real data, taken from the actual system, not dmi data. For most peo‐
              ple, the data will be right, but a significant percentage of users will have either a wrong max module size, if present, or max capacity.

              Under  dmidecode,  Speed:  is the expected speed of the memory (what is advertised on the memory spec sheet) and Configured Clock Speed: is what the actual speed is now. To
              handle this, if speed and configured speed values are different, you will see this instead:

              speed: spec: [specified speed] MT/S actual: [actual] MT/S

              Also, if DDR, and speed in MHz, will change to: speed: [speed] MT/S ([speed] MHz)

              If the detected speed is logically absurd, like 1 MT/s or 69910 MT/s, adds: note: check. Sample:

              Memory:
                RAM: total: 31.38 GiB used: 20.65 GiB (65.8%)
                Array-1: capacity: N/A slots: 4 note: check EC: N/A
                Device-1: DIMM_A1 size: 8 GiB speed: 1600 MT/s (800 MHz)
                Device-2: DIMM_A2 size: 8 GiB speed: spec: 1600 MT/s (800 MHz)
                actual: 61910 MT/s (30955 MHz) note: check
                Device-3: DIMM_B1 size: 8 GiB speed: 1600 MT/s (800 MHz)
                Device-4: DIMM_B2 size: 8 GiB speed: spec: 1600 MT/s (800 MHz)
                actual: 2 MT/s (1 MHz) note: check

              See --memory-modules and --memory-short if you want a shorter report.

       --memory-modules
              Memory (RAM) data. Show only RAM arrays and modules in Memory report.  Skip empty slots. See -m.

       --memory-short
              Memory (RAM) data. Show a one line RAM report in Memory. See -m.

              Sample: Report: arrays: 1 slots: 4 modules: 2 type: DDR4

       -M, --machine
              Show machine data. Device, Motherboard, BIOS, and if present, System Builder (Like Lenovo). Older systems/kernels without the required /sys data can use dmidecode  instead,
              run as root. If using dmidecode, may also show BIOS/UEFI revision as well as version. --dmidecode forces use of dmidecode data instead of /sys. Will also attempt to show if
              the system was booted by BIOS, UEFI, or UEFI [Legacy], the latter being legacy BIOS boot mode in a system board using UEFI.

              Device information requires either /sys or dmidecode. Note that other-vm? is a type that means it's usually a VM, but inxi failed to detect which type, or  positively  con‐
              firm  which  VM  it is. Primary VM identification is via systemd-detect-virt but fallback tests that should also support some BSDs are used. Less commonly used or harder to
              detect VMs may not be correctly detected. If you get an incorrect output, post an issue and we'll get it fixed if possible.

              Due to unreliable vendor data, device type will show: desktop, laptop, notebook, server, blade, plus some obscure stuff that inxi is unlikely to ever run on.

       -n, --network-advanced
              Show Advanced Network device information in addition to that produced by -N. Shows interface, speed, MAC ID, state, etc.

       -N, --network
              Show Network device(s) information, including device driver. With -x, shows Bus ID, Port number.

       -o, --unmounted
              Show unmounted partition information (includes UUID and LABEL if available).  Shows file system type if you have lsblk installed (Linux only). For BSD/GNU Linux: shows file
              system type if file is installed, and if you are root or if you have added to /etc/sudoers (sudo v. 1.7 or newer):

              <username> ALL = NOPASSWD: /usr/bin/file (sample)

              BSD users: see man doas.conf for setup.

              Does not show components (partitions that create the md-raid array) of md-raid arrays.

              To show partition labels or UUIDs (when available and relevant), use with -l or -u.

       -p, --partitions-full
              Show full Partition information (-P plus all other detected mounted partitions).

              To show partition labels or UUIDs (when available and relevant), use with -l or -u.

       -P, --partitions
              Show  basic  Partition  information.  Shows, if detected: / /boot /boot/efi /home /opt /tmp /usr /usr/home /var /var/tmp /var/log (for android, shows /cache /data /firmware
              /system).  If --swap is not used, shows active swap partitions (never shows file or zram type swap). Use -p to see all mounted partitions.

              To show partition labels or UUIDs (when available and relevant), use with -l or -u.

       --processes - See -t

       -r, --repos
              Show distro repository data. Currently supported repo types:

              APK (Alpine Linux + derived versions)

              APT (Debian, Ubuntu + derived versions, as well as RPM based APT distros like PCLinuxOS or Alt-Linux)

              CARDS (NuTyX + derived versions)

              EOPKG (Solus)

              NIX (NixOS + other distros as alternate package manager)

              PACMAN (Arch Linux, KaOS + derived versions)

              PACMAN-G2 (Frugalware + derived versions)

              PISI (Pardus + derived versions)

              PKG (OpenBSD, FreeBSD, NetBSD + derived OS types)

              PORTAGE (Gentoo, Sabayon + derived versions)

              PORTS (OpenBSD, FreeBSD, NetBSD + derived OS types)

              SCRATCHPKG (Venom + derived versions)

              SLACKPKG (Slackware + derived versions)

              TCE (TinyCore)

              URPMI (Mandriva, Mageia + derived versions)

              XBPS (Void)

              YUM/ZYPP (Fedora, Red Hat, Suse + derived versions)

              More will be added as distro data is collected. If yours is missing please show us how to get this information and we'll try to add it.

              See -rx, -rxx, and -ra for installed package count information.

       -R, --raid
              Show RAID data. Shows RAID devices, states, levels, device/array size, and components. See extra data with -x / -xx.

              md-raid: If device is resyncing, also shows resync progress line.

              Note: supported types: lvm raid, md-raid, softraid, ZFS, and hardware RAID.  Other software RAID types may be added, if the software RAID can be made to give  the  required
              output.

              The  component ID numbers work like this: mdraid: the numerator is the actual mdraid component number; lvm/softraid/ZFS: the numerator is auto-incremented counter only. Eg.
              Online: 1: sdb1

              If hardware RAID is detected, shows basic information. Due to complexity of adding hardware RAID device disk / RAID reports, those will only be added if  there  is  demand,
              and reasonable reporting tools.

       --recommends
              Checks inxi application dependencies and recommends, as well as directories, then shows what package(s) you need to install to add support for each feature.

       -s, --sensors
              Show  output from sensors if sensors installed/configured: Motherboard/CPU/GPU temperatures; detected fan speeds. GPU temperature when available. Nvidia shows screen number
              for multiple screens. IPMI sensors are also used (root required) if present. See Advanced options --sensors-use or --sensors-exclude if you want to use only a subset of all
              sensors, or exclude one.

       --slots
              Show PCI slots with type, speed, and status information.

       --swap - See -j

       -S, --system
              Show System information: host name, kernel, desktop environment (if in X), distro. With -xx show dm - or startx - (only shows if present and running if out of X), and if in
              X, with -xxx show more desktop info, e.g. taskbar or panel.

       -t, --processes
              [c|m|cm|mc NUMBER] Show processes. If no arguments, defaults to cm. If followed by a number, shows that number of processes for each type (default: 5; if in IRC, max: 5)

              Make sure that there is no space between letters and numbers (e.g. write as -t cm10).

       -t c   - CPU only. With -x, also shows memory for that process on same line.

       -t m   - memory only. With -x, also shows CPU for that process on same line.  If the -I or -m lines are not triggered, will also show the system RAM used/total information.

       -t cm  - CPU+memory. With -x, shows also CPU or memory for that process on same line.

       -u, --uuid
              Show partition UUIDs. Use with -j, -o, -p, and -P to show partition labels. Does nothing without one of those options.

              Sample: -opju.

       -U, --update
              Note - Maintainer may have disabled this function.

              If inxi -h has no listing for -U then it's disabled.

              Auto-update script. Note: if you installed as root, you must be root to update, otherwise user is fine. Also installs / updates this man page to:  /usr/local/share/man/man1
              (if /usr/local/share/man/ exists AND there is no inxi man page in /usr/share/man/man1, otherwise it goes to /usr/share/man/man1). This requires that you be root to write to
              that directory. See --man or --no-man to force or disable man install.

       --usb - See -J

       -V, --version
              inxi version information. Prints information then exits.

       -v, --verbosity
              Script verbosity levels. If no verbosity level number is given, 0 is assumed.  Should not be used with -b or -F.

              Supported levels: 0-8 Examples : inxi -v 4  or  inxi -v4

       -v 0   - Short output, same as: inxi

       -v 1   - Basic verbose, -S + basic CPU (cores, type, clock speed, and min/max speeds, if available) + -G + basic Disk + -I.

       -v 2   - Adds networking device (-N), Machine (-M) data, Battery (-B) (if available). Same as: inxi -b

       -v 3   - Adds advanced CPU (-C) and network (-n) data; triggers -x advanced data option.

       -v 4   - Adds partition size/used data (-P) for (if present): / /home /var/ /boot. Shows full disk data (-D)

       -v 5   - Adds audio device (-A), memory/RAM (-m), bluetooth data (-E) (if present), sensors (-s), RAID data (if present), partition label (-l), UUID (-u), full swap data (-j), and
              short form of optical drives.

       -v 6   - Adds full mounted partition data (-p), unmounted partition data (-o), optical drive data (-d), USB (-J); triggers -xx extra data option.

       -v 7   - Adds network IP data (-i), forced bluetooth (-E), Logical (-L), RAID (-R); triggers -xxx

       -v 8   -  All system data available. Adds Repos (-r), PCI slots (--slots), processes (-tcm), admin (--admin).  Useful for testing output and to see what data you can get from your
              system.

       -w, --weather
              Adds weather line. To get weather for an alternate location, use -W [location]. See also -x, -xx, -xxx options.  Please note that your distribution's maintainer  may  chose
              to disable this feature.

              DO  NOT  USE  THIS  FEATURE FOR AUTOMATED WEATHER UPDATES! Automated or excessive use will lead to your being blocked from any further access. This feature is not meant for
              widget type weather monitoring, or Conky type use. It is meant to get weather when you need to see it, for example, on a remote server. If you did not type the weather  op‐
              tion in manually, it's an automated request.

       -W, --weather-location <location_string>
              Get weather/time for an alternate location. Accepts postal/zip code[, country], city,state pair, or latitude,longitude. Note: city/country/state names must not contain spa‐
              ces. Replace spaces with '+' sign. Don't place spaces around any commas. Postal code is not reliable except for North America and maybe the UK. Try postal  codes  with  and
              without  country  code  added.  Note that City,State applies only to USA, otherwise it's City,Country. If country name (english) does not work, try 2 character country code
              (e.g. Spain: es; Great Britain: gb).

              See https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2 for current 2 letter country codes.

              Use only ASCII letters in city/state/country names.

              Examples: -W 95623,us OR -W Boston,MA OR -W 45.5234,-122.6762 OR -W new+york,ny OR -W bodo,norway.

              DO NOT USE THIS FEATURE FOR AUTOMATED WEATHER UPDATES! Automated or excessive use will lead to your being blocked from any further access. This feature  is  not  meant  for
              widget  type weather monitoring, or Conky type use. It is meant to get weather when you need to see it, for example, on a remote server. If you did not type the weather op‐
              tion in manually, it's an automated request.

       --weather-source, --ws <unit>
              [1-9] Switches weather data source. Possible values are 1-9.  1-4 will generally be active, and 5-9 may or may not be active, so check. 1 may not  support  city  /  country
              names with spaces (even if you use the + sign instead of space). 2 offers pretty good data, but may not have all small city names for -W.

              Please  note  that  the data sources are not static per value, and can change any time, or be removed, so always test to verify which source is being used for each value if
              that is important to you. Data sources may be added or removed on occasions, so try each one and see which you prefer. If you get unsupported source message, it means  that
              number has not been implemented.

       --weather-unit <unit>
              [m|i|mi|im]  Sets weather units to metric (m), imperial (i), metric (imperial) (mi, default), imperial (metric) (im). If metric or imperial not found,sets to default value,
              or N/A.

       -y, --width [integer]
              This is an absolute width override which sets the output line width max.  Overrides COLS_MAX_IRC / COLS_MAX_CONSOLE globals, or the actual widths of the terminal. 80 is the
              minimum  width  supported.   -1 removes width limits. 1 switches to a single indented key/value pair per line, and removes all long line wrapping (similar to dmidecode out‐
              put).

              If no integer value is given, sets width to default of 80.

              Examples: inxi -Fxx -y 130 or inxi -Fxxy or inxi -bay1

       -z, --filter
              Adds security filters for IP addresses, serial numbers, MAC, location (-w), and user home directory name. Removes Host:.  On by default for IRC clients.

       -Z, --filter-override
              Absolute override for output filters. Useful for debugging networking issues in IRC for example.

EXTRA DATA OPTIONS
       These options can be triggered by one or more -x.  Alternatively, the -v options trigger them in the following way: -v 3 adds -x; -v 6 adds -xx; -v 7 adds -xxx

       These extra data triggers can be useful for getting more in-depth data on various options. They can be added to any long form option list, e.g.: -bxx or -Sxxx

       There are 3 extra data levels:

       -x, -xx, -xxx

       OR

       --extra 1, --extra 2, --extra 3

       The following details show which lines / items display extra information for each extra data level.

       -x -A  - Adds (if available and/or relevant) vendor: item, which shows specific vendor [product] information.

              - Adds version/port(s)/driver version (if available) for each device.

              - Adds PCI/USB ID of each device.

              - Adds non-running sound servers, if detected.

       -x -B  - Adds vendor/model, battery status (if battery present).

              - Adds attached battery powered peripherals (Device-[number]:) if detected (keyboard, mouse, etc.).

              - Adds battery volts:, min: voltages. Note that if difference is critical, that is current voltage is too close to minimum voltage, shows without -x.

       -x -C  - Adds bogomips on CPU (if available)

              - Adds boost: [enabled|disabled] if detected, aka turbo. Not all CPUs have this feature.

              - Adds CPU Flags (short list). Use -f to see full flag/feature list.

              - Adds CPU microarchitecture + revision (e.g. Sandy Bridge, K8, ARMv8, P6, etc.). Only shows data if detected. Newer microarchitectures will have to be added  as  they  ap‐
              pear, and require the CPU family ID, model ID, and stepping.

              Examples: arch: Sandy Bridge rev: 2, arch: K8 rev.F+ rev: 2

              If unable to non-ambiguosly determine architecture, will show something like: arch: Amber Lake note: check rev: 9

       -x -d  - Adds more items to Features line of optical drive; dds rev version to optical drive.

       -x -D  - Adds HDD temperature with disk data.

              Method 1: Systems running Linux kernels ~5.6 and newer should have drivetemp module data available. If so, drive temps will come from /sys data for each drive, and will not
              require root or hddtemp. This method is MUCH faster than using hddtemp. Note that NVMe drives do not require drivetemp.

              If your drivetemp module is not enabled, enable it:

              modprobe drivetemp

              Once enabled, add drivetemp to /etc/modules or /etc/modules-load.d/***.conf so it starts automatically.

              If you see drive temps running as regular user and you did not configure system to use doas[BSDs]/sudo hddtemp, then your system supports this feature.  If no /sys data  is
              found,  inxi  will try to use hddtemp methods instead for that drive. Hint: if temp is /sys sourced, the temp will be to 1 decimal, like 34.8, if hddtemp sourced, they will
              be integers.

              Method 2: if you have hddtemp installed, if you are root or if you have added to /etc/sudoers (sudo v. 1.7 or newer):

              <username> ALL = NOPASSWD: /usr/sbin/hddtemp (sample)

              BSD users: see man doas.conf for setup.

              You can force use of hddtemp for all drives using --hddtemp.

              - If free LVM volume group size detected (root required), show lvm-free: on Local Storage line. This is how much unused space the VGs contain, that is, space  not  assigned
              to LVs.

       -x -E (--bluetooth)
              - Adds (if available and/or relevant) vendor: item, which shows specific vendor [product] information.

              - Adds PCI/USB Bus ID of each device.

              - Adds driver version (if available) for each device.

              - Adds (if available, and hciconfig only) LMP (HCI if no LMP data, and HCI if HCI/LMP versions are different) version (if available) for each HCI ID.

       -x -G  - Adds (if available and/or relevant) vendor: item, which shows specific vendor [product] information.

              - Adds direct rendering status.

              - Adds (for single GPU, nvidia driver) screen number that GPU is running on.

              - Adds PCI/USB ID of each device.

       -x -i  - Adds IP v6 additional scope data, like Global, Site, Temporary for each interface.

              Note  that  there  is  no  way  we are aware of to filter out the deprecated IP v6 scope site/global temporary addresses from the output of ifconfig. The ip tool shows that
              clearly.

              ip-v6-temporary - (ip tool only), scope global temporary.  Scope global temporary deprecated is not shown

              ip-v6-global - scope global (ifconfig will show this for all types, global, global temporary, and global temporary deprecated, ip shows it only for global)

              ip-v6-link - scope link (ip/ifconfig) - default for -i.

              ip-v6-site - scope site (ip/ifconfig). This has been deprecated in IPv6, but still exists. ifconfig may show multiple site values, as with global temporary, and global tem‐
              porary deprecated.

              ip-v6-unknown - unknown scope

       -x -I  - Adds current init system (and init rc in some cases, like OpenRC).  With -xx, shows init/rc version number, if available.

              - Adds default system gcc. With -xx, also show other installed gcc versions.

              - Adds current runlevel (not available with all init systems).

              - Adds total packages discovered in system. See -xx and -a for per package manager types output. Moves to Repos if -rx.

              If your package manager is not supported, please file an issue and we'll add it.  That requires the full output of the query or method to discover all installed packages on
              your system, as well of course as the command or method used to discover those.

              - If in shell (i.e. not in IRC client), adds shell version number, if available.

       -x -j, -x --swap
              Add mapper:. See -x -o.

       -x -J (--usb)
              - For Devices, adds driver(s).

       -x -L, -x --logical
              - Adds dm: dm-x to VG > LV and other Device types. This can help tracking down which device belongs to what.

       -x -m, --memory-modules
              - If present, adds maximum memory module/device size in the Array line.  Only some systems will have this data available. Shows estimate if it can generate one.

              - Adds device type in the Device line.

       -x -N  - Adds (if available and/or relevant) vendor: item, which shows specific vendor [product] information.

              - Adds version/port(s)/driver version (if available) for each device;

              - Adds PCI/USB ID of each device.

       -x -o, -x -p, -x -P
              - Adds mapper: (the /dev/mapper/ partition ID) if mapped partition.

              Example: ID-4: /home ... dev: /dev/dm-6 mapped: ar0-home

       -x -r  - Adds Package info. See -Ix

       -x -R  - md-raid: Adds second RAID Info line with extra data: blocks, chunk size, bitmap (if present). Resync line, shows blocks synced/total blocks.

              - Hardware RAID: Adds driver version, Bus ID.

       -x -s  - Adds basic voltages: 12v, 5v, 3.3v, vbat (ipmi, lm-sensors if present).

       -x -S  - Adds Kernel gcc version.

              - Adds to Distro: base: if detected. System base will only be seen on a subset of distributions. The distro must be both derived  from  a  parent  distro  (e.g.  Mint  from
              Ubuntu),  and explicitly added to the supported distributions for this feature. Due to the complexity of distribution identification, these will only be added as relatively
              solid methods are found for each distribution system base detection.

       -x -t (--processes)
              - Adds memory use output to CPU (-xt c), and CPU use to memory (-xt m).

       -x -w, -W
              - Adds humidity and barometric pressure.

              - Adds wind speed and direction.

       -xx -A - Adds vendor:product ID for each device.

       -xx -B - Adds serial number.

       -xx -C - Adds L1-cache: and L3-cache: if either are available.  Requires dmidecode and doas[BSDs]/sudo/root.

       -xx -D - Adds disk serial number.

              - Adds disk speed (if available). This is the theoretical top speed of the device as reported. This speed may be restricted by system board limits, eg. a SATA 3 drive on  a
              SATA 2 board may report SATA 2 speeds, but this is not completely consistent, sometimes a SATA 3 device on a SATA 2 board reports its design speed.

              NVMe drives: adds lanes, and (per direction) speed is calculated with lane speed * lanes * PCIe overhead. PCIe 1 and 2 have data rates of GT/s * .8 = Gb/s (10 bits required
              to transfer 8 bits of data).  PCIe 3 and greater transfer data at a rate of GT/s * 128/130 * lanes = Gb/s (130 bits required to transfer 128 bits of data).

              For a PCIe 3 NVMe drive, with speed of 8 GT/s and 4 lanes (8GT/s * 128/130 * 4 = 31.6 Gb/s):

              speed: 31.6 Gb/s lanes: 4

              - Adds disk duid, if available. Some BSDs have it.

       -xx -E (--bluetooth)
              - Adds vendor:product ID of each device.

              - Adds (hciconfig only) LMP subversion (and/or HCI revision if applicable) for each device.

       -xx -G - Adds vendor:product ID of each device.

              - Adds Xorg compositor, if found (always shows for Wayland systems).

              - For free drivers, adds OpenGL compatibility version number if available.  For nonfree drivers, the core version and compatibility versions are usually the same. Example:

              v: 3.3 Mesa 11.2.0 compat-v: 3.0

              - If available, shows alternate: Xorg drivers. This means a driver on the default list of drivers Xorg automatically checks for the device, but which is not installed.  For
              example,  if  you  have  nouveau driver, nvidia would show as alternate if it was not installed. Note that alternate: does NOT mean you should have it, it's just one of the
              drivers Xorg checks to see if is present and loaded when checking the device. This can let you know there are other driver options. Note that if you have explicitly set the
              driver in xorg.conf, Xorg will not create this automatic check driver list.

              -  If available, shows Xorg dpi (s-dpi:) for the active Xorg Screen (not physical monitor). Note that the physical monitor dpi and the Xorg dpi are not necessarily the same
              thing, and can vary widely.

       -xx -I - Adds init type version number (and rc if present).

              - Adds other detected installed gcc versions (if present).

              - Adds system default runlevel, if detected. Supports Systemd/Upstart/SysVinit type defaults.

              - Shows Packages: counts by discovered package manager types. In cases where only 1 type had results, does not show total after Packages:. Does not show  installed  package
              managers wtih 0 packages. See -a for full output. Moves to Repos if -rxx.

              - Adds parent program (or pty/tty) that started shell, if not IRC client.

       -xx -j (--swap), -xx -p, -xx -P
              - Adds swap priority to each swap partition (for -P) used, and for all swap types (for -j).

       -xx -J (--usb)
              - Adds vendor:chip id.

       -xx -L, -xx --logical
              - Adds internal LVM Logical volumes, like raid image and meta data volumes.

              - Adds full list of Components, sub-components, and their physical devices.

              - For LVM RAID, adds a RAID report line (if not -R). Read up on LVM documentation to better understand their use of the term 'stripes'.

       -xx -m, --memory-modules
              - Adds memory device Manufacturer.

              -  Adds  memory device Part Number (part-no:). Useful for ordering new or replacement memory sticks etc. Part numbers are unique, particularly if you use the word memory in
              the search as well. With -xxx, also shows serial number.

              - Adds single/double bank memory, if data is found. Note, this may not be 100% right all of the time since it depends on the order that data is found  in  dmidecode  output
              for type 6 and type 17.

       -xx -M - Adds chassis information, if data is available. Also shows BIOS ROM size if using dmidecode.

       -xx -N - Adds vendor:product ID for each device.

       -xx -r - Adds Packages info. See -Ixx

       -xx -R - md-raid: Adds superblock (if present) and algorithm. If resync, shows progress bar.

              - Hardware RAID: Adds Chip vendor:product ID.

       -xx -s - Adds DIMM/SOC voltages, if present (ipmi only).

       -xx -S -  Adds  display  manager  (dm)  type, if present. If none, shows N/A.  Supports most known display managers, including gdm, gdm3, idm, kdm, lightdm, lxdm, mdm, nodm, sddm,
              slim, tint, wdm, and xdm.

              - Adds, if run in X, window manager type (wm), if available. Not all window managers are supported. Some desktops support using more than one window manager, so this can be
              useful to see what window manager is actually running. If none found, shows nothing. Uses a less accurate fallback tool wmctrl if ps tests fail to find data.

              - Adds desktop toolkit (tk), if available (Xfce/KDE/Trinity).

       -xx --slots
              - Adds slot length.

       -xx -w, -W
              - Adds wind chill, heat index, and dew point, if available.

              - Adds cloud cover, rain, snow, or precipitation (amount in previous hour to observation time), if available.

       -xxx -A
              - Adds, if present, serial number.

              - Adds, if present, PCI/USB class ID.

       -xxx -B
              -  Adds battery chemistry (e.g. Li-ion), cycles (NOTE: there appears to be a problem with the Linux kernel obtaining the cycle count, so this almost always shows 0. There's
              nothing that can be done about this glitch, the data is simply not available as of 2018-04-03), location (only available from dmidecode derived output).

              - Adds attached device rechargeable: [yes|no] information.

       -xxx -C
              - Adds CPU voltage and external clock speed (this is the motherboard speed).  Requires doas[BSDs]/sudo/root and dmidecode.

       -xxx -D
              - Adds disk firmware revision number (if available).

              - Adds disk partition scheme (in most cases), e.g. scheme: GPT.  Currently not able to detect all schemes, but handles the most common, e.g.  GPT or MBR.

              - Adds disk type (HDD/SSD), rotation speed (in some but not all cases), e.g. type: HDD rpm: 7200, or type: SSD if positive SSD identification was made. If no HDD, rotation,
              or positive SSD ID found, shows type: N/A. Not all HDD spinning disks report their speed, so even if they are spinning, no rpm data will show.

       -xxx -E (--bluetooth)
              - Adds, if present, PCI/USB class ID.

              - Adds (hciconfig only) HCI version, revision.

       -xxx -G
              - Adds, if present, PCI/USB class ID.

       -xxx -I
              -  For Uptime: adds wakeups: to show how many times the machine has been woken from suspend state during current uptime period (if available, Linux only). 0 value means the
              machine has not been suspended.

              - For Shell: adds (su|sudo|login) to shell name if present.

              - For Shell: adds default: shell if different from running shell, and default shell v:, if available.

              - For running-in: adds (SSH) to parent, if present. SSH detection uses the whoami test.

       -xxx -J (--usb)
              - Adds, if present, serial number for non hub devices.

              - Adds interfaces: for non hub devices.

              - Adds, if available, USB speed in Mbits/s or Gbits/s.

              - Adds, if present, USB class ID.

              - Adds, if non 0, max power in mA.

       -xxx -m, --memory-modules
              - Adds memory bus width: primary bus width, and if present, total width. e.g.  bus width: 64 bit (total: 72 bits). Note that total / data widths are mixed up  sometimes  in
              dmidecode output, so inxi will take the larger value as the total if present. If no total width data is found, then inxi will not show that item.

              - Adds device Type Detail, e.g. detail: DDR3 (Synchronous).

              - Adds, if present, memory module voltage. Only some systems will have this data available.

              - Adds device serial number.

       -xxx -N
              - Adds, if present, serial number.

              - Adds, if present, PCI/USB class ID.

       -xxx -R
              - md-raid: Adds system mdraid support types (kernel support, read ahead, RAID events)

              - zfs-raid: Adds portion allocated (used) by RAID array/device.

              - Hardware RAID: Adds rev, ports, and (if available and/or relevant) vendor: item, which shows specific vendor [product] information.

       -xxx -S
              -  Adds,  if  in  X,  or  with  --display,  bar/dock/panel/tray  items  (info). If none found, shows nothing. Supports desktop items like gnome-panel, lxpanel, xfce4-panel,
              lxqt-panel, tint2, cairo-dock, trayer, and many others.

              - Adds (if present), window manager (wm) version number.

              - Adds (if present), display manager (dm) version number.

              - Adds (if available, and in display), virtual terminal (vt) number.  These are the same as ctrl+alt+F[x] numbers usually. Some systems have this, some don't, it varies.

       -xxx -w, -W
              - Adds location (city state country), observation altitude (if available), weather observation time (if available), sunset/sunrise (if available).

ADMIN EXTRA DATA OPTIONS
       These options are triggered with --admin or -a. Admin options are advanced output options, and are more technical, and mostly of interest to system administrators or other machine
       admins.

       The --admin option sets -xxx, and only has to be used once.  It will trigger the following features:

       -a -A  -  Adds, if present, possible alternate: kernel modules capable of driving each Device-x (not including the current driver:). If no non-driver modules found, shows nothing.
              NOTE: just because it lists a module does NOT mean it is available in the system, it's just something the kernel knows could possibly be used instead.

       -a -C  - Adds CPU family, model-id, and stepping (replaces rev of -Cx).  Format is hexadecimal (decimal) if greater than 9, otherwise hexadecimal.  - Adds CPU microcode. Format is
              hexadecimal.

              -  Adds socket type (for motherboard CPU socket, if available). If results doubtful will list two socket types and note: check. Requires doas[BSDs]/sudo/root and dmidecode.
              The item in parentheses may simply be a different syntax for the same socket, but in general, check this before trusting it.
              Sample: socket: 775 (478) note: check
              Sample: socket: AM4

              - Adds DMI CPU base and boost/turbo speeds. Requires doas[BSDs]/sudo/root and dmidecode. In some cases, like with overclocking or 'turbo' or 'boost' modes, voltage and  ex‐
              ternal  clock  speeds may be increased, or short term limits raised on max CPU speeds. These are often not reflected in /sys based CPU min/max: speed results, but often are
              using this source.

              Samples:
              CPU not overclocked, with boost, like Ryzen:
              Speed: 2861 MHz min/max: 1550/3400 MHz boost: enabled base/boost: 3400/3900

              Overclocked 2900 MHz CPU, with no boost available:
              Speed: 2900 MHz min/max: 800/2900 MHz base/boost: 3350/3000

              Overclocked 3000 MHz CPU, with boosted max speed:
              Speed: 4190 MHz min/max: 1200/3001 MHz base/boost: 3000/4000

              Note that these numbers can be confusing, but basically, the base number is the actual normal top speed the CPU runs at without boost mode, and the boost number is the  max
              speed  the  CPU  reports  itself able to run at.  The actual max speed may be higher than either value, or lower. The boost number appears to be hard-coded into the CPU DMI
              data, and does not seem to reflect actual max speeds that overclocking or other combinations of speed boosters can enable, as you can see from the example where the CPU  is
              running at a speed faster than the min/max or base/boost values.

              Note that the normal min/max: speeds do NOT show actual overclocked OR boost/turbo mode speeds, and appear to be hard-coded values, not dynamic real values. The base/boost:
              values are sometimes real, and sometimes not.  base appears in general to be real.

              - Adds CPU Vulnerabilities (bugs) as known by your current kernel. Lists by Type: ... (status|mitigation): .... for systems that support this feature (Linux kernel 4.14  or
              newer, or patched older kernels).

       -a -d,-a -D
              - Adds logical and physical block size in bytes.

              Using smartctl (requires doas[BSDs]/sudo/root privileges).

              - Adds device model family, like Caviar Black, if available.

              - Adds SATA type (eg 1.0, 2.6, 3.0) if a SATA device.

              - Adds device kernel major:minor number (Linux only).

              -  Adds SMART report line: status, enabled/disabled, health, powered on, cycles, and some error cases if out of range values. Note that for Pre-fail items, it will show the
              VALUE and THRESHOLD numbers. It will also fall back for unknown attributes that are or have been failing and print out the Attribute name,  value,  threshold,  and  failing
              message.  This  way even for unhandled Attribute names, you should get a solid report for full failure cases. Other cases may show if inxi believes that the item may be ap‐
              proaching failure. This is a guess so make sure to check the drive and smartctl full output to verify before taking any further action.

              - Adds, for USB or other external drives, actual model name/serial if available, and different from enclosure model/serial, and corrects block sizes if necessary.  Adds  in
              drive temperature for some drives as well, and other useful data.

       -a -E (--bluetooth)
              - Adds (hciconfig only) extra line to Report:, Info:.  Includes, if available, ACL MTU, SCO MTU, Link policy, Link mode, and Service Classes.

       -a -G  Triggers a much more complete Screen/Monitor output on the Display: line of -G. Note that the basic feature requires xdpyinfo, and the advanced per monitor feature requires
              xrandr.

              No support currently exists for Wayland since we so far can find no documentation or easy methods to extract this information from  Wayland  compositors.  This  unfortunate
              situation may change in the future, hopefully.  However, most Wayland systems also come with xwayland, which should supply the tools necessary for the time being.

              Further note that all references to Displays, Screens, and Monitors are referring to the X technical terms, not normal consumer usage. 1 Display runs 1 or more Screens, and
              a Screen runs 1 or more Monitors.

              - Adds Display ID, for the Display running the Screen that runs the Monitors.

              - Adds total number of Screens listed for the current Display.

              - Adds default Screen ID if Screen (not monitor!) total is greater than 1.

              - Adds Screen line, which includes the ID (Screen: 0) then s-res (Screen resolution), s-dpi, s-size and s-diag.  Remember, this is an Xorg Screen, NOT a monitor screen, and
              the information listed is about the Xorg Screen! It may at times be the same as a single monitor system, but usually it's different in some ways.

              -  Adds  Monitor  ID(s). Monitors are a subset of a Screen, each of which can have one or more monitors. Normally a dual monitor setup is 2 monitors run by one Xorg Screen.
              Each monitor has the following data, if available:

              - res: resolution in pixels. This is the individual monitor's reported pixel dimensions.

              - hz: frequency in Herz, as reported to Xorg. Note that there have been and may continue to be bugs with how Xorg treats > 1 monitor frequencies.

              - dpi: dpi (dots per inch), aka, ppi (pixels per inch). This is the physical screen dpi, which is calculated using the screen dimensions and its resolution.

              - size: size in mm (inches). Note that this is the real monitor size, not the Xorg Screen size, which can be quite different (1 Xorg Screen can for instance contain two  or
              more monitors).

              - diag: monitor screen diagonal in mm (inches). Note that this is the real monitor size, not the Xorg full Screen diagonal size, which can be quite different.

              Sample (with both xdpyinfo and xrandr data available):
              inxi -aG
              Graphics:
               ....
              Display: x11 server: X.Org 1.20.6 driver: loaded: modesetting
              display ID: :0.0 screens: 1
              Screen-1: 0 s-res: 2560x1024 s-dpi: 96 s-size: 677x271mm (26.7x10.7")
              s-diag: 729mm (28.7")
              Monitor-1: DVI-I-0 res: 1280x1024 hz: 60 dpi: 96
              size: 338x270mm (13.3x10.6") diag: 433mm (17")
              Monitor-2: VGA-0 res: 1280x1024 hz: 60 dpi: 86
              size: 376x301mm (14.8x11.9") diag: 482mm (19")
               ....
              -  Adds, if present, possible alternate: kernel modules capable of driving each Device-x (not including the current loaded:). If no non-driver modules found, shows nothing.
              NOTE: just because it lists a module does NOT mean it is available in the system, it's just something the kernel knows could possibly be used instead.

       -a -I  - Adds Packages, totals, per package manager totals, and number of lib packages detected per package manager. Also adds detected package managers with  0  packages  listed.
              Moves to Repos if -ra.

              inxi -aI
              Info:
               ....
               Init: systemd v: 245 runlevel: 5 Compilers: gcc: 9.3.0 alt: 5/6/7/8/9
               Packages: apt: 3681 lib: 2096 rpm: 0 Shell: ksh v: A_2020.0.0 default: Bash
               v: 5.0.16 running-in: kate inxi: 3.1.04

              -  Adds  service  control tool, tested for in the following order: systemctl rc-service rcctl service sv /etc/rc.d /etc/init.d - useful to know which you need when using an
              unfamiliar machine.

       -a -j, -a -P [swap], -a -P [swap]
              - Adds swappiness and vfs cache pressure, and a message to indicate if the value is the default value or not (Linux only, and only if available).  If not the default value,
              shows default value as well, e.g.

              For -P per swap physical partition:

              swappiness: 60 (default) cache-pressure: 90 (default 100)

              For -j row 1 output:

              Kernel: swappiness: 60 (default) cache-pressure: 90 (default 100)

              - Adds device kernel major:minor number (Linux only).

       -a -L  - Expands Component report, shows size / maj-min of components and devices, and mapped name for logical components. Puts each component/device on its own line.

              - Adds maj-min to LV and other devices.

       -a -n, -a -N, -a -i
              -  Adds, if present, possible alternate: kernel modules capable of driving each Device-x (not including the current driver:). If no non-driver modules found, shows nothing.
              NOTE: just because it lists a module does NOT mean it is available in the system, it's just something the kernel knows could possibly be used instead.

       -a -o  - Adds device kernel major:minor number (Linux only).

       -a -p,-a -P
              - Adds raw partition size, including file system overhead, partition table, e.g.

              raw-size: 60.00 GiB.

              - Adds percent of raw size available to size: item, e.g.

              size: 58.81 GiB (98.01%).

              Note that used: 16.44 GiB (34.3%) percent refers to the available size, not the raw size.

              - Adds partition filesystem block size if found (requires root and blockdev).

              - Adds device kernel major:minor number (Linux only).

       -a -r  - Adds Packages. See -Ia

       -a -R  - Adds device kernel major:minor number (mdraid, Linux only).

              - Adds, if available, component size, major:minor number (Linux only). Turns Component report to 1 component per line.

       -a -S  - Adds kernel boot parameters to Kernel section (if detected). Support varies by OS type.

ADVANCED OPTIONS
       --alt 40
              Bypass Perl as a downloader option. Priority is: Perl (HTTP::Tiny), Curl, Wget, Fetch, (OpenBSD only) ftp.

       --alt 41
              Bypass Curl as a downloader option. Priority is: Perl (HTTP::Tiny), Curl, Wget, Fetch, (OpenBSD only) ftp.

       --alt 42
              Bypass Fetch as a downloader option. Priority is: Perl (HTTP::Tiny), Curl, Wget, Fetch, (OpenBSD only) ftp.

       --alt 43
              Bypass Wget as a downloader option. Priority is: Perl (HTTP::Tiny), Curl, Wget, Fetch, OpenBSD only: ftp

       --alt 44
              Bypass Curl, Fetch, and Wget as downloader options. This basically forces the downloader selection to use Perl 5.x HTTP::Tiny, which is generally slower than Curl  or  Wget
              but it may help bypass issues with downloading.

       --bt-tool [bt-adapter|hciconfig|rfkill]
              Force the use of the given tool for bluetooth report (-E).  rfkill does not support mac address data.

       --dig  Temporary override of NO_DIG configuration item. Only use to test w/wo dig. Restores default behavior for WAN IP, which is use dig if present.

       --display [:<integer>]
              Will try to get display data out of X (does not usually work as root user).  Default gets display info from display :0. If you use the format --display :1 then it would get
              it from display 1 instead, or any display you specify.

              Note that in some cases, --display will cause inxi to hang endlessly when running the option in console with Intel graphics. The situation regarding other free drivers such
              as nouveau/ATI is currently unknown. It may be that this is a bug with the Intel graphics driver - more information is required.

              You can test this easily by running the following command out of X/display server: glxinfo -display :0

              If it hangs, --display will not work.

       --dmidecode
              Shortcut, legacy. See --force dmidecode.

       --downloader [curl|fetch|perl|wget]
              Force inxi to use Curl, Fetch, Perl, or Wget for downloads.

       --force [dmidecode|hddtemp|lsusb|pkg|usb-sys|vmstat|wmctl]
              Various force options to allow users to override defaults. Values be given as a comma separated list:

              inxi -MJ --force dmidecode,lsusb

              - dmidecode - Force use of dmidecode. This will override /sys data in some lines, e.g. -M or -B.

              - hddtemp - Force use of hddtemp instead of /sys temp data for disks.

              - lsusb - Forces the USB data generator to use lsusb as data source (default). Overrides USB_SYS in user configuration file(s).

              - pkg - Force override of disabled package counts. Known package managers with non-resolvable issues:

              rpm: Due to up to 30 seconds delays executing
              rpm -qa --nodigest --nosignature
              on  older hardware (and over 1 second on new hardware with some rpm versions) package counts are disabled by default because of the unacceptable slowdowns to execute a sim‐
              ple package list command.

              - usb-sys - Forces the USB data generator to use /sys as data source instead of lsusb (Linux only).

              - vmstat - Forces use of vmstat for memory data.

              - wmctl - Force System item wm to use wmctrl as data source, override default ps source.

       --hddtemp
              Shortcut, legacy. See --force hddtemp.

       --host Turns on hostname in System line. Overrides inxi config file value (if set):

              SHOW_HOST='false' - Same as: SHOW_HOST='true'

              This is an absolute override, the host will always show no matter what other switches you use.

       --html-wan
              Temporary override of NO_HTML_WAN configuration item. Only use to test w/wo HTML downloaders for WAN IP. Restores default behavior for WAN IP, which is use HTML  downloader
              if present and if dig failed.

       --limit [-1 - x]
              Raise or lower max output limit of IP addresses for -i. -1 removes limit.

       --man  Updates / installs man page with -U if pinxi or using -U 3 dev branch. (Only active if -U is is not disabled by maintainers).

       --no-dig
              Overrides  default use of dig to get WAN IP address. Allows use of normal downloader tool to get IP addresses. Only use if dig is failing, since dig is much faster and more
              reliable in general than other methods.

       --no-doas
              Skips the use of doas to run certain internal features (like hddtemp, file) with doas. Not related to running inxi itself with doas/sudo or super user.  Some  systems  will
              register  errors  which  will  then trigger admin emails in such cases, so if you want to disable regular user use of doas (which requires configuration to setup anyway for
              these options) just use this option, or NO_DOAS configuration item. See --no-sudo if you need to disable both types.

       --no-host
              Turns off hostname in System line. This is default when using -z, for anonymizing inxi output for posting on forums or IRC. Overrides  configuration  value  (if  set):  in‐
              dent-min

              SHOW_HOST='true' - Same as: SHOW_HOST='false'

              This is an absolute override, the host will not show no matter what other switches you use.

       --no-html-wan
              Overrides  use  of  HTML  downloaders  to get WAN IP address. Use either only dig, or do not get wan IP. Only use if dig is failing, and the HTML downloaders are taking too
              long, or are hanging or failing.

              Make permanent with NO_HTML_WAN='true'

       --no-man
              Disables man page install with -U for master and active development branches. (Only active if -U is is not disabled by maintainers).

       --no-sensor-force
              Overrides user set SENSOR_FORCE configuration value. Restores default behavior.

       --no-ssl
              Skip SSL certificate checks for all downloader actions (-U, -w, -W, -i). Use if your system does not have current SSL certificate lists, or if you have  problems  making  a
              connection for any reason. Works with Wget, Curl, Perl HTTP::Tiny and Fetch.

       --no-sudo
              Skips the use of sudo to run certain internal features (like hddtemp, file) with sudo. Not related to running inxi itself with sudo or superuser. Some systems will register
              errors which will then trigger admin emails in such cases, so if you want to disable regular user use of sudo (which requires configuration to setup anyway  for  these  op‐
              tions) just use this option, or NO_SUDO configuration item.

       --output [json|screen|xml]
              Change data output type. Requires --output-file if not screen.

       --output-file [full path to output file|print]
              The given directory path must exist. The directory path given must exist, The print options prints to stdout.  Required for non-screen --output formats (json|xml).

       --partition-sort [dev-base|fs|id|label|percent-used|size|uuid|used]
              Change default sort order of partition output. Corresponds to PARTITION_SORT configuration item. These are the available sort options:

              dev-base - /dev partition identifier, like /dev/sda1.  Note that it's an alphabetic sort, so sda12 is before sda2.

              fs - Partition filesystem. Note that sorts will be somewhat random if all filesystems are the same.

              id - Mount point of partition (default).

              label - Label of partition. If partitions have no labels, sort will be random.

              percent-used - Percentage of partition size used.

              size - KiB size of partition.

              uuid - UUID of the partition.

              used - KiB used of partition.

       --pkg  Shortcut. See --force pkg.

       --pm-type [package manager name]
              For  distro  package maintainers only, and only for non apt, rpm, or pacman based systems. To be used to test replacement package lists for recommends for that package man‐
              ager.

       --sensors-default
              Overrides configuration values SENSORS_USE or SENSORS_EXCLUDE on a one time basis.

       --sensors-exclude
              Similar to --sensors-use except removes listed sensors from sensor data. Make permanent with SENSORS_EXCLUDE configuration item. Note that gpu,  network,  disk,  and  other
              specific device monitor chips are excluded by default.

              Example: inxi -sxx --sensors-exclude k10temp-pci-00c3

       --sensors-use
              Use  only  the  (comma  separated)  sensor  arrays for -s output. Make permanent with SENSORS_USE configuration item. Sensor array ID value must be the exact value shown in
              lm-sensors sensors output (Linux/lm-sensors only). If you only want to exclude one (or more) sensors from the output, use --sensors-exclude.

              Can be useful if the default sensor data used by inxi is not from the right sensor array. Note that all other sensor data will be removed, which may lead to undesired  con‐
              sequences.  Please be aware that this can lead to many undesirable side-effects, since default behavior is to use all the sensors arrays and select which values to use from
              them following a set sequence of rules. So if you force one to be used, you may lose data that was used from another one.

              Most likely best use is when one (or two) of the sensor arrays has all the sensor data you want, and you just want to make sure inxi doesn't use  data  from  another  array
              that has inaccurate or misleading data.

              Note  that  gpu,  network, disk, and other specific device monitor chips are excluded by default, and should not be added since they do not provide cpu, board, system, etc,
              sensor data.

              Example: inxi -sxx --sensors-use nct6791-isa-0290,k10temp-pci-00c3

       --sleep [0-x.x]
              Usually in decimals. Change CPU sleep time for -C (current:  .35).  Sleep is used to let the system catch up and show a more accurate CPU use.  Example:

              inxi -Cxxx --sleep 0.15

              Overrides default internal value and user configuration value:

              CPU_SLEEP=0.25

       --tty  Forces internal IRC flag to off. Used in unhandled cases where the program running inxi may not be seen as a shell/pty/tty, but it is not an IRC client.  Put --tty first in
              option  list  to  avoid  unexpected errors. If you want a specific output width, use the --width option. If you want normal color codes in the output, use the -c [color ID]
              flag.

              The sign you need to use this is extra numbers before the key/value pairs of the output of your program. These are IRC, not TTY, color codes. Please post a github issue  if
              you find you need to use --tty (including the full -Ixxx line) so we can figure out how to add your program to the list of whitelisted programs.

              You  can  see  what inxi believed started it in the -Ixxx line, Shell: or Client: item. Please let us know what that result was so we can add it to the parent start program
              whitelist.

       --usb-sys
              Shortcut, legacy. See --force usb-sys

       --usb-tool
              Shortcut, legacy. See --force lsusb

       --wan-ip-url [URL]
              Force -i to use supplied URL as WAN IP source. Overrides dig or default IP source urls. URL must start with http[s] or ftp.

              The IP address from the URL must be the last item on the last (non-empty) line of the page content source code.

              Same as configuration value (example):

              WAN_IP_URL='https://mysite.com/ip.php'

       --wm   Shortcut, legacy. See --force wmctl.

       --wrap-max [integer]
              Overrides default or configuration set line starter wrap width value. Wrap max is the maximum width that inxi will wrap line starters (e.g. Info:) to their own lines,  with
              data  lines  indented  only 2 columns. If terminal/console width or --width is less than wrap width, wrapping of line starter occurs. If 80 or less, no wrapping will occur.
              Overrides internal default value (90) and user configuration value:

              WRAP_MAX=85 (previously INDENT_MIN)

              Previously called: --indent-min.

DEBUGGING OPTIONS
       --dbg 1
              - Debug downloader failures. Turns off silent/quiet mode for curl, wget, and fetch. Shows more downloader action information. Shows some more  information  for  Perl  down‐
              loader.

       --dbg [2-xx]
              - See github inxi-perl/docs/inxi-values.txt for specific specialized debugging options.

       --debug [1-3]
              - On screen debugger output.

       --debug 10
              - Basic logging. Check $XDG_DATA_HOME/inxi/inxi.log or $HOME/.local/share/inxi/inxi.log or $HOME/.inxi/inxi.log.

       --debug 11
              - Full file/system info logging.

       --debug 20
              Creates a tar.gz file of system data and collects the inxi output in a file.

              * tree traversal data file(s) read from /proc and /sys, and other system data.

              * xorg conf and log data, xrandr, xprop, xdpyinfo, glxinfo etc.

              * data from dev, disks, partitions, etc.

       --debug 21
              Automatically uploads debugger data tar.gz file to ftp.smxi.org, then removes the debug data directory, but leaves the debug tar.gz file.  See --ftp for uploading to alter‐
              nate locations.

       --debug 22
              Automatically uploads debugger data tar.gz file to ftp.smxi.org, then removes the debug data directory and the tar.gz file.  See --ftp for uploading to alternate locations.

       --ftp [ftp.yoursite.com/incoming]
              For alternate ftp upload locations: Example:

              inxi --ftp ftp.yourserver.com/incoming --debug 21

DEBUGGING OPTIONS TO DEBUG DEBUGGER FAILURES
       Only use the following in conjunction with --debug 2[012], and only use if you experienced a failure or hang, or were instructed to do so.

       --debug-proc
              Force debugger to parse /proc directory data when run as root. Normally this is disabled due to unpredictable data in /proc tree.

       --debug-proc-print
              Use this to locate file that /proc debugger hangs on.

       --debug-no-exit
              Skip exit on error when running debugger.

       --debug-no-proc
              Skip /proc debugging in case of a hang.

       --debug-no-sys
              Skip /sys debugging in case of a hang.

       --debug-sys
              Force PowerPC debugger parsing of /sys as doas[BSDs]/sudo/root.

       --debug-sys-print
              Use this to locate file that /sys debugger hangs on.

SUPPORTED IRC CLIENTS
       BitchX, Gaim/Pidgin, ircII, Irssi, Konversation, Kopete, KSirc, KVIrc, Weechat, and Xchat. Plus any others that are capable of displaying either built-in or external  script  out‐
       put.

RUNNING IN IRC CLIENT
       To trigger inxi output in your IRC client, pick the appropriate method from the list below:

       Hexchat, XChat, Irssi
              (and many other IRC clients) /exec -o inxi [options] If you don't include the -o, only you will see the output on your local IRC client.

       Konversation
              /cmd inxi [options]

              To run inxi in Konversation as a native script if your distribution or inxi package hasn't already done this for you, create this symbolic link:

              KDE 4: ln -s /usr/local/bin/inxi /usr/share/kde4/apps/konversation/scripts/inxi

              KDE 5: ln -s /usr/local/bin/inxi /usr/share/konversation/scripts/inxi

              If inxi is somewhere else, change the path /usr/local/bin to wherever it is located.

              If you are using KDE/QT 5, then you may also need to add the following to get the Konversation /inxi command to work:

              ln -s /usr/share/konversation /usr/share/apps/

              Then you can start inxi directly, like this:

              /inxi [options]

       WeeChat
              NEW: /exec -o inxi [options]

              OLD: /shell -o inxi [options]

              Newer  (2014  and  later) WeeChats work pretty much the same now as other console IRC clients, with /exec -o inxi [options]. Newer WeeChats have dropped the -curses part of
              their program name, i.e.: weechat instead of weechat-curses.

CONFIGURATION FILE
       inxi will read its configuration/initialization files in the following order:

       /etc/inxi.conf contains the default configurations. These can be overridden by creating a /etc/inxi.d/inxi.conf file (global override, which  will  prevent  distro  packages  from
       changing  or  overwriting  your  edits. This method is recommended if you are using a distro packaged inxi and want to override some configuration items from the package's default
       /etc/inxi.conf file but don't want to lose your changes on a package update.

       You can old override, per user, with a user configuration file found in one of the following locations (inxi will store its config file using the following precedence:

       if $XDG_CONFIG_HOME is not empty, it will go there, else if $HOME/.conf/inxi.conf exists, it will go there, and as a last default, the legacy location is used), i.e.:

       $XDG_CONFIG_HOME/inxi.conf > $HOME/.conf/inxi.conf > $HOME/.inxi/inxi.conf

CONFIGURATION OPTIONS
       See the documentation page for more complete information on how to set these up, and for a complete list of options:

       https://smxi.org/docs/inxi-configuration.htm

       Basic Options
              Here's a brief overview of the basic options you are likely to want to use:

              COLS_MAX_CONSOLE The max display column width on terminal.  If terminal/console width or --width is less than wrap width, wrapping of line starter occurs  COLS_MAX_IRC  The
              max display column width on IRC clients.

              COLS_MAX_NO_DISPLAY The max display column width in console, out of GUI desktop.

              CPU_SLEEP  Decimal  value  0  or  more. Default is usually around 0.35 seconds. Time that inxi will 'sleep' before getting CPU speed data, so that it reflects actual system
              state.

              DOWNLOADER Sets default inxi downloader: curl, fetch, ftp, perl, wget.  See --recommends output for more information on downloaders and Perl downloaders.

              FILTER_STRING Default <filter>. Any string you prefer to see instead for filtered values.

              LIMIT Overrides default of 10 IP addresses per IF. This is only of interest to sys admins running servers with many IP addresses.

              NO_DIG Set to 1 or true to disable WAN IP use of dig and force use of alternate downloaders.

              NO_DOAS Set to 1 or true to disable internal use of doas.

              NO_HTML_WAN Set to 1 or true to disable WAN IP use of HTML Downloaders and force use of dig only, or nothing if dig disabled as well. Same as --no-html-wan. Only use if dig
              is failing, and HTML downloaders are hanging.

              NO_SUDO Set to 1 or true to disable internal use of sudo.

              PARTITION_SORT Overrides default partition output sort. See --partition-sort for options.

              PS_COUNT The default number of items showing per -t type, m or c. Default is 5.

              SENSORS_CPU_NO  In cases of ambiguous temp1/temp2 (inxi can't figure out which is the CPU), forces sensors to use either value 1 or 2 as CPU temperature. See the above con‐
              figuration page on smxi.org for full info.

              SENSORS_EXCLUDE Exclude supplied sensor array[s] from sensor output.  Override with --sensors-default. See --sensors-exclude.

              SENSORS_USE Use only supplied sensor array[s]. Override with --sensors-default. See --sensors-use.

              SEP2_CONSOLE Replaces default key / value separator of ':'.

              USB_SYS Forces all USB data to use /sys instead of lsusb.

              WAN_IP_URL Forces -i to use supplied URL, and to not use dig (dig is generally much faster). URL must begin with http or ftp. Note that if you use this, the downloader  set
              tests will run each time you start inxi whether a downloader feature is going to be used or not.

              The IP address from the URL must be the last item on the last (non-empty) line of the URL's page content source code.

              Same as --wan-ip-url [URL]

              WEATHER_SOURCE Values: [0-9]. Same as --weather-source.  Values 4-9 are not currently supported, but this can change at any time.

              WEATHER_UNIT Values: [m|i|mi|im]. Same as --weather-unit.

              WRAP_MAX  (previously  INDENT_MIN) The maximum width where the line starter wraps to its own line. If terminal/console width or --width is less than wrap width, wrapping of
              line starter occurs. Overrides default.  See --wrap-max. If 80 or less, wrap will never happen.

       Color Options
              It's best to use the -c [94-99] color selector tool to set the following values because it will correctly update the configuration file and remove any invalid or  conflict‐
              ing items, but if you prefer to create your own configuration files, here are the options. All take the integer value from the options available in -c 94-99.

              NOTE:  All  default  and  configuration file set color values are removed when output is piped or redirected. You must use the explicit -c <color number> option if you want
              colors to be present in the piped/redirected output (creating a PDF for example).

              CONSOLE_COLOR_SCHEME The color scheme for console output (not in X/Wayland).

              GLOBAL_COLOR_SCHEME Overrides all other color schemes.

              IRC_COLOR_SCHEME Desktop X/Wayland IRC CLI color scheme.

              IRC_CONS_COLOR_SCHEME Out of X/Wayland, IRC CLI color scheme.

              IRC_X_TERM_COLOR_SCHEME In X/Wayland IRC client terminal color scheme.

              VIRT_TERM_COLOR_SCHEME Color scheme for virtual terminal output (in X/Wayland).

BUGS
       Please report bugs using the following resources.

       You may be asked to run the inxi debugger tool (see --debug 21/22), which will upload a data dump of system files for use in debugging inxi. These data dumps  are  very  important
       since they provide us with all the real system data inxi uses to parse out its report.

       Issue Report
              File an issue report: https://github.com/smxi/inxi/issues

       Forums Post on inxi forums: https://techpatterns.com/forums/forum-33.html

       IRC irc.oftc.net#smxi
              You can also visit irc.oftc.net channel: #smxi to post issues.

HOMEPAGE
       https://github.com/smxi/inxi

       https://smxi.org/docs/inxi.htm

AUTHOR AND CONTRIBUTORS TO CODE
       inxi is a fork of locsmif's very clever infobash script.

       Original infobash author and copyright holder: Copyright (C) 2005-2007 Michiel de Boer aka locsmif

       inxi version: Copyright (C) 2008-2021 Harald Hope

       This man page was originally created by Gordon Spencer (aka aus9) and is maintained by Harald Hope (aka h2 or TechAdmin).

       Initial  CPU  logic, konversation version logic, occasional maintenance fixes, and the initial xiin.py tool for /sys parsing (obsolete, but still very much appreciated for all the
       valuable debugger data it helped generate): Scott Rogers

       Further fixes (listed as known):

       Horst Tritremmel <hjt at sidux.com>

       Steven Barrett (aka: damentz) - USB audio patch; swap percent used patch.

       Jarett.Stevens - dmidecode -M patch for older systems with no /sys.

SPECIAL THANKS TO THE FOLLOWING
       The nice people at irc.oftc.net channels #linux-smokers-club and #smxi, who all really have to be considered to be co-developers because of their non-stop enthusiasm and  willing‐
       ness to provide real-time testing and debugging of inxi development.

       Siduction  forum members, who have helped get some features working by providing a large number of datasets that have revealed possible variations, particularly for the RAM -m op‐
       tion.

       AntiX users and admins, who have helped greatly with testing and debugging, particularly for the 3.0.0 release.

       ArcherSeven (Max), Brett Bohnenkamper (aka KittyKatt), and Iotaka, who always manage to find the weirdest or most extreme hardware and setups that help make inxi much more robust.

       For the vastly underrated skill of output error/glitch catching, Pete Haddow.  His patience and focus in going through inxi repeatedly to find errors and inconsistencies  is  much
       appreciated.

       For a huge boost to BSD support, Stan Vandiver, who did a lot of testing and setup many remote access systems for testing and development.

       All  the  inxi package maintainers, distro support people, forum moderators, and in particular, sys admins with their particular issues, which almost always help make inxi better,
       and any others who contribute ideas, suggestions, and patches.

       Without a wide range of diverse Linux kernel-based Free Desktop systems to test on, we could never have gotten inxi to be as reliable and solid as it's turning out to be.

       And of course, a big thanks to locsmif, who figured out a lot of the core ideas, logic, and tricks originally used in inxi Gawk/Bash.

inxi                                                                                    2021-10-11                                                                                 INXI(1)
