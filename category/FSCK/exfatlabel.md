exfatlabel(8)                                                                     System Manager's Manual                                                                    exfatlabel(8)

NAME
       exfatlabel - Get or Set volume label or volume serial of an exFAT filesystem

SYNOPSIS
       exfatlabel [ -i volume-label ] [ -v ] device [ label_string or serial_value ]
       exfatlabel -V

DESCRIPTION
       exfatlabel Print or set volume label of an existing exFAT filesystem.

       If  there  is a label_string in argument of exfatlabel, It will be written to volume label field on given device. If not, exfatlabel will just print out after reading volume label
       field from given device. If -i or --volume-serial is given, It can be switched to volume serial mode.

OPTIONS
       -i     Switch to volume serial mode.

       -V     Prints the version number and exits.

                                                                                                                                                                             exfatlabel(8)
