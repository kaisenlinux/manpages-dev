  WHOIS
 
## NAME
        whois - client for the whois directory service
 
## SYNOPSIS
        whois  [  { -h | --host } HOST ] [ { -p | --port } PORT ] [ -abBcdGHIKlLmMrRx ] [ -g SOURCE:FIRST-LAST ] [ -i ATTR[,ATTR]... ] [ -s SOURCE[,SOURCE]... ] [ -T
        TYPE[,TYPE]... ] [ --verbose ] OBJECT
 
        whois -q KEYWORD
 
        whois -t TYPE
 
        whois -v TYPE
 
        whois --help
 
        whois --version
 
## DESCRIPTION
        whois searches for an object in a RFC 3912 database.
 
        This version of the whois client tries to guess the right server to ask for the specified object. If no guess can be made it will connect to whois.networkso‐
        lutions.com for NIC handles or whois.arin.net for IPv4 addresses and network names.
 
## OPTIONS
        -h HOST, --host=HOST
                Connect to HOST.
 
        -H      Do not display the legal disclaimers that some registries like to show you.
 
        -p PORT, --port=PORT
                Connect to PORT.
 
        -I      First  query  whois.iana.org and then follow its referral to the whois server authoritative for that request. This works for IP addresses, AS numbers
                and domains.  BEWARE: this implies that the IANA server will receive your complete query.
 
        --verbose
                Be verbose.
 
        --help  Display online help.
 
        --version
                Display the program version.
 
        Other options are flags understood by whois.ripe.net and some other RIPE-like servers:
 
        -a      Also search all the mirrored databases.
 
        -b      Return brief IP address ranges with abuse contact.
 
        -B      Disable objects filtering. (Show the e-mail addresses.)
 
        -c      Return the smallest IP address range with a reference to an irt object.
 
        -d      Return the reverse DNS delegation object too.
 
        -g SOURCE:FIRST-LAST
                Search updates from SOURCE database between FIRST and LAST update serial number. It is useful to obtain Near Real Time Mirroring stream.
 
        -G      Disable grouping of associated objects.
 
        -i ATTR[,ATTR]...
                Inverse-search objects having associated attributes.  ATTR is the attribute name, while the positional OBJECT argument is the attribute value.
 
        -K      Return primary key attributes only. An exception is the members attribute of set objects, which is always returned. Another  exception  are  all  at‐
                tributes of the objects organisation, person and role, that are never returned.
 
        -l      Return the one level less specific object.
 
        -L      Return all levels of less specific objects.
 
        -m      Return all one level more specific objects.
 
        -M      Return all levels of more specific objects.
 
        -q KEYWORD
                Return  information  about the server.  KEYWORD can be version for the server version, sources for the list of database sources or types for the list
                of supported object types.
 
        -r      Disable recursive lookups for contact information.
 
        -R      Disable following referrals and force showing the object from the local copy in the server.
 
        -s SOURCE[,SOURCE]...
                Request the server to search for objects mirrored from SOURCE.  Sources are delimited by comma, and the order is significant.  Use the -q sources pa‐
                rameter to obtain a list of valid sources.
 
        -t TYPE Return the template for a object of TYPE.
 
        -T TYPE[,TYPE]...
                Restrict the search to objects of TYPE.  Multiple types are separated by a comma.
 
        -v TYPE Return the verbose template for a object of TYPE.
 
        -x      Search for only exact match on network address prefix.
 
## NOTES
        When  querying  the Verisign gTLDs (e.g. .com, .net...) thin registry servers for a domain, the program will automatically prepend the domain keyword to only
        show domain records.  The nameserver or registrar keywords must be used to show other kinds of records.
 
        When querying whois.arin.net for IPv4 or IPv6 networks, the CIDR netmask length will be automatically removed from the query string.
 
        When querying whois.nic.ad.jp for AS numbers, the program will automatically convert the request in the appropriate  format,  inserting  a  space  after  the
        string AS.
 
        When querying whois.denic.de for domain names and no other flags have been specified, the program will automatically add the flag -T dn.
 
        When querying whois.dk-hostmaster.dk for domain names and no other flags have been specified, the program will automatically add the flag --show-handles.
 
        RIPE-specific  command  line  options are ignored when querying non-RIPE servers. This may or may not be the behaviour intended by the user.  When using non-
        standard query parameters then the command line options which are not to be interpreted by the client must follow the -- separator (which marks the beginning
        of the query string).
 
        If  the  /etc/whois.conf configuration file exists, it will be consulted to find a server before applying the normal rules. Each line of the file should con‐
        tain a regular expression to be matched against the query text and the whois server to use, separated by white space.  IDN domains must use the ACE format.
 
        The whois protocol does not specify an encoding for characters which cannot be represented by ASCII and implementations vary wildly.  If  the  program  knows
        that a specific server uses a certain encoding, if needed it will transcode the server output to the encoding specified by the current system locale.
 
        Command line arguments will always be interpreted accordingly to the current system locale and converted to the IDN ASCII Compatible Encoding.
 
## FILES
        /etc/whois.conf
 
## ENVIRONMENT
        LANG   When  querying whois.nic.ad.jp and whois.jprs.jp English text is requested unless the LANG or LC_MESSAGES environment variables specify a Japanese lo‐
               cale.
 
        WHOIS_## OPTIONS
               A list of options which will be evaluated before the ones specified on the command line.
 
        WHOIS_SERVER
               This server will be queried if the program cannot guess where some kind of objects are located. If the variable does  not  exist  then  whois.arin.net
               will be queried.
 
## SEE ALSO
        whois.conf(5).
 
        RFC 3912: WHOIS Protocol Specification.
 
        RIPE Database Query Reference Manual: <http://www.ripe.net/data-tools/support/documentation/ripe-database-query-reference-manual>
 
## BUGS
        The  program may have buffer overflows in the command line parser: be sure to not pass untrusted data to it.  It should be rewritten to use a dynamic strings
        library.
 
 HISTORY
        This program closely tracks the user interface of the whois client developed at RIPE by Ambrose Magee and others on the base of the original BSD client.
 
## AUTHOR
        Whois and this man page were written by Marco d'Itri <md@linux.it> and are licensed under the terms of the GNU General Public License, version 2 or higher.
 
 Marco d'Itri                                                                 2019-12-30                                                                     WHOIS(1)
