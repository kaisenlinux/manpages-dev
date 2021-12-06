ssmping(1)                                                                        General Commands Manual                                                                       ssmping(1)

NAME
       ssmping - check if you can receive IPv4/IPv6 multicast data from an internet host

SYNOPSIS
       ssmping [ -46v ] [ -I interface ] [ -c count ] [ -s size ] host

       ssmpingd

DESCRIPTION
       ssmping  and  ssmpingd are network level multicast management tools that can be used to check whether one can receive multicast packets via SSM from a host.  The host target given
       to ssmping must run the ssmpingd daemon, which listens on UDP port 4321 for IPv4 and IPv6 unicast requests.  When it receives one, it responds to a well known SSM multicast  group
       which ssmping just have joined.  Depending on whether the request was made with IPv4 or IPv6, the group is 232.43.211.234 or ff3e::4321:1234 respectively.

OPTIONS
       For ssmpingd there are no options.  For ssmping the options are as follows.

       -4     Force IPv4

       -6     Force IPv6

       -v     Print client and server version information.

       -I interface
              Interface to join on

       -c count
              Stop after sending (and receiving) count requests (and replies)

       -s size
              Request replies to have a size of size bytes

SEE ALSO
       asmping(1) a tool for checking whether can receive ASM.

       dbeacon(1) a distributed beacon multicast implementation.

BUGS
       Please report them to Stig Venaas <venaas@uninett.no>, the author of this tool.

HISTORY
       ssmping and ssmpingd were developed by Stig Venaas during the early days of the m6bone, the IPv6 multicast backbone.

                                                                                       User Manuals                                                                             ssmping(1)
