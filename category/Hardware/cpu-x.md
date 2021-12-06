CPU-X(1)                                                                          General Commands Manual                                                                         CPU-X(1)

NAME
       cpu-x - X11 Tool that gathers Information on CPU, Motherboard and more...

SYNOPSIS
       cpu-x [ <DISPLAY> ] [ <OPTIONS> ] cpu-x_polkit [ <DISPLAY> ] [ <OPTIONS> ]

DESCRIPTION
       CPU-X is similar to CPU-Z (for MS Windows). It can be used in graphical mode by using GTK or in text-based mode by using NCurses. A dump mode is present from the command line.

       Parts  of CPU-X require root privileges. If your desktop session has PolicyKit support, you can launch cpu-x_polkit. After admin authentication, CPU-X will present to you its full
       feature set.

OPTIONS
       Available options to be used as <DISPLAY>:

       -g, --gtk
               Start graphical user interface (GUI) (default).

       -n, --ncurses
               Start text-based user interface (TUI).

       -d, --dump
               Dump all data on standard output and exit.

       -D, --dmidecode
               Run embedded command dmidecode and exit.

       Available options to be used as <OPTIONS>:

       -a, --tab
               Set default tab (integer).

       -r, --refresh
               Set custom time between two refreshes (in seconds).

       -o, --nocolor
               Disable colored output.

       -i, --issue-fmt
               Print required information to paste in an issue.

       -v, --verbose
               Verbose output.

       -h, --help
               Print help and exit.

       -V, --version
               Print version and exit.

       Environment variables with influence on runtime functionality:

       CPUX_NETWORK
               Temporarily disable network support.

       CPUX_BCLK
               Enforce the bus clock.

AUTHOR
       This man page has been written by Mike Gabriel <mike.gabriel@das-netzwerkteam.de> for the Debian project but maybe used by others.

                                                                                       Oct 01, 2019                                                                               CPU-X(1)
