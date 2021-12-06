AA-UPDATE-BROWSER(8)                                                                     AppArmor                                                                     AA-UPDATE-BROWSER(8)

NAME
       aa-update-browser - update browser profiles with browser abstractions

SYNOPSIS
       aa-update-browser [option] <profile>

DESCRIPTION
       aa-update-browser will list current browser abstractions in /etc/apparmor.d/abstractions/ubuntu-browsers.d as well as update browser profiles to use those abstractions.

OPTIONS
       aa-update-browser accepts the following arguments:

       -d  dry-run. Only show what would be done.

       -u ABSTRACTIONS
           update the specified profile with the comma-separated list of ABSTRACTIONS. Specifying '' will remove all ABSTRACTIONS.

       -l  show supported browser abstractions

       -h  show help

BUGS
       aa-update-browser will always add the plugins-common abstraction if the list of abstractions ABSTRACTIONS is not empty.

       If you find any additional bugs, please report them to Launchpad at <https://bugs.launchpad.net/ubuntu/apparmor/+filebug>.

SEE ALSO
       apparmor(7)

Canonical Ltd                                                                           2010-08-11                                                                    AA-UPDATE-BROWSER(8)
