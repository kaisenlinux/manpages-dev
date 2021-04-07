NETSED(1)                                                                                 NetSED                                                                                 NETSED(1)

NAME
       netsed - a network stream editor.

SYNOPSIS
       netsed {proto} {lport} {rhost} {rport} {rule} [rule ...]

DESCRIPTION
       netsed is a small and handy utility to alter, in real time, the contents of packets forwarded in a network stream, or in a datagram connection. When called with a set of
       replacement rules, these rules are tested for applicability to each packet entering in either direction.

ARGUMENTS
       proto
           Determines the protocol for the desired connection: "tcp", "TCP", "udp", or "UDP".

       lport
           The local listening port for the connection. A service name, or a numerical port value, is acceptable.

       rhost
           The remote host with whom the connection is desired. Resolvable host names and IPv4/IPv6 addresses are equally usable.

           As a special case, assigning "0" to rhost will insert the kernel's knowledge of the targeted host address, in a situation where a netfilter rule is redirecting traffic. This
           happens when running a transparent proxy service.

       rport
           The remote port to connect to. A service name, or a numerical port value, is acceptable.

           Also here a value "0" will be acceptable to arrange a transparent proxy service, as the kernel's tracking will provide the intended remote port number.

       rule
           At least one replacement rule is mandatory. The general syntax for this is:

               s/pat1/pat2[/flag]

           The effect is to replace the text that matches pat1 with the expansion of pat2. The optional parameter flag is a composite containing a numerical value limiting the maximal
           number of times the rule can be applied, or a direction semaphore indicating that the rule applies only to incoming (coded as 'I' or 'i') or outgoing ('O' or 'o') traffic. One
           could say that the rule expires after num occurrences.

           The rules are applied in succession to all passing packets, flowing in either direction. As soon as a rule has been expired, it is removed from the collection of active rules
           for the current connection. Observe that any counter is started as the connection is initiated, running as long as the connection is alive.

           This holds directly for TCP connections, whereas for UDP a connection is considered to consist of incoming data on fixed address and fixed port together with any response from
           a remote server. When no datagrams have been transmitted for a period of 30 seconds, the UPD connection is seen as closed.

           A single rule is limited to act on individual packets; a pattern can not match across packet boundaries.

           Using HTTP-like escape sequences for hexadecimal values, all eight-bit characters are viable in the patterns. Thus the standard character pair CRNL would code as "%0a%0d". In
           a pattern, the percentage sign itself must be escaped by duplication. Thus a string "%%" is interpreted in a pattern as a literal percentage sign.

EXAMPLES
       A handful replacement rules are handy as examples.

       s/andrew/mike
           Replace every occurrence of the string "andrew" with "mike", in every passing packet.

       s/andrew/mike/1
           Replace only the first occurrence of the string "andrew" for "mike" in each packet. Any repetition is unaltered, unless a further rule specifies some replacement.

       s/andrew/mike%00%00
           Replace in each packet every occurrence of the string "andrew" with "mike\x00\x00" . The padding with two null bytes ensures an unaltered packet length, which might be
           essential at times.

       s/%%/%2f/20
           Replace the first twenty occurrences of the percentage character '%' with slashes '/'.

       s/Rilke/Proust/o, s/Proust/Rilke/i
           Let Rilke travel incognito as Proust, i.e., on outgoing packets replace Rilke's real sirname by Proust, then restore it again in any incoming packet.

AUTHOR
       This text was initially compiled by Mats Erik Andersson as a Docbook source from the usage printout. Permission is granted to copy, distribute and/or modify this document under
       the terms of the GNU General Public License, version 2, or of a later version.

COPYRIGHT
       Copyright © 2010-2014 Mats Erik Andersson

NetSED 1.2                                                                            May 23rd, 2014                                                                             NETSED(1)
