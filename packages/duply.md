  DUPLY
 
## NAME
        duply - a shell frontend to duplicity for simplified backups
 
## SYNOPSIS
        duply profile create
 
        duply profile command [options ...]
 
        duply profile command[_command_...] [options ...]
 
## DESCRIPTION
        Duply deals as a wrapper for the mighty duplicity magic.  It simplifies running duplicity with cron or on command line by:
 
          - keeping recurring settings in profiles per backup job
          - enabling batch operations eg. backup_verify+purge
          - executing pre/post scripts (different actions possible
            depending on previous or next command or it's exit status)
          - precondition checking for flawless duplicity operation
 
        For each backup job one configuration profile must be created.  The profile folder will be stored under ~/.duply/«profile» (where '~' is the current users
        home directory).
 
        Hint: If the folder /etc/duply exists, the profiles for the superuser root will be searched and created there.
 
## USAGE
        First time usage (profile creation):
 
            duply <profile> create
 
        General usage in single mode (see## EXAMPLES):
 
            duply <profile> <command> [<options> ...]
 
        General usage in batch mode joining commands with '_' (see## EXAMPLES):
 
            duply <profile> <command>[[_|+|-]<command>[_|+|-]...] [<options> ...]
 
        For batches the conditional separators can also be written as pseudo commands and(+), or(-). See SEPARATORS for details.
 
        Non duply options are passed on to duplicity (see## OPTIONS).  All config parameters can also be defined in the environment instead.
 
 SEPARATORS
        _ (underscore)
            neutral separator
 
        + (plus sign), _and_
            conditional AND; the next command will only be executed if the previous succeeded
 
        - (minus sign), _or_
            conditional OR; the next command will only be executed if the previous failed
 
        Example: 'pre+bkp-verify_post' translates to 'pre_and_bkp_or_verify_post'
 
 PROFILE
    location for profiles
        Indicated by a path or a profile name i.e. myprofile, which is resolved to ~/.duply/myprofile ('~' expands to environment variable $HOME).
 
        Superuser root can place profiles under /etc/duply. Simply create the folder manually before running duply as superuser.
 
        ATTENTION: Already existing profiles in root's home folder will cease to work unless they are moved to the new location manually.
 
    using profiles
        Usually only the profile name (here: 'humbug') will be used:
 
            duply humbug backup
 
        Alternatively a path might be used. This might be useful for quick testing, restoring or exotic locations. Shell expansion should work as usual:
 
            duply ~/.duplytest/humbug backup
 
        ATTENTION: The path must contain at least one '/', e.g ./test instead of only test.
 
## COMMANDS
        usage   Get usage help text.
 
        and/or  Pseudo commands for better batch cmd readability (see SEPARATORS).
 
        create  Creates a configuration profile.
 
        backup  Backup with pre/post script execution (as batch the same as: pre_bkp_post)
 
                • as full backup if parameter full_if_older matches or no earlier backup is found.
 
                • as incremental backup in all other cases.
 
        bkp     As above but without executing pre/post scripts.
 
        full    Force full backup.
 
        incr    Force incremental backup.
 
        pre     Execute only script '<profile>/pre' (for debugging purposes).
 
        post    Execute only script '<profile>/post' (for debugging purposes).
 
        list [«age»]
                List all files in backup (as it was at age, default: now).
 
        status  Print backup sets and chains currently in repository.
 
        verify [«age»] [--compare-data]
                List files changed, since age if given.
 
        verifyPath [«rel_path_in_bkp»] [«local_path»] [«age»] [--compare-data]
                List changes of a file or folder path in backup compared to a local path, since age if given.
 
        restore «target_path» [«age»]
                Restore the complete backup to target_path (as it was at age).
 
        fetch src_path target_path [«age»]
                Fetch single file/folder from backup (as it was at age).
 
        purge [«max_age»] [--force]
                List outdated backup archives (older than max_age).  Use option --force to actually delete these files.
 
        purgeFull [«max_full_backups»] [--force]
                List outdated backup files. max_full_backups being the number of full backups and associated incrementals to keep, counting in reverse chronological
                order. Use option --force to actually delete these files.
 
        purgeIncr [«max_fulls_with_incrs»] [--force]
                List outdated incremental backup files. max_fulls_with_incrs being the number of full backups which associated incrementals  will be kept, counting
                in reverse chronological order. Use option --force to actually delete these files.
 
        cleanup [--force]
                List broken backup chain files archives (e.g. after unfinished run).  Use option --force to actually delete these files.
 
        changelog
                Print the last changes of duply.
 
        version Show version information of duply and needed programs.
 
## OPTIONS
        --force
            Passed to duplicity (see commands: purge, purge-full, purge-incr, cleanup).
 
        --preview
            Do nothing but print out generated duplicity command lines.
 
        --disable-encryption
            Disable encryption, override profile settings.
 
 TIME FORMATS
        For all time related parameters like age, max_age etc.  refer to the duplicity manpage for all available formats.  Here some examples:
 
          · 2002-01-25T07:00:00+02:00 (full date time format string)
          · 2002/3/5 (date string YYYY/MM/DD)
          · 12D (interval, 12 days ago)
          · 1h78m (interval, 1 hour 78 minutes ago)
 
 PRE/POST SCRIPTS
        Some useful internal duply variables are exported to the scripts:
 
           PROFILE, CONFDIR, SOURCE, TARGET_URL_<PROT|HOSTPATH|## USER|PASS>,
           GPG_<KEYS_ENC|KEY_SIGN|PW>, CMD_ERR, RUN_START,
           CMD_<PREV|NEXT> (previous/next command),
           CND_<PREV|NEXT> (condition before/after)
 
        The CMD_* variables were introduced to allow different actions according to the command the scripts were attached to e.g. 'pre_bkp_post_pre_verify_post' will
        call the pre script two times, with CMD_NEXT variable set to 'bkp' on the first and to 'verify' on the second run.  CMD_ERR holds the exit code of the
        CMD_PREV.
 
## EXAMPLES
        Create profile 'humbug':
 
            duply humbug create
 
        and then edit the resulting conf file of this profile.
 
        Backup 'humbug' now:
 
            duply humbug backup
 
        List available backup sets of profile 'humbug':
 
            duply humbug status
 
        List and delete outdated backups of 'humbug':
 
            duply humbug purge --force
 
        Restore latest backup of 'humbug' to /mnt/restore:
 
            duply humbug restore /mnt/restore
 
        Restore /etc/passwd of 'humbug' from 4 days ago to /root/pw:
 
            duply humbug fetch etc/passwd /root/pw 4D
 
        See man duplicity, section TIME FORMATS for the time format.
 
        A one line batch job on 'humbug' for cron execution:
 
            duply humbug backup_verify_purge --force
 
        Batch job to run a full backup with pre/post scripts:
 
            duply humbug pre_full_post
 
## FILES
        Files in profile folder '~/.duply/<profile>' or '/etc/duply':
 
          conf .......... profile configuration file
          pre ........... pre script (see above for details)
          post .......... post script (see above for details)
          gpgkey.*.asc .. exported GnuPG key files
          exclude ....... a globbing list of included or excluded files/folders
 
        The rules for the exclude file can be found in man duplicity, section FILE SELECTION).
 
 IMPORTANT
        Copy the whole profile folder after the first backup to a safe place.  It contains everything needed to restore your backups. You will need it if you have to
        restore the backup from another system (e.g. after a system crash). Keep access to these files restricted as they contain all information (gpg data, ftp
        data) to access and modify your backups.
 
        Repeat this step after all configuration changes. Some configuration options are crucial for restoration.
 
## BUGS
        This program is still in development. If you find bugs write a bug report on:
          http://sourceforge.net/projects/ftplicity/.
 
 AVAILABILITY
        For newer versions see http://sourceforge.net/projects/ftplicity/.
 
 COPYRIGHT and LICENSE
        Copyright (C) 2006 Christiane Ruetten, 2008-2017 Edgar Soldin
 
        This package is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software
        Foundation; either version 2 of the License, or (at your option) any later version.
 
        On Debian systems, the complete text of the GNU General Public License version 2 can be found in the file `/usr/share/common-licenses/GPL-2'.
 
## AUTHOR
        Duply was written by Christiane Ruetten (initial version, named ftplicity) and Edgar Soldin.
 
        This manual page was written by Joachim Wiedorn <joodebian at joonet.de> for the Debian project (and may be used by others).
 
## SEE ALSO
        duplicity(1)
 
 Version 2.2                                                                  2019-09-23                                                                     DUPLY(1)
