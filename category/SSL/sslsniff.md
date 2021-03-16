SSLSNIFF(1)                                                            General Commands Manual                                                           SSLSNIFF(1)

NAME
       sslsniff - SSL/TLS man-in-the-middle attack tool

SYNOPSIS
       sslsniff [options]

DESCRIPTION
       This manual page documents briefly the sslsniff command.

       sslsniff  is  designed to create man-in-the-middle (MITM) attacks for SSL/TLS connections, and dynamically generates certs for the domains that are being ac‐
       cessed on the fly. The new certificates are constructed in a certificate chain that is signed by any certificate that is provided.
       sslsniff also supports other attacks like null-prefix or OCSP attacks to achieve silent interceptions of connections when possible.

OPTIONS
       Modes:

       -a     Authority mode.  Specify a certificate that will act as a CA.

       -t     Targeted mode.  Specify a directory full of certificates to target.

       Required options:

       -c <file|directory>
              File containing CA cert/key (authority mode) or directory containing a collection of certs/keys (targeted mode)

       -s <port>
              Port to listen on for SSL interception.

       -w <file>
              File to log to

       Optional options:

       -u <updateLocation>
              Location of any Firefox XML update files.

       -m <certificateChain>
              Location of any intermediary certificates.

       -h <port>
              Port to listen on for HTTP interception (required for fingerprinting).

       -f <ff,ie,safari,opera>
              Only intercept requests from the specified browser(s).

       -d     Deny OCSP requests for our certificates.

       -p     Only log HTTP POSTs

       -e <url>
              Intercept Mozilla Addon Updates

       -j <sha256>
              The sha256sum value of the addon to inject

NOTES
       sslsniff works only on the FORWARD traffic (not on INPUT or OUTPUT).

EXAMPLES
       To intercept traffic on port 8443, start sslsniff on a local port:

              sslsniff -a -c /usr/share/sslsniff/certs/wildcard -s 4433 -w /tmp/sslsniff.log

       and redirect traffic to this port using the iptables nat table:

              iptables -t nat -A PREROUTING -p tcp --destination-port 8443 -j REDIRECT --to-ports 4433

AUTHOR
       sslsniff was written by Moxie Marlinspike.

       This manual page was written by Pierre Chifflier <pollux@debian.org>, for the Debian project (and may be used by others).

                                                                           August 16, 2009                                                               SSLSNIFF(1)
