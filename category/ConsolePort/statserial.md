STATSERIAL(1)                                                                          User Commands                                                                         STATSERIAL(1)

NAME
       statserial - display serial port modem status lines

SYNOPSIS
       statserial [-n |  -d | -x] <device-name>

DESCRIPTION
       Statserial  displays  a  table of the signals on a standard 9-pin or 25-pin serial port, and indicates the status of the handshaking lines. It can be useful for debugging problems
       with serial ports or modems.

       The optional device-name parameter is the full name of the device file for the serial port in question. If not specified, the default is taken from the environment variable  MODEM
       if set, otherwise /dev/ttyS0.

COMMAND-LINE OPTIONS
       Each of the command line options is mutually exclusive.

       -n   Normally statserial will loop continuously, updating the status at one second intervals; you can exit using Control-C. The -n option disables looping.

       -d

            With this option the status of the modem is printed as a decimal number. The bits are encoded as follows (XXX indicates unused bits):

            +---+---+---+---+---+---+---+---+---+
            | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
            +---+---+---+---+---+---+---+---+---+
            |DSR|RI |DCD|CTS|XXX|XXX|RTS|DTR|XXX|
            +---+---+---+---+---+---+---+---+---+

       -x   This option is the same as -d, except that the output is in hexadecimal.

BUGS/LIMITATIONS
       Statserial only works with devices that support the TIOCMGET ioctl.

       You need permission to read the device file.

       The device file may be locked if other applications are using it.

AUTHOR
       Statserial  was  written by Jeff Tranter (Jeff_Tranter@Mitel.COM), later updated by Frank Baumgart (godot@uni-paderborn.de) and is released under the conditions of the GNU General
       Public License.  See the file COPYING and notes in the source code for details.

SEE ALSO
       setserial(8) stty(1)
       /usr/src/linux/drivers/char/serial.c /usr/include/linux/termios.h

Linux                                                                                17 December 1994                                                                        STATSERIAL(1)
