SOCKSTAT(1)                                                          BSD General Commands Manual                                                         SOCKSTAT(1)

NAME
     sockstat — list open sockets

SYNOPSIS
     sockstat [-46clhu] [-p ports] [-P pid|process] [-U uid|user] [-G gid|group] [-R protocol]

DESCRIPTION
     The sockstat command lists open Internet or UNIX domain sockets.

     The following options are available:

     -4          Show IPv4 sockets only.

     -6          Show IPv6 sockets only.

     -u          Also show unix sockets.

     -c          Show connected sockets.

     -l          Show listening sockets.

     -h          Show a usage summary.

     -p ports    Only show Internet sockets if either the local or foreign port number is on the specified list.  The ports argument is a comma-separated list of
                 port numbers and ranges specified as first and last port separated by a dash.

     -P pid|process
                 Only show sockets of the specified pid|process.  The pid|process argument is a process name or pid.

     -U uid|user
                 Only show sockets of the specified uid|user.  The uid|user argument is a username or uid.

     -G gid|group
                 Only show sockets of the specified gid|group.  The gid|group argument is a groupname or gid.

     -R protocol
                 Only show sockets of the specified protocol.  The protocol argument is either 'raw', 'tcp', 'udp' or 'unix'

     If neither -c or -l is specified, sockstat will list both listening and connected sockets.

     The information listed for each socket is:

     USER             The user who owns the socket.

     COMMAND          The command which holds the socket.

     PID              The process ID of the command which holds the socket.

     FD               The file descriptor number of the socket.

     PROTO            The transport protocol associated with the socket for Internet sockets, or the type of socket (stream or datagram) for UNIX sockets.

     LOCAL ADDRESS    For Internet sockets, this is the address the local end of the socket is bound to (see getsockname(2)).  For bound UNIX sockets, it is the
                      socket's filename.  For other UNIX sockets, it is a right arrow followed by the endpoint's filename, or “??” if the endpoint could not be de‐
                      termined.

     FOREIGN ADDRESS  (Internet sockets only) The address the foreign end of the socket is bound to (see getpeername(2)).

SEE ALSO
     netstat(1), protocols(5)

HISTORY
     The sockstat command appeared in FreeBSD 3.1.

AUTHORS
     The sockstat command and this manual page were written by Dag-Erling Smørgrav <des@FreeBSD.org>.

     The sockstat command was ported to Linux by William Pitcock <nenolod@nenolod.net>.

BSD                                                                         May 18, 2008                                                                         BSD
