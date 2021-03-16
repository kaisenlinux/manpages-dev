  chkrootkit
 
## NAME
        chkrootkit - Determine whether the system is infected with a rootkit
 
## SYNOPSIS
        chkrootkit [OPTION]... [TEST## NAME]...
 
## DESCRIPTION
        chkrootkit examines certain elements of the target system and determines whether they have been tampered with. Some tools which chkrootkit applies while ana‐
        lyzing binaries and log files can be found at /usr/lib/chkrootkit.
 
## OPTIONS
        -h     Print a short help message and exit.
 
        -V     Print version information and exit.
 
        -l     Print available tests. Currently, these are the following:
               aliens asp bindshell lkm rexedcs sniffer w55808 wted scalper slapper z2 chkutmp OSX_RSPLUG amd basename biff chfn chsh cron crontab  date  du  dirname
               echo  egrep  env  find  fingerd gpm grep hdparm su ifconfig inetd inetdconf identd init killall  ldsopreload login ls lsof mail mingetty netstat named
               passwd pidof pop2 pop3 ps pstree rpcinfo rlogind rshd slogin sendmail sshd syslogd tar tcpd tcpdump top telnetd timed traceroute vdir w write
 
        -d     Enter debug mode.
 
        -x     Enter expert mode.
 
        -e     Exclude known false positive files/dirs, quoted, space separated.
 
        -q     Enter quiet mode.
 
        -r dir Use dir as the root directory.
 
        -p dir1:dir2:dirN
               Specify the path for the external commands used by chkrootkit.
 
        -n     skip NFS mounted dirs
 
        -e     exclude known positives. Quoted white space separated list of files/dirs. Read /usr/share/doc/chkrootkit/README.FALSE-POSITIVES previously.
 
        -s     exclude known false positive sniffer (dhcpd, ntop etc) quoted, space separated. Please, read  /usr/share/doc/chkrootkit/README.FALSE-POSITIVES  previ‐
               ously.
 
## AUTHOR
        Manual  page  written by Yotam Rubin <yotam@makif.omer.k12.il>, Marcos Fouces <marcos@debian.org> and lantz moore <lmoore@debian.org> for the Debian project.
        It may be used by others.
 
## SEE ALSO
        strings(1)
 
                                                                            10 January 2003                                                             chkrootkit(8)
