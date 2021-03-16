rdesktop(1)                                                            General Commands Manual                                                           rdesktop(1)

NAME
       rdesktop - Remote Desktop Protocol client

SYNOPSIS
       rdesktop [options] server[:port]

DESCRIPTION
       rdesktop  is  a client for Remote Desktop Protocol (RDP), used in a number of Microsoft products.  It is known to work with Microsoft Windows server versions
       ranging from NT 4 terminal server to Windows Server 2012 R2.

OPTIONS
       -u <username>
              Username for authentication on the server.

       -d <domain>
              Domain for authentication.

       -s <shell>
              Startup shell for the user - starts a specific application instead of Explore.  If SeamlessRDP is enabled this is the application which is started  in
              seamless mode.

       -c <directory>
              The initial working directory for the user.  Often used in combination with -s to set up a fixed login environment.

       -p <password>
              The password to authenticate with.  Note that this may have no effect if "Always prompt for password" is enabled on the server.  WARNING: if you spec‐
              ify a password on the command line it may be visible to other users when they use tools like ps.  Use -p - to make  rdesktop  request  a  password  at
              startup (from standard input).

       -n <hostname>
              Client hostname.  Normally rdesktop automatically obtains the hostname of the client.

       -k <keyboard-map>
              Keyboard  layout  to  emulate.   This  requires  a  corresponding keymap file to be installed.  The standard keymaps provided with rdesktop follow the
              RFC1766 naming scheme: a language code followed by a country code if necessary - e.g.  en-us, en-gb, de, fr, sv, etc.

              The default keyboard map depends on the current locale (LC_* and LANG environment variables). If the current locale is unknown, the  default  keyboard
              map is en-us (a US English keyboard).

              The keyboard maps are file names, which means that they are case sensitive. The standard keymaps are all in lowercase.

              The  keyboard  maps are searched relative to the directories $HOME/.rdesktop/keymaps, KEYMAP_PATH (specified at build time), and $CWD/keymaps, in this
              order. The keyboard-map argument can also be an absolute filename.

              The special value `none' can be used instead of a keyboard map.  In this case, rdesktop will guess the scancodes from the X11 event key codes using an
              internal mapping method. This method only supports the basic alphanumeric keys and may not work properly on all platforms so its use is discouraged.

       -g <geometry>
              Desktop  geometry (WxH[@DPI][+X[+Y]]). If geometry is the special word "workarea", the geometry will be fetched from the extended window manager hints
              property _NET_WORKAREA, from the root window. The geometry can also be specified as a percentage of the whole screen, e.g. "-g 80%", "-g 80%x70%".

              If the specified geometry depends on the screen size, and the screen size is changed, rdesktop will automatically reconnect using the new screen size.
              This requires that rdesktop has been compiled with RandR support.

              The  optional  DPI  parameter should be specified if the screen rdesktop is being displayed on is too far from 96 DPI for unscaled Windows to be read‐
              able. Windows currently accepts values from 96 to 480.

              Offset placement of window is optional. Starting point is upper left corner of screen.  Window manager might push into visible area, if a panel  would
              be covered.  The schema is "-g <value>+<xoff>+<yoff>, f.e. "-g 30%+200+600".

       -i     Use  password as smartcard pin. If a valid user certificate is matched in smart card reader the password passed with p argument is used as pin for the
              smart card.  This feature also requires that smart card redirection is used using r scard argument.

       -f     Enable fullscreen mode.  This overrides the window manager and causes the rdesktop window to fully cover the current screen.  Fullscreen mode  can  be
              toggled at any time using Ctrl-Alt-Enter.

       -b     Force the server to send screen updates as bitmaps rather than using higher-level drawing operations.

       -t     Disable use of remote control. This will disable features like seamless connection sharing.

       -A <seamlessrdpshell>
              Enable  SeamlessRDP  by  specifying  the  path to seamless rdp shell.  In this mode, rdesktop creates a X11 window for each window on the server side.
              This mode requires the SeamlessRDP server side component, which is available from http://www.cendio.com/seamlessrdp/.

              When using this option, you should normally specify a startup shell which launches the desired application through SeamlessRDP.

              Example: rdesktop -A 'c:\seamlessrdp\seamlessrdpshell.exe' -s 'notepad' mywts.domain.com

              Any subsequential call to the above command line example will make use of the seamless connection sharing feature which spawns another notepad in  the
              current connection to the specified server and then exit.

       -V <tls version>
              Set  the Transport Level Security (also known as SSL) Version used.  Should be one of the following values: 1.0, 1.1, 1.2. By default all versions are
              supported.

       -B     Use the BackingStore of the Xserver instead of the integrated one in rdesktop.

       -e     Disable encryption.  This option is only needed (and will only work) if you have a French version of NT TSE.

       -E     Disable encryption from client to server.  This sends an encrypted login packet, but everything after this is unencrypted (including  interactive  lo‐
              gins).

       -m     Do not send mouse motion events.  This saves bandwidth, although some Windows applications may rely on receiving mouse motion.

       -M     Use  local X cursor inherited from window manager instead of server cursor. This is mostly useful with -m, but is also useful if the server is sending
              bogus mouse cursors.

       -C     Use private colourmap.  This will improve colour accuracy on an 8-bit display, but rdesktop will appear in false colour when not focused.

       -D     Hide window manager decorations, by using MWM hints.

       -K     Do not override window manager key bindings.  By default rdesktop attempts to grab all keyboard input when it is in focus.

       -S <button size>
              Enable single application mode. This option can be used when running a single, maximized application (via -s). When the minimize button of the windows
              application is pressed, the rdesktop window is minimized instead of the remote application. The maximize/restore button is disabled. For this to work,
              you must specify the correct button size, in pixels. The special word "standard" means 18 pixels.

       -T <title>
              Sets the window title. The title must be specified using an UTF-8 string.

       -N     Enable numlock synchronization between the Xserver and the remote RDP session.  This is useful with applications that looks at the numlock state,  but
              might cause problems with some Xservers like Xvnc.

       -X <windowid>
              Embed rdesktop-window in another window. The windowid is expected to be decimal or hexadecimal (prefixed by 0x).

       -a <bpp>
              Sets  the  colour  depth for the connection (8, 15, 16, 24 or 32).  More than 8 bpp are only supported when connecting to Windows XP (up to 16 bpp) or
              newer.  Note that the colour depth may also be limited by the server configuration. The default value is the depth of the root window.

       -z     Enable compression of the RDP datastream.

       -x <experience>
              Changes default bandwidth performance behaviour for RDP5. By default only theming is enabled, and all other options are disabled (corresponding to mo‐
              dem  (56  Kbps)). Setting experience to b[roadband] enables menu animations and full window dragging. Setting experience to l[an] will also enable the
              desktop wallpaper. Setting experience to m[odem] disables all (including themes). Experience can also be a hexadecimal number containing the flags.

       -P     Enable caching of bitmaps to disk (persistent bitmap caching). This generally improves performance (especially on low bandwidth connections)  and  re‐
              duces  network traffic at the cost of slightly longer startup and some disk space.  (10MB for 8-bit colour, 20MB for 15/16-bit colour, 30MB for 24-bit
              colour and 40MB for 32-bit colour sessions)

       -r <device>
              Enable redirection of the specified device on the client, such that it appears on the server. Note that the allowed redirections may be restricted  by
              the server configuration.

              Following devices are currently supported:

       -r comport:<comport>=<device>,...
              Redirects serial devices on your client to the server. Note that if you need to change any settings on the serial device(s), do so with an appropriate
              tool before starting rdesktop. In most OSes you would use stty. Bidirectional/Read support requires Windows XP or newer.  In Windows 2000 it will cre‐
              ate a port, but it's not seamless, most shell programs will not work with it.

       -r disk:<sharename>=<path>,...
              Redirects a path to the share \\tsclient\<sharename> on the server (requires Windows XP or newer). The share name is limited to 8 characters.

       -r lptport:<lptport>=<device>,...
              Redirects  parallel  devices  on your client to the server.  Bidirectional/Read support requires Windows XP or newer. In Windows 2000 it will create a
              port, but it's not seamless, most shell programs will not work with it.

       -r printer:<printername>[=<driver>],...
              Redirects a printer queue on the client to the server. The <printername> is the name of the queue in your local system. <driver> defaults to a  simple
              PS-driver unless you specify one. Keep in mind that you need a 100% match in the server environment, or the driver will fail. The first printer on the
              command line will be set as your default printer.

       -r sound:[local|off|remote]
              Redirects sound generated on the server to the client. "remote" only has any effect when you connect to the console with the -0 option. (Requires Win‐
              dows XP or newer).

       -r lspci
              Activates  the  lspci  channel,  which allows the server to enumerate the clients PCI devices. See the file lspci-channel.txt in the documentation for
              more information.

       -r scard[:<Scard Name>=<Alias Name>[;<Vendor Name>][,...]]
              Enables redirection of one or more smart-cards. You can provide static name binding between GNU/Linux and Windows. To do this you can use optional pa‐
              rameters  as  described: <Scard Name> - device name in GNU/Linux and UNIX environment, <Alias Name> - device name shown in Windows environment <Vendor
              Name> - optional device vendor name. For list of examples run rdesktop without parameters.

       -r clipboard:[off|PRIMARYCLIPBOARD|CLIPBOARD]
              Enable clipboard redirection. 'PRIMARYCLIPBOARD' looks at both PRIMARY and CLIPBOARD when sending data to server. 'CLIPBOARD'  looks  at  only  'CLIP‐
              BOARD'.

       -0     Attach to the console of the server (requires Windows Server 2003 or newer).

       -4     Use RDP version 4.

       -5     Use RDP version 5 (default).

       -v     Enable verbose output

CredSSP Smartcard options
       --sc-csp-name <name>
              Specify  the  CSP  (Crypto  Service Provider) to use on the windows side for the smartcard authentication. CSP is the driver for your smartcard and it
              seems like this is required to be specified for CredSSP authentication. For Swedish NetID the following CSP name is used; "Net iD - CSP".

       --sc-container-name <name>
              Specify the container name, usually this is the username for default container and it seems like this is required to be specified for CredSSP  authen‐
              tication.

       --sc-reader-name <name>
              Specify the reader name to be used to prevent the pin code being sent to wrong card if there are several readers.

       --sc-card-name <name>
              Specify the card name for example; "Telia EID IP5a".

EXIT VALUES
       0      RDP session terminated normally

       1      Administrator initiated disconnect (also returned for logoff by Windows XP joined to a domain)

       2      Administrator initiated logout

       3      Server idle session time limit reached

       4      Server active session time limit reached

       5      The session was replaced

       6      The server is out of memory

       7      The server denied the connection

       8      The server denied the connection for security reasons

       9      The user cannot connect to the server due to insufficient access privileges

       10     The server does not accept saved user credentials and requires that the user enter their credentials for each connection

       11     Disconnect initiated by user

       12     Logout initiated by user

       16     Internal licensing error

       17     No license server available

       18     No valid license available

       19     Invalid licensing message from client

       20     The client license has been modified and does no longer match the hardware ID

       21     The client license is in an invalid format

       22     Network error during licensing protocol

       23     Licensing protocol was not completed

       24     Incorrect client license encryption

       25     Can't upgrade or renew license

       26     The server is not licensed to accept remote connections

       30     The target endpoint chosen by the broker could not be found

       32     The target endpoint is disconnecting from the broker

       34     Error occurred while being redirected by broker

       35     Error while the endpoint VM was being awakened by the broker

       36     Error while the endpoint VM was being started by the broker

       37     The IP address of the endpoint VM could not be determined by the broker

       38     No available endpoints in the connection broker pool

       39     Connection processing cancelled by the broker

       40     The connection settings could not be validated by the broker

       41     Timeout while the endpoint VM was being started by the broker

       42     Session monitoring error while the endpoint VM was being started by the broker

       50     The server can only host Remote Applications

       51     Update of session keys failed

       52     Decryption or session key creation failed

       53     Encryption failed

       62     The local client window was closed

       63     Some other, unknown error occurred

       64     Command line usage error

       69     A service or resource (such as memory) is unavailable

       70     An internal software error has been detected

       71     Operating system error

       76     Protocol error or unable to connect to remote host.

LINKS
       Main website of rdesktop
       http://www.rdesktop.org/

                                                                             2017-10-28                                                                  rdesktop(1)
