  MDNS-SCAN
 
## NAME
        mdns-scan - Scan for mDNS/DNS-SD services published on the local network
 
## SYNOPSIS
        mdns-scan
 
## DESCRIPTION
        mdns-scan  is  a  tool  for  scanning  for  mDNS/DNS-SD published services on the local network. It issues a mDNS PTR query to the special RR _services._dns-
        sd._udp.local for retrieving a list of all currently registered services on the local link.
 
## OPTIONS
        mdns-scan has no commandline options.
 
## NOTES
        mdns-scan is not a good mDNS citizen since it queries continuously for services and doesn't implement features like Duplicate Suppression. It is intended for
        usage as a debugging tool only.
 
        mdns-scan  is incomplete since it doesn't resolve mDNS services for you - it just dumps their PTR RRs. To understand these records you need minimal knowledge
        of DNS-SD and how it works.
 
        mdns-scan does not terminate on its own behalf. It scans for services continuously until the user kills it by pressing C-c.
 
        mdns-scan does not rely on a local mDNS responder daemon. It has no dependencies besides the GNU libc. It has been tested on Linux only.
 
        mdns-scan does NOT scan for local mDNS enabled hosts or A/AAAA RRs, it scans for DNS-SD registered services, nothing else.
 
## SEE ALSO
        mDNSResponder(8)
 
## AUTHOR
        mdns-scan has been written by Lennart Poettering <mzqrovna@0pointer.de>
 
 0.4                                                                         Jan 21, 2004                                                                MDNS-SCAN(1)
