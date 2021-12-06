AA-ENFORCE(8)                                                                            AppArmor                                                                            AA-ENFORCE(8)

NAME
       aa-enforce - set an AppArmor security profile to enforce mode from being disabled or complain mode.

SYNOPSIS
       aa-enforce <executable> [<executable> ...] [-d /path/to/profiles] [--no-reload]

OPTIONS
       -d --dir / path/to/profiles

          Specifies where to look for the AppArmor security profile set.
          Defaults to /etc/apparmor.d.

       --no-reload
          Do not reload the profile after modifying it.

DESCRIPTION
       aa-enforce is used to set one or more profiles to enforce mode.  This command is only relevant in conjunction with the aa-complain utility which sets a profile to complain mode
       and the aa-disable utility which unloads and disables a profile.  The default mode for a security policy is enforce and the aa-complain utility must be run to change this
       behavior.

BUGS
       If you find any bugs, please report them at <https://gitlab.com/apparmor/apparmor/-/issues>.

SEE ALSO
       apparmor(7), apparmor.d(5), aa-complain(1), aa-disable(1), aa_change_hat(2), and <https://wiki.apparmor.net>.

AppArmor 3.0.3                                                                          2021-11-18                                                                           AA-ENFORCE(8)
