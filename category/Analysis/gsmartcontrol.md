GSmartControl(1)                                                                       User Commands                                                                      GSmartControl(1)

NAME
       GSmartControl - Hard disk drive and SSD health inspection tool

SYNOPSIS
       gsmartcontrol [OPTIONS]

       gsmartcontrol-root [--desktop=<desktop>] [OPTIONS]

DESCRIPTION
       GSmartControl  is  a graphical user interface for smartctl (from smartmontools), which is a tool for querying and controlling SMART (Self-Monitoring, Analysis, and Reporting Tech‐
       nology) data on modern hard disk and solid-state drives. It allows you to inspect the drive's SMART data to determine its health, as well as run various tests on it.

       This manual page documents briefly the gsmartcontrol and gsmartcontrol-root commands.

       gsmartcontrol-root command launches gsmartcontrol with administrative privileges. The desktop argument specifies which desktop is currently running, for automatic selection of na‐
       tive su mechanism. Valid values for desktop are auto, kde, gnome, other.

OPTIONS
   Help Options:
       -?, --help
              Show help options

       --help-all
              Show all help options

       --help-gtk
              Show GTK+ options

       --help-debug
              Show logging options

   Application Options:
       -l, --no-locale
              Don't use system locale

       -V, --version
              Display version information

       --no-scan
              Don't scan devices on startup

       --no-hide-tabs
              Don't hide non-identity tabs when SMART is disabled. Useful for debugging.

       --add-virtual
              Load smartctl data from file, creating a virtual drive. You can specify this option multiple times.

       --add-device
              Add this device to device list. The format of the device is <device>::<type>::<extra_args>, where type and extra_args are optional.  This option is useful with --no-scan to
              list certain drives only. You can specify this option multiple times. Example:
              --add-device /dev/sda --add-device /dev/twa0::3ware,2 --add-device '/dev/sdb::::-T permissive'

       --display=DISPLAY
              X display to use

       -v, --verbose
              Enable verbose logging; same as --verbosity-level 5

       -q, --quiet
              Disable logging; same as --verbosity-level 0

       -b, --verbosity-level
              Set verbosity level [0-5]

COPYRIGHT
       Copyright © 2008 - 2012  Alexander Shaduri <ashaduri ´at´ gmail.com>

AUTHOR
       This manual page was originally written by Giuseppe Iuculano <giuseppe@iuculano.it> for the Debian project.

gsmartcontrol                                                                                                                                                             GSmartControl(1)
