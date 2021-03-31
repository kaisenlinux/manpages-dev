clamtk(1)                                                                                    clamtk                                                                                   clamtk(1)

NAME
       clamtk - Graphical user interface (gui) for Clam AntiVirus

SYNOPSIS
       clamtk
       clamtk file
       clamtk directory

DESCRIPTION
       clamtk is a frontend for Clam AntiVirus. It is designed to be a lightweight, easy-to-use, on-demand GUI virus scanner.

       clamtk is written using Perl, Python, and the Gtk+ libraries.

OPTIONS
       There  are currently no commandline options except for those noted in the synopsis. There is no point in commandline options since one can use clamscan for that.   However, clamtk does
       accept a file or directory as an argument so one can right-click on it to have the object scanned.

DIAGNOSTICS
       You may have to edit freshclam.conf and clamd.conf prior to attempting signature updates. See your distribution's documentation for more.

SEE ALSO
       clamscan(1), freshclam(1), sigtool(1).

AUTHOR
       clamtk was written by © Dave M <dave.nerd@gmail.com>, 2004-2020.

BUGS
       For information and downloads:

       Gitlab wiki page ⟨https://gitlab.com/dave_m/clamtk/-/wikis/Home⟩.

       For bugs, requests, and questions, use one of the following sites:

       Gitlab issues page ⟨https://gitlab.com/dave_m/clamtk/issues⟩.

       Launchpad issues page ⟨https://bugs.launchpad.net/clamtk⟩.

       Github Issues page ⟨https://github.com/dave-theunsub/clamtk/issues⟩.

       See the README, DISCLAIMER, and LICENSE for more information.

Dave M.                                                                                  20 March 2020                                                                                clamtk(1)
