  DNSENUM
 
## NAME
        dnsenum -- multithread script to enumerate information on a domain and to discover non-contiguous IP blocks
 
 VERSION
        dnsenum version 1.2.6
 
## SYNOPSIS
        dnsenum [options] <domain> -f dns.txt
 
## DESCRIPTION
        Supported operations: nslookup, zonetransfer, google scraping, domain brute force (support also recursion), whois ip and reverse lookups.
 
        Operations:
 
        •    1) Get the host's address (A record).
 
        •    2) Get the nameservers (threaded).
 
        •    3) Get the MX record (threaded).
 
        •    4) Perform AXFR queries on nameservers (threaded).
 
        •    5) Get extra names and subdomains via google scraping (google query = "allinurl: -www site:domain").
 
        •    6) Brute force subdomains from  (REQUIRED), can also perform recursion on subdomain that have NS records (all threaded).
 
        •    7) Calculate Class C IP network ranges from the results and perform whois queries on them (threaded).
 
        •    8) Perform reverse lookups on netranges (class C or/and whois netranges)(threaded).
 
        •    9) Write to domain_ips.txt file non-contiguous ip-blocks results.
 
## OPTIONS
        The brute force -f switch takes priority over default dns.txt
 
    GENERAL OPTIONS:
            --dnsserver <server>          Use this DNS server to perform all A, NS and MX queries,
                                           the AXFR and PTR queries are sent to the domain's NS servers.
 
            --enum                        Shortcut option equivalent to --threads 5 -s 20 -w.
 
            -h,  --help                   Print the help message.
 
            --noreverse                   Skip the reverse lookup operations.
                                           Reverse lookups can take long time on big netranges.
 
            --nocolor                     Disable ANSIColor output.
                                           This option is only intended to be used on consoles that do not support
                                           color output.
 
            --private                     Show and save private ips at the end of the file domain_ips.txt.
 
            --subfile <file>              Write all valid subdomains to this file.
                                           Subdomains are taken from NS and MX records, zonetransfer,
                                           google scraping, brute force and reverse lookup hostnames.
 
            -t,  --timeout <value>        The tcp and udp timeout values in seconds (default: 10s).
 
            --threads <va>                The number of threads that will perform different queries.
 
            -v,  --verbose                Be verbose (show all the progress and all the error messages).
 
           Notes: neither the default domain nor the resolver search list are appended to domains that don't contain any dots.
 
    GOOGLE SCRAPING## OPTIONS:
           This function will scrap subdomains from google search, using query: allinurl: -www site:domain.
 
            -p,  --pages <value>          The number of google search pages to process when scraping names,
                                           the -s switch must be specified, (default: 20 pages).
 
            -s,  --scrap <value>          The maximum number of subdomains that will be scraped from google.
 
          NOTES: Google can block our queries with the malware detection.  Http proxy options for google scraping are automatically loaded from the environment if
           the vars http_proxy or HTTP_PROXY are present.  "http_proxy=http://127.0.0.1:8118/" or "HTTP_PROXY=http://127.0.0.1:8118/".  On IO errors the mechanize
           browser object will automatically call die.
 
    BRUTE FORCE## OPTIONS:
            -f,  --file <file>            Read subdomains from this file to perform brute force.
 
            -u,  --update <a|g|r|z>       Update the file specified with the -f switch with valid subdomains.
 
                                           -u a      Update using all results.
 
                                           -u g      Update using only google scraping results.
 
                                           -u r      Update using only reverse lookup results.
 
                                           -u z      Update using only zonetransfer results.
 
            -r,  --recursion              Recursion on subdomains, brute force all discovered subdomains
                                           that have an NS record.
 
          NOTES: To perform recursion first we must check previous subdomains results (zonetransfer, google scraping and brute force) for NS records after that we
           perform brute force on valid subdomains that have NS records and so on. NS, MX and reverse lookup results are not concerned.
 
    WHOIS IP## OPTIONS:
        Perform whois ip queries on c class netanges discovered from previous operations.
 
            -d,  --delay <value>          The maximum value of seconds to wait between whois queries,
                                           the value is defined randomly, (default: 3s).
 
          NOTES: whois servers will limit the number of connections.
 
            -w,  --whois                  Perform the whois queries on c class network ranges.
                                           Warning: this can generate very large netranges and it
                                           will take lot of time to perform reverse lookups.
 
          NOTES: The whois query should recursively query the various whois providers until it gets the more detailed information including either TechPhone or
           OrgTechPhone by default. See: perldoc Net::Whois::IP.  On errors the netrange will be a default c class /24.
 
    REVERSE LOOKUP## OPTIONS:
            -e,  --exclude <regexp>       Exclude PTR records that match the regexp expression from reverse
                                           lookup results, useful on invalid hostnames.
 
          NOTES: PTR records that not match the domain are also excluded.  Verbose mode will show all results.
 
 OUTPUT## FILES
        Final non-contiguous ip blocks are written to domain_ips.txt file.
 
       NOTES: Final non-contiguous ip blocks are calculated :
 
        •    1) From reverse lookups that were performed on netranges ( c class network ranges or whois netranges ).
 
        •    2) If the noreverse switch is used then they are calculated from previous operations results (nslookups, zonetransfers, google scraping and brute
             forcing).
 
 README
        dnsenum: multithread script to enumerate information on a domain and to discover non-contiguous ip blocks.
 
 PREREQUISITES
        Modules that are included in perl 5.10.0:
          Getopt::Long, IO::File, Thread::Queue.
 
        Other Necessary modules:
          Must have: Net::DNS, Net::IP, Net::Netmask.
          Optional: Net::Whois::IP, HTML::Parser, WWW::Mechanize.
 
        Perl ithreads modules (perl must be compiled with ithreads support):
          threads, threads::shared.
 
## AUTHORS
        Filip Waeytens <filip.waeytens[at]gmail.com>
 
        tix tixxDZ     <tixxdz[at]gmail.com>
 
 MAINTAINER
        Network Silence
 
 COPYRIGHT
        This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software
        Foundation; either version 2 of the License, or (at your option) any later version.
 
 SCRIPT CATEGORIES
        Networking DNS
 
 perl v5.30.3                                                                 2020-09-17                                                                   DNSENUM(1)
