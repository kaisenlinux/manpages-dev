XSENSORS(1)                                                                              User Commands                                                                              XSENSORS(1)

NAME
       xsensors - display hardware sensor information as a graphical read-out.

SYNOPSIS
       xsensors [OPTION]...

DESCRIPTION
       View the output from the libsensors library regarding hardware health in a graphical read-out.

OPTIONS
       -f     display all temperatures in Fahrenheit.

       -c filename
              specify the libsensors configuration file.

       -i filename
              specify the image file to use as the graphical theme.

       -t time
              specify the update interval in seconds.

       -v     display the version number.

CONFIGURATION
       To  find  the  proper kernel modules necessary for xsensors to work, please run the sensors-detect command as superuser and follow the on-screen instructions; a reboot may be required.
       The sensors-detect command is provided by the lm-sensors package.

FILES
       /usr/share/pixmaps/xsensors/default.xpm: the default graphical theme.

       /etc/sensors3.conf: the default configuration file.

AUTHOR
       This manual page was written by Nick Rusnov <nickrusnov@debian.org> and Nanley Chery <nanleychery@gmail.com> for the Debian GNU/Linux system (but may be used by others).

                                                                                        30 December 2012                                                                            XSENSORS(1)
