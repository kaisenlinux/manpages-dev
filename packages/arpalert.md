ARPALERT(8)                                                                       arp traffic monitoring                                                                       ARPALERT(8)

NAME
       arpalert - ARP traffic monitoring

DESCRIPTION
       Arpalert uses ARP protocol monitoring to prevent unauthorized connections on the local network.  If an illegal connection is detected, a program or script could be launched, which
       could be used to send an alert message, for example.

COMMAND LINE
       -f config_file
              Specify the config file.

       -i interface
              Comma separated network interfaces listen to.

       -p pid_file
              Use this pid file. this file containis a pid number of the arpalert session. If the file exist and his locked, the daemon do not run.

       -e exec_script
              Script launched when an alert is send.

       -D log_level
              The level logged. The levels are between 0 (emergency) and 7 (debug). If 3 is selected all levels bitween 0 and 3 are logged.

       -l leases_file
              This file contain a dump of the mac address in memory (see config file).

       -m module file
              Specify a module file to load

       -d     Run as daemon.

       -F     Run in foreground.

       -v     Watch on screen all the option selected (the options specified in config file and the default options)

       -h     The help command line.

       -w     Debug option: print a dump of packets captured.

       -P     Set the interface in promiscuous mode (don't set this if only the arp analyse is used).

       -V     Print version and quit.

CONFIGURATION FILE
       The config file contains 3 types of data: integer, string and boolean. The boolean type can take values 'oui', 'true', 'yes', '1' for the true values or 'non', 'no', 'false',  '0'
       for the falses values.

       user = arpalert
              Use privileges separation with this user

       umask = 177
              Uses this umask for file creation.

       chroot dir = /home/thierry/arp_test/
              Use this directory for program jail
              If this option is commented out, the program does not use chroot.
              The program read the config file and open the syslog socket before the chroot:
              The kill -HUP does not work with chroot.
              If  the  syslog program is restarted, the socket change and the arpalert syslog system can't be connect to the new socket: the logs with syslog are disabled. Prefere to use
              the log file.
              The file paths are relative to the chroot dir (except the config file)

       log file = /var/log/arpalert.log
              The program log into this file
              If this option is commented out, the internal system log is not used.
              The internal system logs can be used in same time that syslog.

       log level = 6
              The level logged. The levels are between 0 (emergency) and 7 (debug). If 3 is selected all levels between 0 and 3 are logged.

       use syslog = true
              If this option is false, the syslog system is disabled

       maclist file = /etc/arpalert/maclist.allow
              White list

       maclist alert file = /etc/arpalert/maclist.deny
              Black list

       maclist leases file = /var/lib/arpalert/arpalert.leases
              Dump file

       dump inter = 5
              Minimum time to wait between two leases dump

       auth request file = /etc/arpalert/authrq.conf
              List of authorized request

       lock file = /var/run/arpalert.pid
              pid file

       dump packet = false
              Only for debugging: this dump packet received on standard output. The syntax "dump paquet" is also avalaible, but is deprecated

       daemon = false
              If is set to true, run the program as daemon

       interface = ""
              Comma separated network interfaces leisten to. If this value is not specified, the soft select the first interface.

       catch only arp = TRUE
              Configure the network for catch only arp request.  The detection type "new_mac" is deactived.  This mode is used for CPU saving if Arpalert is running on a router

       mod on detect = ""
              Module file loaded by arpalert. This module is launched on each valid alert.  This system avoids a costly fork/exec

       mod config = ""
              This chain is transferred to the init function of module loaded

       action on detect = ""
              Script launched on each detection. Parameters are:
               - mac address of requestor,
               - ip of requestor,
               - supp. parm.,
               - ethernet device listening on
               - type of alert,
               - optional: ethernet vendor

              type of alert:
              0: IP change
              1: Mac address already detected but not in white list
              2: Mac address in black list
              3: New mac address
              4: Unauthorized arp request
              5: Abusive number of arp request detected
              6: Ethernet mac address different from arp mac address
              7: Flood detected
              8: New mac address without ip address

       execution timeout = 10
              Script execution timeout (seconds)

       max alert = 20
              Maximun simultaneous lanched script

       dump black list = false
              Dump the black listed mac address in leases file

       dump white list = false
              Dump the white listed mac address in leases file

       dump new address = true
              Dump the new mac address in leases file

       mac timeout = 259200
              After this time a mac address is removed from memory (seconds) (default 1 month)

       max entry = 1000000
              After this limit the memory hash is cleaned (protect to arp flood)

       anti flood interval = 10
              This sends only one mismatch alert in this time (in seconds)

       anti flood global = 50
              If the number of arp request in seconds exceeds this value, all alerts are ignored for "anti flood interval" time

       mac vendor file = ""
              This file contain the association from mac address to vendor name. This file can be downloaded here: http://standards.ieee.org/regauth/oui/oui.txt

       log mac vendor = false
              Log vendor name

       alert mac vendor = false
              Give vendor name to script

       mod mac vendor = false
              Give vendor name to module

       log referenced address, alert on referenced address, mod on referenced address = false
              Log/launch script/call module if the address is referenced in hash but is not in white list

       log deny address, alert on deny address, mod on deny address = true
              Log/launch script/call module if the mac address is in black list

       log new address, alert on new address, mod on new address = true
              Log/launch script/call module if the address isn't referenced

       log mac change, alert on mac change, mod on mac change = true
              Log/launch script/call module if the mac address is different from the last arp request with the same ip address

       log ip change, alert on ip change, mod on ip change = true
              Log/launch script/call module if the ip address is different from the last arp request with the same mac address

       log unauth request, alert on unauth request, mod on unauth request = true
              Unauthorized arp request: launch if the request is not authorized in auth file

       ignore unknown sender = true
              Don't analyse arp request for unknown hosts (not in white list)

       ignore self test = true
              Ignore ARP self test generated by windows dhcp for unauthorized request detection

       ignore me = true
              Ignore arp request with mac addresse of the listing interfaces for the authorizations checks

       unauth ignore time method = 2
              Select suspend time method:
              1: ignore all unauth alerts during "anti flood interval" time
              2: ignore only tuple (mac address, ip address) during "anti flood interval" time

       log request abus, alert on request abus, mod on request abus = true
              Log/launch script/call module if the number of request per seconds are > "max request"

       max request = 1000000
              Maximun request authorized by second

       log mac error, alert on mac error, mod on mac error = true
              Log/launch script/call module if the ethernet mac address is different than the arp mac address (only for requestor)

       log flood = true, alert on flood = true, mod on flood = true
              Log/launch script/call module if have too many arp request per seconds

       log expire mac address = true, alert on expire mac address = true, mod on expire mac address = true
              Log/launch script/call module if the ethernet mac address expire

       expire authorized mac addresses = true
              Allow authorized mac addresses to expire

DATA FILES FORMATS
       /etc/arpalert/maclist.allow and /etc/arpalert/maclist.deny:
              All the line with # as a first caracter are ignored
              The data on this file take this form
              <MAC_ADRESS> <IP_ADDRESS> <DEVICE> [<FLAG> <FLAG> <FLAG> ...]
              The available flags are:
              ip_change: Ignore ip change alert for this mac address
              black_listed: Ignore black list alerts for this mac address
              unauth_rq: Ignore unauthorized requests for this mac address
              rq_abus: Ignore request abuse for this mac address
              mac_error: Ignore mac error for this mac address
              mac_change: Ignore mac change for this mac address
              mac_expire: Never expire this mac address. Useful if the option "expire authorized mac addresses" is used

       /etc/arpalert/authrq.conf:
              All the words after # character are ignored
              All the blank characters are ignored
              The authorisations list for one mac address begins by the mac address into brackets
              All the next values are ip hosts addresses or ip networks addresses (with /xx notion)
              [<MAC_ADRESS> <DEVICE>] <IP_ADRESS>
              <IP_ADRESS>/<BITS>

FILES
       sbin/arpalert: binary file
       etc/arpalert/arpalert.conf: default config file
       var/run/arpalert.pid: pid file
       var/state/arpalert.leases: leases file

                                                                                        2006-05-09                                                                             ARPALERT(8)
