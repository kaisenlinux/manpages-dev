rsbackup(1)                                                                         General Commands Manual                                                                         rsbackup(1)

NAME
       rsbackup - rsync-based backup utility

SYNOPSIS
       rsbackup [OPTIONS] [--] [SELECTOR...]
       rsbackup --retire [OPTIONS] [--] [SELECTOR...]
       rsbackup --retire-device [OPTIONS] [--] DEVICE...

DESCRIPTION
       rsbackup  backs up files from one or more (remote) destinations to a single backup storage directory, preserving their contents, layout, ownership, permissions, timestamps and hardlink
       structure.

       Incremental backups are achieved by hard-linking identical files within successive backups of the same files.

       See rsbackup(5) for details of the configuration file.

OPTIONS
   Action Options
       At least one of these options must be specified.  When multiple actions are specified, they are executed in the order shown below.

       --backup, -b
              Make a backup of the selected volumes.  At most one backup of a given volume will be made per day.

       --retire-device
              Retire the named devices.  Retiring a device only means deleting the records of it.  Files on the device itself are not touched.

              If the device is still listed in the configuration file then you will be asked whether you really want to retire it; you can suppress this check with the --force option.

       --retire
              Retire the named hosts and volumes.  Retiring a volume means deleting any available backups for the volume and the records of them.  Records corresponding to backups on unavail‐
              able devices are not removed.

              If you just want to remove backup records for retired volumes but want to keep the backups, you should either manually remove the records (see SCHEMA below), or rename it within
              the volume.

              Since this command deletes backups, you will be prompted to confirm it.  You can suppress this check with the --force option.

       --forget-only
              With --retire, suppresses deletion of backups, and instead just drops database records for the hosts and volumes affected.

       --prune, -p
              Prune old backups of selected volumes.  See rsbackup(5) for details how how pruning is controlled.

       --prune-incomplete,-P
              Prune incomplete backups of selected volumes.  Any backups that failed before completion will be removed.

       --html PATH, -H PATH
              Write an HTML report to PATH.  The report covers all volumes, not just selected ones.  PATH can be - to write to standard output.

       --text PATH, -T PATH
              Write a plain text report to PATH.  The report covers all volumes, not just selected ones.  PATH can be - to write to standard output.

       --email ADDRESS, -e ADDRESS
              Email a report to ADDRESS.  The contents is equivalent to the output of --text and --html.

       --dump-config
              Writes the parsed configuration file to standard output.  Must not be combined with any other action option.

              With --verbose, the configuration file is annotated with descriptive comments.

   General Options
       --config PATH, -c PATH
              The path to the configuration file.  The default is /etc/rsbackup/config.

       --store PATH, -s PATH
              Specify the destination directory to back up to.  Using this option (possibly more than once) is equivalent to removing the store directives from the configuration file and  re‐
              placing them with the paths give in --store options.

              This option implicitly enables the --warn-store option.

       --unmounted-store PATH
              Equivalent to --store except that the store does not have to be a mount point.

       --verbose, -v
              Enable verbose mode.  Various messages will be displayed to report progress and the rsync --quiet option is suppressed.

       --dry-run, -n
              Enable dry-run mode.  Commands will be displayed but nothing will actually be done.

       --force, -f
              Suppress checks made when retiring devices and volumes.

       --wait, -w
              Waits rather than giving up if another copy of rsbackup is running.

       --database, -D PATH
              Override the path to the backup database.

       --help, -h
              Display a usage message.

       --version, -V
              Display the version number.

   Report Verbosity
       --logs VERBOSITY
              Controls which logfiles for a given volume/device pair to include in the report.  The possible values of VERBOSITY are:

              all    Includes all nonempty logfiles, even if the backup succeeded.

              errors Includes all error logfiles.

              recent Includes only the most recent error logfile.

              latest Includes only the latest logfile, even if the backup succeeded.

              failed Includes only the most recent logfile but only if that attempt failed.  This is the default.

   Warning Options
       --warn-unknown
              Display warnings for unknown devices, hosts and volumes.  (Warnings will always be included in the report, this refers to runtime error output.)

       --warn-store
              Display warnings for unsuitable store directories and unavailable devices.

       --warn-unreachable
              Display warnings for unreachable hosts.

       --no-warn-partial
              Suppress warnings for rsync "partial transfer" diagnostics (which are on by default).

       --warn-all, -W
              Enable all --warn- options.

       --no-errors
              Suppress display of errors from rsync.

   Volume Selection
       The list of selectors on the command line determines what subset of the known volumes are backed up, pruned or retired.  The following selectors are possible:

       HOST            Select all volumes for the host.

       HOST:VOLUME     Select the volume.

       -HOST           Deselect all volumes for the host.

       -HOST:VOLUME    Deselect the volume.

       *               Select all volumes.

       If  no  hosts or volumes are specified on the command line then all volumes are selected for backing up or pruning.  For retiring, you must explicitly select hosts or volumes to retire
       and only positive selections are possible.

BACKUP LIFECYCLE
   Adding A New Host
       To add a new host create a host entry for it in the configuration file.

       To back up the local host, specify hostname localhost.  Otherwise you can usually omit hostname.

       You may want to set host-wide values for prune-parameter prune-age, max-age and prune-parameter min-backups.

       A host with no volumes has no effect.

   Adding A New Volume
       To add a new volume create a volume entry for it in the relevant host section of the configuration file.

       Add exclude options to skip files you don't want to back up.  This might include temporary files and the contents of "trash" directories.

       If the volume contains mount points, and you want to back up the contents of the subsiduary filesystems, then be sure to include the traverse option.

       You may want to set per-volume values for prune-parameter prune-age, max-age and prune-parameter min-backups.

   Adding A New Device
       To add a new device, format and mount it and create a device-id file in its top-level directory.  Add a device entry for it in the configuration file and a store entry  mentioning  its
       usual mount point.

       Under normal circumstances you should make sure that the backup filesystem is owned by root and mode 0700.

   Making Backups
       To backup up all available volumes to all available devices:

           rsbackup --backup

       You will probably want to automate this.  To only back up a limited set of volumes specify selection arguments on the command line.

   Pruning Backups
       To prune old backups:

           rsbackup --prune --prune-incomplete

       You will probably want to automate this.

       An  "incomplete backup" occurs when a backup of a volume fails or is interrupted before completion.  They are not immediately deleted because rsync may be able to use the files already
       transferred to save effort on subsequent backups on the same day, or (if there are no complete backups to use for this purpose) later days.

   Retiring A Host
       Retiring a host means removing all backups for it.  The suggested approach is to remove configuration for it and then use rsbackup --retire HOST to remove its backups too.  You can  do
       this the other way around but you will be prompted to check you really meant to remove backups for a host still listed in the configuration file.

       If any of the backups for the host are on a retired device you should retire that device first.

   Retiring A Volume
       Retiring a volume means removing all backups for it.  It is almost the same as retiring a whole host but the command is rsbackup --retire HOST:VOLUME.

       You can retire multiple hosts and volumes in a single command.

   Retiring A Device
       Retiring a device just means removing the records for it.  Use rsbackup --retire-device DEVICE to do this.  The contents of the device are not modified; if you want that you must do it
       manually.

       You can retire multiple devices in a single command.

RESTORING
       Restore costs extra l-)

   Manual Restore
       The backup has the same layout, permissions etc as the original system, so it's perfectly possible to simply copy files from a backup directory to their proper location.

       Be careful to get file ownership right.  The backup is stored with the same numeric user and group ID as the original system used.

       Until a backup is completed, or while one is being pruned, a corresponding .incomplete file will exist.  Check for such a file before restoring any given backup.

   Restoring With rsync
       Supposing that host chymax has a volume called users in which user home directories are backed up, and user rjk wants their entire home directory to be  restored,  an  example  restore
       command might be:

           rsync -aSHAXz --numeric-ids /store/chymax/users/2010-04-01/rjk/. chymax:~rjk/.

       You  could  add  the  --delete  option  if you wanted to restore to exactly the status quo ante, or at the opposite extreme --existing if you only wanted to restore files that had been
       deleted.

       You might prefer to rsync back into a staging area and then pick files out manually.

   Restoring with tar
       You could tar up a backup directory (or a subset of it) and then untar it on the target.  Remember to use the --numeric-owner option to tar.

STORE VALIDITY
       A store may be in the following states:

       available
              The store can be used for a backup.

       unavailable
              The store cannot be used for a backup.  Normally this does not generate an error but --warn-store can be used to report warnings for all unavailable stores, and if no  store  is
              available then the problems with the unavailable stores are described.

       bad    The store cannot be used for a backup.  This always generates an error message, but does not prevent backups to other stores taking place.

       fatally broken
              The store cannot be used for a backup.  The program will be terminated.

       The states are recognized using the following tests (in this order):

       •      If the store path does not exist, the store is bad.

       •      If the store does not have a device-id file then it is unavailable.  If it has one but reading it raises an error then it is bad.

       •      If the store's device-id file contains an unknown device name then it is bad.

       •      If the store's device-id file names the same device as some other store then it is fatally broken.

       •      If the store is not owned by root then it is bad.  This check can be overridden with the public directive.

       •      If the store can be read or written by group or world then it is bad.  This check can be overridden with the public directive.

FILES
       /etc/rsbackup/config
              Configuration file.  See rsbackup(5)

       LOGS/backups.db
              The backup records.  See SCHEMA below.

       STORE/HOST/VOLUME/YYYY-MM-DD
              One backup for a volume.

       STORE/HOST/VOLUME/YYYY-MM-DD.incomplete
              Flag file for an incomplete backup.

SCHEMA
       backups.db is a SQLite database.  It contains a single table with the following definition:

       CREATE TABLE backup (
         host TEXT,
         volume TEXT,
         device TEXT,
         id TEXT,
         time INTEGER,
         pruned INTEGER,
         rc INTEGER,
         status INTEGER,
         log BLOB,
         PRIMARY KEY (host,volume,device,id)
       )

       Each row represents a completed backup.  The meanings of the fields are as follows:

       host      The name of the host the backup was taken from.

       volume    The name of the volume the backup was taken from.

       device    The name of the device the backup was written to.

       id        The unique identifier for the backup.  Currently this is the date the backup was made, in the format YYYY-MM-DD but this may be changed in the future.

       time      The time that the backup was started, as a time_t.

       pruned    The time that backup pruning started (if it is underway) or finished (if it is complete), as a time_t.

       rc        The exit status of the backup process.  0 means success.

       status    Status of this backup.  See below.

       log       The log output of rsync(1) and hooks.  If the backup status is pruning or pruned (see below) then this contains the reason for the pruning.

       Possible status values are:

       0      Unknown status.  Not normally seen.

       1      Internally this means the backup is underway.  If seen externally after rsbackup terminates it means the backup is incomplete.

       2      Backup is complete.

       3      Backup has failed.

       4      Pruning has started.

       5      Pruning has completed.

       rsbackup is not designed with concurrent access to this table in mind.  Therefore it is recommended that you only modify its contents when the program is not running.

HISTORICAL BEHAVIOR
       Older  versions  of  rsbackup stored the logs for each backup in a separate file.  If such files are encountered then rsbackup will automatically populate backups.db from them and then
       delete them.

       Older versions of rsbackup logged pruning information to a pruning logfile.  These files will be deleted at the same rate as records of pruned backups in the database.   They  are  not
       included in the report.

SEE ALSO
       rsbackup-graph(1), rsbackup.cron(1), rsbackup-mount(1), rsbackup-snapshot-hook(1), rsync(1), rsbackup(5)

AUTHOR
       Richard Kettlewell <rjk@greenend.org.uk>

                                                                                                                                                                                    rsbackup(1)
