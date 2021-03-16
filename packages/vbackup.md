  VBACKUP
 
## NAME
        vbackup - A modular backup program
 
## SYNOPSIS
           vbackup [## OPTIONS] [ --check ] [strategy] level
           vbackup [## OPTIONS] { --list | --help [module] | --version | --init }
           vbackup [## OPTIONS] --rc --list [strategy] [level]
           vbackup [## OPTIONS] --rc --init strategy
           vbackup [## OPTIONS] --rc { --add | --delete } [strategy] config
           vbackup [## OPTIONS] --rc { --enable | --disable } [strategy] config
 
## DESCRIPTION
        vbackup  is a program that performs system backups.  The backup strategy is specified with a set of minimal configuration files that exist in directories un‐
        der /etc/vbackup. See the quickstart section for quick first-time setup.
 
        The full documentation of vbackup is available online at http://vbackup.readthedocs.org
 
## OPTIONS
        -d <level>
               Set the message level to <level> (default level is 8): 1: Fatal, 2: Error, 3: Warning, 4: Note, 5-7: Information (5: Rare messages, 6: Useful message,
               7: Not so useful), 10-14: Debug messages that don't flood, 15-19: Debug messages that flood
 
         --dir <directory>
               Set  the  configuration  directory. This is only useful in case you want to implement (e.g.) user backups, so each user may have her own configuration
               directory.
 
## COMMANDS
        In all commands below: <strategy> refers to the name of a backup strategy (e.g. test, remote, etc). <level> refers to the backup level that  is  to  be  per‐
        formed.  <config>  refers  to a configuration file name and it is in the form XX-## NAME.TYPE or XX-## NAME-LEVEL.TYPE, where XX is a number indicating a priority,
       NAMEis an arbitrary name, LEVEL is an optional backup level (0-9) and TYPE is the  corresponding  module  name  (e.g.  xfsdump)  (example:  50-home.xfsdump,
        20-mbr-0.mbr, 10-remote.nfsmount, etc). <module> refers to a module name (e.g. xfsdump)
 
        --check [<strategy>] [<level>]
               Check  configuration  files  for  a  specific  backup strategy. Each module checks its own configuration file. If strategy is omitted then the default
               strategy will be checked. If level is provided then only config files that apply to that level will be checked.
 
        --list List all available modules, their version and a brief description.
 
        --help [<module>]
               Show some help. If a module is passed as argument then it will display some help about that module. This is where the module configuration  parameters
               are shown.
 
        --version
               Guess what...
 
        --init Shortcut for --rc --init.
 
        --rc --list [<stategy>] [<level>]
               List  the  configuration  of  a certain backup strategy. If level is specified then only list configuration that applies to that level. If strategy is
               omitted the look for the default strategy. This similar to looking at the directories with ls.
 
        --rc --init <strategy>
               Create/initialize a new backup strategy. It will ask a couple of questions and then it will create the directory and populate it with  a  vbackup.conf
               file based on the answers.
 
        --rc --add [<strategy>] <config>
               Add  a  new  configuration  file to a certain backup strategy (or to the default). config is the file name and must be in the form XX-## NAME.TYPE or XX-
              NAME-LEVEL.TYPE, as described above.
 
        --rc --delete [<strategy>] <config>
               Delete an existing configuration file from a strategy.
 
        --rc --enable [<strategy>] <config>
               Enable a previously disabled configuration file by removing the .off extension.
 
        --rc --disable [<strategy>] <config>
               Disable a configuration file for a backup strategy by appending the .off extension.
 
 QUICKSTART
        Use the vbackup-wizard(8) for quickstarting. Most probably that's what you will do the first time.
 
## CONFIGURATION
        The backup strategy is specified with a set of minimal configuration files that exist in directories under /etc/vbackup. Each directory is  named  rc.XXXXX.d
        where XXXXX is the name of the backup strategy. There's also the default strategy that's using the directory rc.d.
 
        For most setups the default strategy should suffice.
 
        Each strategy must contain a vbackup.conf file that specifies some global configuration options (like a destination directory).  Next, it must contain one or
        more module configuration files.  The available modules can be seen using the --list parameter.  The files in there are in the form XX-## NAME.TYPE or  XX-## NAME-
        LEVEL.TYPE,  where XX is a number indicating order,## NAMEis an arbitrary name, LEVEL is an optional level and TYPE is the name of the module that will be in‐
        voked.  If LEVEL is specified then this config file will only apply to that LEVEL.
 
 BACKUP
        After having defined at least one strategy you can perform that backup by running "vbackup <level>" or "vbackup <strategy> <level>".  This will first  source
        the  vbackup.conf  and  it will then check for existing configuration files.  For each one that is found, it will determine the appropriate backup module and
        run it.
 
 MODULES
        dpkg   Backup the debian package list. Small space requirement and very useful for restoring a debian system.
 
        exec   Execute shell commands. Allows custom things to happen between steps (e.g. creating a tar of the whole backup directory or removing old backups).
 
        exist  Check whether a file or directory exists. This can be used to determine whether a filesystem is actually mounted or not. It is strongly advised to use
               this when you're not using mount or nfsmount!
 
        gpg    Encrypt  a  file or a directory using with GPG using a symmetric key. It can be used to encrypt the whole backup before uploading the results to a re‐
               mote system.
 
        ftar (DEPRECATED)
               Use tar to backup a filesystem but use find to locate the files to backup. This is similar to the tar method but is  not  that  good  for  incremental
               backups.  If  you  restore  a  system that was incrementally backed up using this method it will have all files that were deleted between intermediate
               backups too. The advantage of this method is that you can use regular expressions to filter files that will be backed up.
 
        mbr    Backup MBRs from all disks and their Partition Tables. It will also backup MD and LVM information if any of those is detected. Extremely  useful  with
               very low space requirements.
 
        md5    Calculate  the  md5sum  of  certain  files. Can be used to store checksums of the backed up files in order to be able to verify that they are not cor‐
               rupted. If can also be used to store checksums of system files.
 
        mount  Mount a local filesystem, in case you have an unmounted filesystem to perform backups (for example a spare or external disk).
 
        mysql  Backup some or all MySQL databases.
 
        nfsmount
               Mount a remote filesystem using NFS.
 
        off    Don't do anything at all. Used for disabling configuration files. For example, if you rename 50-main.pgsql to 50-main.pgsql.off it will remain in  the
               configuration directory by will be disabled.
 
        openldap
               Backup OpenLDAP database and configuration (if it's stored in LDAP).
 
        pgsql  Backup some or all PostgreSQL databases.
 
        rm     Remove  a  directory recursively. Useful when storing the backup to a temporary directory before (e.g.) moving it to another system or compressing it.
               It can be used to cleanup the directory tree, both before and after a backup.
 
        rpm    Backup RPM database.
 
        scp    Copy files to a remote system using scp. It will copy directories recursively so it can be used to copy a full backup.
 
        tar    Perform incremental backups using the listed-incremental format of GNU tar.  Make sure to use the --noplugin parameter when editing tar  configuration
               files with vim.
 
        umount Umount a filesystem that was previously mounted. This can be used for local and remote mounts. The configuration of this module is compatible with the
               configuration of mount and nfsmount modules. This means that you can just create a link to the coresponding mount configuration file to have it unount
               the filesystem. (For example, link 00-remote.nfsmount to 99-remount.umount)
 
        x509   Encrypt a file or a directory using an x509 certificate. This way backups can be safely stored in remote systems.
 
        xfsdump
               Perform  incremental  backups using xfsdump. This is by far the very best way to backup an XFS filesystem (as a whole). It works extremely well, it is
               very reliable and it is able to do live backups. It is also very easy to restore all or part of the backed-up data using  the  interactive  xfsrestore
               utility (xfsrestore -i).
 
 EXTENDING
        You can extend vbackup by writing simple scripts that will be combined with other scripts. See the online documentation for more information.
 
## AUTHOR- COPYRIGHT
        vbackup is written and maintained by Stefanos Harhalakis.  Copyright (c) 2006-2016 Harhalakis Stefanos
 
 CONTACT
        For bugs, requests, ideas, comments and anything else (except spam) contact <v13@v13.gr>
 
 LICENSE
        This  program  is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software
        Foundation; either version 3 of the License, or (at your option) any later version.
 
        This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
        A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 
        If GPLv3 doesn't fit your needs (BSD?) feel free to contact me and I may release it with another license too.
 
## SEE ALSO
        vbackup-wizard(8)
 
                                                                             Mar 06, 2012                                                                  VBACKUP(8)
