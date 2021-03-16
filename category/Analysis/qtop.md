qtop(1)                                                                     User Commands                                                                    qtop(1)

NAME
       qtop - A graphical alternative to show the running processes.

DESCRIPTION
   Usage:
              qtop [options]

   Application Options:
       -h, --help
              print this help and exit

       -v, --version
              print application version and exits

       -u, --user
              string  user name from whom the process list will be shown

   Server Options:
       -q, --abort
              exit existing instance

       -r, --replace
              replace existing application instance with new one

       --no-server
              ignore server mode. Run new application instance

       --server-host string
              use specified host for server communication

       --server-port integer
              use specified port for server communication

   Qt Options:
       -graphicssystem string
              Qt drawing backend (native|raster)

       -style string  Qt widget style

       Special tag "-" can be added to separate options from the last list of arguments

              (e.g. list of files to be opened)

       qtop: 2.3.4

SEE ALSO
       The full documentation for qtop is maintained as a Texinfo manual.  If the info and qtop programs are properly installed at your site, the command

              info qtop

       should give you access to the complete manual.

qtop 2.3.4                                                                    June 2015                                                                      qtop(1)
