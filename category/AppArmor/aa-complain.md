AA-COMPLAIN(8)                                                                           AppArmor                                                                           AA-COMPLAIN(8)

NAME
       aa-complain - set an AppArmor security profile to complain mode.

SYNOPSIS
       aa-complain <executable> [<executable> ...] [-d /path/to/profiles] [--no-reload]

OPTIONS
       -d --dir  /path/to/profiles

          Specifies where to look for the AppArmor security profile set.
          Defaults to /etc/apparmor.d.

       --no-reload
          Do not reload the profile after modifying it.

DESCRIPTION
       aa-complain is used to set the enforcement mode for one or more profiles to complain mode.  In this mode security policy is not enforced but rather access violations are logged to
       the system log.

       Note that 'deny' rules will be enforced even in complain mode.

BUGS
       If you find any bugs, please report them at <https://gitlab.com/apparmor/apparmor/-/issues>.

SEE ALSO
       apparmor(7), apparmor.d(5), aa-enforce(1), aa-disable(1), aa_change_hat(2), and <https://wiki.apparmor.net>.

AppArmor 3.0.3                                                                          2021-11-18                                                                          AA-COMPLAIN(8)
