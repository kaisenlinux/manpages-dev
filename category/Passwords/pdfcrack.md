PDFCRACK(1)                                                                         General Commands Manual                                                                         PDFCRACK(1)

NAME
       pdfcrack - Password recovery tool for PDF-files

SYNOPSIS
       pdfcrack [ -f ] FILE [OPTION]...

DESCRIPTION
       PDFCrack is a tool for recovering passwords and content from PDF-files.

       If aborted with Ctrl-C or by receiving a SIGINT signal, pdfcrack will automatically save current position. The position will be saved in a file called savedstate.sav in current working
       directory.

       Mandatory arguments for long options are mandatory for short options too.

OPTIONS
       -b, --bench
              perform benchmark and exit

       -c, --charset=STRING
              Use the characters in STRING as charset

       -w, --wordlist=FILE
              Use FILE as source of passwords to try

       -n, --minpw=INTEGER
              Skip trying passwords shorter than INTEGER

       -m, --maxpw=INTEGER
              Stop when reaching this INTEGER passwordlength

       -l, --loadstate=FILE
              Continue from the state saved in FILE

       -o, --owner
              Work with the ownerpassword

       -u, --user
              Work with the userpassword (default)

       -p, --password=STRING
              Give userpassword to speed up breaking ownerpassword (implies -o)

       -q, --quiet
              Run quietly

       -s, --permutate
              Try permutating the passwords (currently only supports switching first character to uppercase)

       -v, --version
              Print version and exit

REPORTING BUGS
       Via e-mail to Henning Noren <confusion42@users.sourceforge.net> or report on project page at http://pdfcrack.sourceforge.net/

AUTHOR
       Henning Noren

COPYRIGHT
       Copyright © 2009 Henning Noren <confusion42@users.sourceforge.net>
       This is free software.  You may redistribute copies of it under the terms of the GNU General Public License <http://www.gnu.org/licenses/gpl.html>.  There is NO WARRANTY, to the extent
       permitted by law.

User Commands                                                                            February 2009                                                                              PDFCRACK(1)
