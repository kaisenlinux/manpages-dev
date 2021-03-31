RFKILL(8)                                                                            System Administration                                                                            RFKILL(8)

NAME
       rfkill - tool for enabling and disabling wireless devices

SYNOPSIS
       rfkill [options] [command] [id|type ...]

DESCRIPTION
       rfkill lists, enabling and disabling wireless devices.

       The  command  "list"  output  format  is deprecated and maintained for backward compatibility only. The new output format is the default when no command is specified or when the option
       --output is used.

       The default output is subject to change.  So whenever possible, you should avoid using default outputs in your scripts.  Always explicitly define expected columns by using the --output
       option together with a columns list in environments where a stable output is required.

OPTIONS
       -J, --json
              Use JSON output format.

       -n, --noheadings
              Do not print a header line.

       -o, --output
              Specify which output columns to print.  Use --help to get a list of available columns.

       --output-all
              Output all available columns.

       -r, --raw
              Use the raw output format.

       --help Display help text and exit.

       --version
              Display version information and exit.

COMMANDS
       help   Display help text and exit.

       event  Listen for rfkill events and display them on stdout.

       list [id|type ...]
              List  the current state of all available devices.  The command output format is deprecated, see the section DESCRIPTION.  It is a good idea to check with list command id or type
              scope is appropriate before setting block or unblock.  Special all type string will match everything.  Use of multiple id or type arguments is supported.

       block id|type [...]
              Disable the corresponding device.

       unblock id|type [...]
              Enable the corresponding device.  If the device is hard-blocked, for example via a hardware switch, it will remain unavailable though it is now soft-unblocked.

EXAMPLE
       rfkill --output ID,TYPE
       rfkill block all
       rfkill unblock wlan
       rfkill block bluetooth uwb wimax wwan gps fm nfc

AUTHORS
       rfkill was originally written by Johannes Berg ⟨johannes@sipsolutions.net⟩ and Marcel Holtmann ⟨marcel@holtmann.org⟩.  The code has been later modified by Sami Kerola ⟨kerolasa@iki.fi⟩
       and Karel Zak ⟨kzak@redhat.com⟩ for util-linux project.

       This manual page was written by Darren Salt ⟨linux@youmustbejoking.demon.co.uk⟩, for the Debian project (and may be used by others).

SEE ALSO
       powertop(8), systemd-rfkill(8), Linux kernel documentation ⟨https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/driver-api/rfkill.rst⟩

AVAILABILITY
       The rfkill command is part of the util-linux package and is available from Linux Kernel Archive ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩.

util-linux                                                                                 2017-07-06                                                                                 RFKILL(8)
