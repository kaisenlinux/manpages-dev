WEBMITM(8)                                                                        System Manager's Manual                                                                       WEBMITM(8)

NAME
       webmitm - HTTP / HTTPS monkey-in-the-middle

SYNOPSIS
       webmitm [-d] [host]

DESCRIPTION
       webmitm transparently proxies and sniffs HTTP / HTTPS traffic redirected by dnsspoof(8), capturing most "secure" SSL-encrypted webmail logins and form submissions.

OPTIONS
       -d     Enable debugging mode. May be specified multiple times to greater effect.

       host   Specify a host to proxy to. If none given, only requests containing an HTTP/1.1 Host: header or absolute URI will be relayed transparently.

FILES
       webmitm.crt
              SSL certificate

SEE ALSO
       dsniff(8), dnsspoof(8)

AUTHOR
       Dug Song <dugsong@monkey.org>

                                                                                                                                                                                WEBMITM(8)
