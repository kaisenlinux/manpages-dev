  ZFS-F## USE
 
## NAME
        zfs-fuse - ZFS filesystem daemon
 
## SYNOPSIS
        zfs-fuse [--pidfile filename] [--no-daemon] [--no-kstat-mount] [--disable-block-cache] [--disable-page-cache] [--fuse-attr-timeout SECONDS]
                 [--fuse-entry-timeout SECONDS] [--log-uberblocks] [--max-arc-size MB] [--fuse-mount-options OPT,OPT,OPT...] [--min-uberblock-txg MIN]
                 [--stack-size=size] [--enable-xattr] [--help]
 
## DESCRIPTION
        This manual page documents briefly the zfs-fuse command.
 
        zfs-fuse is a daemon which provides support for the ZFS filesystem, via fuse. Ordinarily this daemon will be invoked from system boot scripts.
 
## OPTIONS
        This program follows the usual GNU command line syntax, with long options starting with two dashes (`-'). A summary of options is included below. For a
        complete description, see the Info files.
 
        -h --help
            Show summary of options.
 
        -p filename --pidfile filename
            Write the daemon's PID to filename after daemonizing. Ignored if --no-daemon is passed.  filename should be a fully-qualified path.
 
        -n --no-daemon
            Stay in foreground, don't daemonize.
 
        --no-kstat-mount
            Do not mount kstats in /zfs-kstat
 
        --disable-block-cache
            Enable direct I/O for disk operations. Completely disables caching reads and writes in the kernel block cache. Breaks mmap() in ZFS datasets too.
 
        --disable-page-cache
            Disable the page cache for files residing within ZFS filesystems. Not recommended as it slows down I/O operations considerably.
 
        -a SECONDS --fuse-attr-timeout SECONDS
            Sets timeout for caching F## USEattributes in kernel. Defaults to 0.0. Higher values give a 40% performance boost.
 
        -e SECONDS --fuse-entry-timeout SECONDS
            Sets timeout for caching F## USEentries in kernel. Defaults to 0.0. Higher values give a 10000% performance boost but cause file permission checking
            security issues.
 
        --log-uberblocks
            Logs uberblocks of any mounted filesystem to syslog
 
        -m MB --max-arc-size MB
            Forces the maximum ARC size (in megabytes). Range: 16 to 16384.
 
        -o OPT... --fuse-mount-options OPT,OPT,OPT...
            Sets F## USEmount options for all filesystems. Format: comma-separated string of characters.
 
        -u MIN --min-uberblock-txg MIN
            Skips uberblocks with a TXG < MIN when mounting any fs
 
        -v MB --vdev-cache-size MB
            adjust the size of the vdev cache. Default : 10
 
        --zfs-prefetch-disable
            Disable the high level prefetch cache in zfs. This thing can eat up to 150 Mb of ram, maybe more
 
        --stack-size=size
            Limit the stack size of threads (in kb). default : no limit (8 Mb for linux)
 
        -x --enable-xattr
            Enable support for extended attributes. Not generally recommended because it currently has a significant performance penalty for many small IOPS
 
        -h --help
            Show this usage summary.
 
 REMARKS ON PRECEDENCE
        Note that the parameters passed on the command line take precedence over those supplied through /etc/zfs/zfsrc.
 
## BUGS/CAVEATS
        The path to the configuration file (/etc/zfs/zfsrc) cannot at this time be configured.
 
        Most existing packages suggest settings can be set at the top of their init script. These get frequently overridden by a (distribution specific)
        /etc/default/zfs-fuse file, if it exists. Be sure to look at these places if you want your changes to options to take effect.
 
        The /etc/zfs/zfsrc is going to be the recommended approach in the future. So, packagers, please refrain from passing commandline parameters within the
        initscript (except for --pid-file).
 
## SEE ALSO
        zfs (8), zpool (8), zdb(8), zstreamdump(8), /etc/zfs/zfsrc
 
## AUTHOR
        This manual page was written by Bryan Donlan bdonlan@gmail.com for the Debian(TM) system (but may be used by others). Permission is granted to copy,
        distribute and/or modify this document under the terms of the GNU General Public License, Version 2 any later version published by the Free Software
        Foundation, or the Common Development and Distribution License.
 
        Revised by Seth Heeren zfs-fuse@sehe.nl
 
        On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL. The text of the Common Development and
        Distribution Licence may be found at /usr/share/doc/zfs-fuse/copyright
 
 COPYRIGHT
        Copyright © 2010 Bryan Donlan
 
 [FIXME: source]                                                              2010-06-09                                                                  ZFS-F## USE(8)
