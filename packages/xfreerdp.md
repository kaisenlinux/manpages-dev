  XFREERDP
 
## NAME
        xfreerdp - FreeRDP X11 client
 
## SYNOPSIS
        xfreerdp [file] [options] [/v:server[:port]]
 
## DESCRIPTION
        xfreerdp is an X11 Remote Desktop Protocol (RDP) client which is part of the FreeRDP project. An RDP server is built-in to many editions of Windows.
        Alternative servers included xrdp and VRDP (VirtualBox).
 
## OPTIONS
        /a:addin[,options], /addin:addin[,options]
            Addin
 
        /action-script:file-name
            Action script (default:~/.config/freerdp/action.sh)
 
        /admin, /console
            Admin (or console) session
 
        +aero
            desktop composition (default:off)
 
        /app:path or ||alias
            Remote application program
 
        /app-cmd:parameters
            Remote application command-line parameters
 
        /app-file:file-name
            File to open with remote application
 
        /app-guid:app-guid
            Remote application GUID
 
        /app-icon:icon-path
            Remote application icon for user interface
 
        /app-name:app-name
            Remote application name for user interface
 
        /app-workdir:workspace path
            Remote application workspace path
 
        /assistance:password
            Remote assistance password
 
        /auto-request-control:
            Automatically request remote assistance input control
 
        +async-channels
            Asynchronous channels (experimental) (default:off)
 
        +async-input
            Asynchronous input (default:off)
 
        +async-update
            Asynchronous update (default:off)
 
        /audio-mode:mode
            Audio output mode
 
        +auth-only
            Authenticate only (default:off)
 
        -authentication
            Authentication (experimental) (default:on)
 
        +auto-reconnect
            Automatic reconnection (default:off)
 
        /auto-reconnect-max-retries:retries
            Automatic reconnection maximum retries, 0 for unlimited [0,1000]
 
        +bitmap-cache
            bitmap cache (default:off)
 
        /bpp:depth
            Session bpp (color depth) (default:16)
 
        /buildconfig
            Print the build configuration
 
        /cert:[deny,ignore,name:name,tofu,fingerprint:hash:hash as hex[,fingerprint:hash:another hash]]
            Certificate accept options. Use with care! * deny ... Automatically abort connection if the certificate does not match, no user interaction. * ignore ...
            Ignore the certificate checks altogether (overrules all other options) * name ... Use the alternate <name> instead of the certificate subject to match
            locally stored certificates * tofu ... Accept certificate unconditionally on first connect and deny on subsequent connections if the certificate does not
            match * fingerprints ... A list of certificate hashes that are accepted unconditionally for a connection
 
        /cert-deny
            [deprecated, use /cert:deny] Automatically abort connection for any certificate that can not be validated.
 
        /cert-ignore
            [deprecated, use /cert:ignore] Ignore certificate
 
        /cert-name:name
            [deprecated, use /cert:name:<name>] Certificate name
 
        /cert-tofu
            [deprecated, use /cert:tofu] Automatically accept certificate on first connect
 
        /client-build-number:number
            Client Build Number sent to server (influences smartcard behaviour, see [MS-RDPESC])
 
        /client-hostname:name
            Client Hostname to send to server
 
        -clipboard
            Redirect clipboard (default:on)
 
        /codec-cache:[rfx|nsc|jpeg]
            Bitmap codec cache
 
        -compression, -z
            compression (default:on)
 
        /compression-level:level
            Compression level (0,1,2)
 
        +credentials-delegation
            credentials delegation (default:off)
 
        /d:domain
            Domain
 
        -decorations
            Window decorations (default:on)
 
        /disp
            Display control
 
        /drive:name,path
            Redirect directory <path> as named share <name>. Hotplug support is enabled with /drive:hotplug,*. This argument provides the same function as "Drives
            that I plug in later" option in MSTSC.
 
        +drives
            Redirect all mount points as shares (default:off)
 
        /dvc:channel[,options]
            Dynamic virtual channel
 
        /dynamic-resolution
            Send resolution updates when the window is resized
 
        /echo, /echo
            Echo channel
 
        -encryption
            Encryption (experimental) (default:on)
 
        /encryption-methods:[40,][56,][128,][FIPS]
            RDP standard security encryption methods
 
        /f
            Fullscreen mode (<Ctrl>+<Alt>+<Enter> toggles fullscreen)
 
        -fast-path
            fast-path input/output (default:on)
 
        +fipsmode
            FIPS mode (default:off)
 
        /floatbar[:sticky:[on|off],default:[visible|hidden],show:[always|fullscreen||window]]
            floatbar is disabled by default (when enabled defaults to sticky in fullscreen mode)
 
        -fonts
            smooth fonts (ClearType) (default:on)
 
        /frame-ack:number
            Number of frame acknowledgement
 
        /from-stdin[:force]
            Read credentials from stdin. With <force> the prompt is done before connection, otherwise on server request.
 
        /g:gateway[:port]
            Gateway Hostname
 
        /gateway-usage-method:[direct|detect], /gum:[direct|detect]
            Gateway usage method
 
        /gd:domain
            Gateway domain
 
        /gdi:sw|hw
            GDI rendering
 
        /geometry
            Geometry tracking channel
 
        +gestures
            Consume multitouch input locally (default:off)
 
        /gfx[:RFX]
            RDP8 graphics pipeline
 
        +gfx-progressive
            RDP8 graphics pipeline using progressive codec (default:off)
 
        +gfx-small-cache
            RDP8 graphics pipeline using small cache mode (default:off)
 
        +gfx-thin-client
            RDP8 graphics pipeline using thin client mode (default:off)
 
        +glyph-cache
            Glyph cache (experimental) (default:off)
 
        /gp:password
            Gateway password
 
        -grab-keyboard
            Grab keyboard (default:on)
 
        /gt:[rpc|http|auto]
            Gateway transport type
 
        /gu:[[domain\]user|user[@domain]]
            Gateway username
 
        /gat:access token
            Gateway Access Token
 
        /h:height
            Height (default:768)
 
        -heartbeat
            Support heartbeat PDUs (default:on)
 
        /help, /?
            Print help
 
        +home-drive
            Redirect user home as share (default:off)
 
        /ipv6, /6
            Prefer IPv6 AAA record over IPv4 A record
 
        /kbd:0xid or name
            Keyboard layout
 
        /kbd-lang:0xid
            Keyboard active language identifier
 
        /kbd-fn-key:value
            Function key value
 
        /kbd-list
            List keyboard layouts
 
        /kbd-lang-list
            List keyboard languages
 
        /kbd-subtype:id
            Keyboard subtype
 
        /kbd-type:id
            Keyboard type
 
        /load-balance-info:info-string
            Load balance info
 
        /log-filters:tag:level[,tag:level[,...]]
            Set logger filters, see wLog(7) for details
 
        /log-level:[OFF|FATAL|ERROR|WARN|INFO|DEBUG|TRACE]
            Set the default log level, see wLog(7) for details
 
        /max-fast-path-size:size
            Specify maximum fast-path update size
 
        /max-loop-time:time
            Specify maximum time in milliseconds spend treating packets
 
        +menu-anims
            menu animations (default:off)
 
        /microphone[:[sys:sys,][dev:dev,][format:format,][rate:rate,][channel:channel]], /mic[:[sys:sys,][dev:dev,][format:format,][rate:rate,][channel:channel]]
            Audio input (microphone)
 
        /monitor-list
            List detected monitors
 
        /monitors:id[,id[,...]]
            Select monitors to use
 
        -mouse-motion
            Send mouse motion (default:on)
 
        /multimon[:force]
            Use multiple monitors
 
        +multitouch
            Redirect multitouch input (default:off)
 
        +multitransport
            Support multitransport protocol (default:off)
 
        -nego
            protocol security negotiation (default:on)
 
        /network:[modem|broadband|broadband-low|broadband-high|wan|lan|auto]
            Network connection type
 
        /nsc, /nscodec
            NSCodec support
 
        +offscreen-cache
            offscreen bitmap cache (default:off)
 
        /orientation:[0|90|180|270]
            Orientation of display in degrees
 
        +old-license
            Use the old license workflow (no CAL and hwId set to 0) (default:off)
 
        /p:password
            Password
 
        /parallel[:name[,path]]
            Redirect parallel device
 
        /parent-window:window-id
            Parent window id
 
        +password-is-pin
            Use smart card authentication with password as smart card PIN (default:off)
 
        /pcb:blob
            Preconnection Blob
 
        /pcid:id
            Preconnection Id
 
        /pheight:height
            Physical height of display (in millimeters)
 
        /play-rfx:pcap-file
            Replay rfx pcap file
 
        /port:number
            Server port
 
        -suppress-output
            suppress output when minimized (default:on)
 
        +print-reconnect-cookie
            Print base64 reconnect cookie after connecting (default:off)
 
        /printer[:name[,driver]]
            Redirect printer device
 
        /proxy:[proto://][user:password@]host:port
            Proxy settings: override env. var (see also environment variable below). Protocol "socks5" should be given explicitly where "http" is default.
 
        /pth:password-hash, /pass-the-hash:password-hash
            Pass the hash (restricted admin mode)
 
        /pwidth:width
            Physical width of display (in millimeters)
 
        /rdp2tcp:executable path[:arg...]
            TCP redirection
 
        /reconnect-cookie:base64-cookie
            Pass base64 reconnect cookie to the connection
 
        /redirect-prefer:FQDN|IP|NETBIOS,[...]
            Override the preferred redirection order
 
        /relax-order-checks, /relax-order-checks
            Do not check if a RDP order was announced during capability exchange, only use when connecting to a buggy server
 
        /restricted-admin, /restrictedAdmin
            Restricted admin mode
 
        /rfx
            RemoteFX
 
        /rfx-mode:[image|video]
            RemoteFX mode
 
        /scale:[100|140|180]
            Scaling factor of the display (default:100)
 
        /scale-desktop:percentage
            Scaling factor for desktop applications (value between 100 and 500) (default:100)
 
        /scale-device:100|140|180
            Scaling factor for app store applications (default:100)
 
        /sec:[rdp|tls|nla|ext]
            Force specific protocol security
 
        +sec-ext
            NLA extended protocol security (default:off)
 
        -sec-nla
            NLA protocol security (default:on)
 
        -sec-rdp
            RDP protocol security (default:on)
 
        -sec-tls
            TLS protocol security (default:on)
 
        /serial[:name[,path[,driver[,permissive]]]], /tty[:name[,path[,driver[,permissive]]]]
            Redirect serial device
 
        /shell:shell
            Alternate shell
 
        /shell-dir:dir
            Shell working directory
 
        /size:widthxheight or percent%[wh]
            Screen size (default:1024x768)
 
        /smart-sizing[:widthxheight]
            Scale remote desktop to window size
 
        /smartcard[:str[,str...]]
            Redirect the smartcard devices containing any of the <str> in their names.
 
        /smartcard-logon
            Activates Smartcard Logon authentication. (EXPERIMENTAL: NLA not supported)
 
        /sound[:[sys:sys,][dev:dev,][format:format,][rate:rate,][channel:channel,][latency:latency,][quality:quality]],
        /audio[:[sys:sys,][dev:dev,][format:format,][rate:rate,][channel:channel,][latency:latency,][quality:quality]]
            Audio output (sound)
 
        /span
            Span screen over multiple monitors
 
        /spn-class:service-class
            SPN authentication service class
 
        /ssh-agent, /ssh-agent
            SSH Agent forwarding channel
 
        /t:title, /title:title
            Window title
 
        -themes
            themes (default:on)
 
        /timeout:time in ms, /timeout:time in ms
            Advanced setting for high latency links: Adjust connection timeout, use if you encounter timeout failures with your connection (default:9000)
 
        /tls-ciphers:[netmon|ma|ciphers]
            Allowed TLS ciphers
 
        /tls-seclevel:level
            TLS security level - defaults to 1 (default:1)
 
        -toggle-fullscreen
            Alt+Ctrl+Enter to toggle fullscreen (default:on)
 
        /tune:setting:value,setting:value
            [experimental] directly manipulate freerdp settings, use with extreme caution! (default:)
 
        /tune-list
            Print options allowed for /tune
 
        /u:[[domain\]user|user[@domain]]
            Username
 
        +unmap-buttons
            Let server see real physical pointer button (default:off)
 
        /v:server[:port]
            Server hostname
 
        /vc:channel[,options]
            Static virtual channel
 
        /version
            Print version
 
        /video
            Video optimized remoting channel
 
        /vmconnect[:vmid]
            Hyper-V console (use port 2179, disable negotiation)
 
        /w:width
            Width (default:1024)
 
        -wallpaper
            wallpaper (default:on)
 
        +window-drag
            full window drag (default:off)
 
        /window-position:xposxypos
            window position
 
        /wm-class:class-name
            Set the WM_CLASS hint for the window instance
 
        /workarea
            Use available work area
 
## ENVIRONMENTVARIABLES
        wlog environment variable
            xfreerdp uses wLog as its log facility, you can refer to the corresponding man page (wlog(7)) for more informations. Arguments passed via the /log-level
            or /log-filters have precedence over the environment variables.
 
## EXAMPLES
        xfreerdp connection.rdp /p:Pwd123! /f
            Connect in fullscreen mode using a stored configuration connection.rdp and the password Pwd123!
 
        xfreerdp /u:## USER /size:50%h /v:rdp.contoso.com
            Connect to host rdp.contoso.com with user## USER and a size of 50 percent of the height. If width (w) is set instead of height (h) like /size:50%w. 50
            percent of the width is used.
 
        xfreerdp /u:CONTOSO\\JohnDoe /p:Pwd123! /v:rdp.contoso.com
            Connect to host rdp.contoso.com with user CONTOSO\\JohnDoe and password Pwd123!
 
        xfreerdp /u:JohnDoe /p:Pwd123! /w:1366 /h:768 /v:192.168.1.100:4489
            Connect to host 192.168.1.100 on port 4489 with user JohnDoe, password Pwd123!. The screen width is set to 1366 and the height to 768
 
        xfreerdp /u:JohnDoe /p:Pwd123! /vmconnect:C824F53E-95D2-46C6-9A18-23A5BB403532 /v:192.168.1.100
            Establish a connection to host 192.168.1.100 with user JohnDoe, password Pwd123!  and connect to Hyper-V console (use port 2179, disable negotiation)
            with VMID C824F53E-95D2-46C6-9A18-23A5BB403532
 
        +clipboard
            Activate clipboard redirection
 
        /drive:home,/home/user
            Activate drive redirection of /home/user as home drive
 
        /smartcard:<device>
            Activate smartcard redirection for device device
 
        /printer:<device>,<driver>
            Activate printer redirection for printer device using driver driver
 
        /serial:<device>
            Activate serial port redirection for port device
 
        /parallel:<device>
            Activate parallel port redirection for port device
 
        /sound:sys:alsa
            Activate audio output redirection using device sys:alsa
 
        /microphone:sys:alsa
            Activate audio input redirection using device sys:alsa
 
        /multimedia:sys:alsa
            Activate multimedia redirection using device sys:alsa
 
        /usb:id,dev:054c:0268
            Activate USB device redirection for the device identified by 054c:0268
 
 LINKS
        http://www.freerdp.com/
 
## AUTHOR
        The FreeRDP Team
 
 freerdp                                                                      2020-08-25                                                                  XFREERDP(1)
