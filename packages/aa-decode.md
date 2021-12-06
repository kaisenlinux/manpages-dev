AA-DECODE(8)                                                                             AppArmor                                                                             AA-DECODE(8)

NAME
       aa-decode - decode hex-encoded in AppArmor log files

SYNOPSIS
       aa-decode [option] <HEX STRING>

DESCRIPTION
       aa-decode will decode hex-encoded strings as seen in AppArmor log output. It will also take an audit log on standard input and convert any hex-encoded AppArmor log entries and
       display them on standard output.

OPTIONS
       --help
           displays a short usage statement.

EXAMPLES
         $ aa-decode 2F746D702F666F6F20626172
         Decoded: /tmp/foo bar

         $ cat /var/log/kern.log | aa-decode
         ... denied_mask="r::" fsuid=1000 ouid=1000 name=/tmp/foo bar

BUGS
       None. Please report any you find to gitlab at <https://gitlab.com/apparmor/apparmor/-/issues>.

SEE ALSO
       apparmor(7)

AppArmor 3.0.3                                                                          2021-11-18                                                                            AA-DECODE(8)
