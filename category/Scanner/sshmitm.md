SSHMITM(8)                                                                        System Manager's Manual                                                                       SSHMITM(8)

NAME
       sshmitm - SSH monkey-in-the-middle

SYNOPSIS
       sshmitm [-d] [-I] [-p port] host [port]

DESCRIPTION
       sshmitm  proxies and sniffs SSH traffic redirected by dnsspoof(8), capturing SSH password logins, and optionally hijacking interactive sessions. Only SSH protocol version 1 is (or
       ever will be) supported - this program is far too evil already.

OPTIONS
       -d     Enable verbose debugging output.

       -I     Monitor / hijack an interactive session.

       -p port
              Specify the local port to listen on.

       host   Specify the remote host to relay connections to.

       port   Specify the remote port to relay connections to.

SEE ALSO
       dsniff(8), dnsspoof(8)

AUTHOR
       Dug Song <dugsong@monkey.org>

                                                                                                                                                                                SSHMITM(8)
