  HOSTAPD
 
## NAME
        hostapd - IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator
 
## SYNOPSIS
        hostapd [-hdBKtv] [-P <PID file>] <configuration file(s)>
 
## DESCRIPTION
        This manual page documents briefly the hostapd daemon.
 
        hostapd  is a user space daemon for access point and authentication servers.  It implements IEEE 802.11 access point management, IEEE 802.1X/WPA/WPA2/EAP Au‐
        thenticators and RADIUS authentication server.  The current version supports Linux (Host AP, mac80211-based drivers) and FreeBSD (net80211).
 
        hostapd is designed to be a "daemon" program that runs in the background and acts as the backend component controlling authentication.  hostapd supports sep‐
        arate frontend programs and an example text-based frontend, hostapd_cli, is included with hostapd.
 
## OPTIONS
        A summary of options is included below.  For a complete description, run hostapd from the command line.
 
        -h     Show usage.
 
        -d     Show more debug messages.
 
        -dd    Show even more debug messages.
 
        -B     Run daemon in the background.
 
        -P <PID file>
               Path to PID file.
 
        -K     Include key data in debug messages.
 
        -t     Include timestamps in some debug messages.
 
        -v     Show hostapd version.
 
## SEE ALSO
        hostapd_cli(1).
 
## AUTHOR
        hostapd was written by Jouni Malinen <j@w1.fi>.
 
        This manual page was written by Faidon Liambotis <faidon@cube.gr>, for the Debian project (but may be used by others).
 
 hostapd                                                                    April  7, 2005                                                                 HOSTAPD(8)
