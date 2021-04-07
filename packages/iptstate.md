IPTSTATE(8)                                                                                                                                                                    IPTSTATE(8)

NAME
       iptstate - A top-like display of IP Tables state table entries

SYNOPSIS
       iptstate [<options>]

DESCRIPTION
       iptstate  displays  information held in the IP Tables state table in real-time in a top-like format.  Output can be sorted by any field, or any field reversed. Users can choose to
       have the output only print once and exit, rather than the top-like system. Refresh rate is configurable, IPs can be resolved to names, output can be formatted, the display can  be
       filtered, and color coding are among some of the many features.

COMMAND-LINE OPTIONS
       -c, --no-color
              Toggle color-code by protocol

       -C, --counters
              Toggle display of bytes/packets counters

       -d, --dst-filter IP
              Only show states with a destination of IP Note, that this must be an IP, hostname matching is not yet supported.

       -D --dstpt-filter port
              Only show states with a destination port of port

       -h, --help
              Show help message

       -l, --lookup
              Show hostnames instead of IP addresses. Enabling this will also enable -L to prevent an ever-growing number of DNS requests.

       -m, --mark-truncated
              Mark truncated hostnames with a '+'

       -o, --no-dynamic
              Toggle dynamic formatting

       -L, --no-dns
              Skip outgoing DNS lookup states

       -f, --no-loopback
              Filter states on loopback

       -p, --no-scroll
              No scrolling (don't use a "pad"). See SCROLLING AND PADS for more information.

       -r, --reverse
              Reverse sort order

       -R, --rate seconds
              Refresh rate, followed by rate in seconds. Note that this is for statetop mode, and not applicable for single-run mode (--single).

       -1, --single
              Single run (no curses)

       -b, --sort column
              This determines what column to sort by. Options:
                   S Source Port
                   d Destination IP (or Name)
                   D Destination Port
                   p Protocol
                   s State
                   t TTL
                   b Bytes
                   P Packets
              To  sort by Source IP (or Name), don't use -b. Sorting by bytes/packets is only available for kernels that support it, and only when compiled against libnetfilter_conntrack
              (the default).

       -s, --src-filter IP
              Only show states with a source of IP. Note, that this must be an IP, hostname matching is not yet supported.

       -S, --srcpt-filter port
              Only show states with a source port of port

       -t, --totals
              Toggle display of totals

INTERACTIVE OPTIONS
       As of version 2.0, all command-line options are now available interactively using the same key as the short-option. For example, --sort is also -b, so while iptstate  is  running,
       hitting b will change the sorting to the next column. Similarly, t toggles the display of totals, and so on.

       There  are  also extra interactive options: B - change sorting to previous column (opposite of b); q - quit; and x - delete the currently highlighted state from the netfilter con‐
       ntrack table.

       Additionally, the following keys are used to navigate within iptstate:

       Up or j - Move up one line

       Down or k - Move down one line

       Left or h - Move left one column

       Right or l - Move right one column

       PageUp or ^u - Move up one page

       PageDown or ^d - Move down one page

       Home - Go to the top

       End - Go to the end

       In many cases, iptstate needs to prompt you in order to change something. For example, if you want to set or change the source-ip filter, when you hit s, iptstate will  pop  up  a
       prompt at the top of the window to ask you what you want to set it to.

       Note that like many UNIX applications, ctrl-G will tell iptstate "nevermind" - it'll remove the prompt and forget you ever hit s.

       In most cases, a blank response means "clear" - clear the source IP filter, for example.

       At  anytime  while  iptstate is running, you can hit h to get to the interactive help which will display all the current settings to you as well give you a list of all interactive
       commands available.

       While running, space will immediately update the display. Iptstate should gracefully handle all window resizes, but if it doesn't, you can force it to re-calculate and re-draw the
       screen with a ctrl-L.

       Note that hitting l to enable hostname resolution while in interactive mode will also enable L to skip all DNS entries (to prevent an ever-growing number of DNS requests).

SCROLLING AND PADS
       For  almost any user, there is no reason to turn off scrolling. The ability to turn this off - and especially the ability to toggle this interactively - is done more for theoreti‐
       cal completeness than anything else.

       But, nonetheless, here are the details. Typically in a curses application you create a "window." Windows don't scroll, however. They are, at most, the size of your terminal.  Win‐
       dows  provide double-buffering to make refreshing as fast and seemless as possible. However, to enable scrolling, one has to use "pads" instead of windows. Pads can be bigger than
       the current terminal. Then all necessary data is written to the pad, and "scrolling" becomes a function of just showing the right part of that pad on the screen.

       However, pads do not have the double-buffering feature that windows have. Thus, there _might_ be some case where for some user using some very strange  machine,  having  scrolling
       enabled could cause poor refreshing. Given the nature of the way iptstate uses the screen though, I find this highly unlikely. In addition, the scrolling method uses a little more
       memory. However, iptstate is not a memory intensive application, so this shouldn't be a problem even on low-memory systems.

       Nonetheless, if this does negatively affect you, the option to turn it off is there.

EXIT STATUS
       Anything other than 0 indicates and error. A list of current exit statuses are below:

       0      Success

       1      Bad command-line arguments

       2      Error communicating with the netfilter subsystem.

       3      Terminal too narrow

BUGS
       We don't support filtering on resolved names, and we don't support filtering on networks. IPv6 support is new and the dynamic formatting doesn't yet always handle  IPv6  addresses
       as well as it should.

BUG REPORTS
       All bugs should be reported to Phil Dibowitz <phil AT ipom DOT com>. Please see the README and BUGS for more information on bug reports. Please read the WISHLIST before sending in
       features you hope to see.

NOTES
       iptstate does a lot of work to try to fit everything on the screen in an easy-to-read way. However, in some cases, hostnames may need to be truncated (in lookup mode).  Similarly,
       IPv6  addresses may need to be truncated. The truncation of names happens from the right for source because you most likely know your own domain name, and from the left for desti‐
       nation because knowing your users are connection to "mail.a." doesn't help much. However, for addresses, this is reversed.

       iptstate does not automatically handle window-resizes while in the interactive help screen. If you do resize while in this window, you should return to the main window, hit ctrl-L
       to re-calculate and re-draw the screen, and then, if you choose, return to the interactive help.

       iptstate  currently uses libnetfilter_conntrack to access the netfilter connection state table. However, older versions read out of /proc/net/ip_conntrack, and the current version
       can still be compiled to do this. This deprecated method can be racy on SMP systems, and can hurt performance on very heavily loaded firewalls. This deprecated  method  should  be
       avoided - support will be removed in future versions.

SEE ALSO
       iptables(8)

AUTHOR
       iptstate was written by Phil Dibowitz <phil AT ipom DOT com>
       http://www.phildev.net/iptstate/

                                                                                         JUNE 2012                                                                             IPTSTATE(8)
