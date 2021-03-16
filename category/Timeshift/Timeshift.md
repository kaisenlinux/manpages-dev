TIMESHIFT(1)                                                           General Commands Manual                                                          TIMESHIFT(1)

NAME
       timeshift - a system restore utility

SYNOPSIS
       timeshift --check
       timeshift --create[OPTIONS]
       timeshift --restore[OPTIONS]
       timeshift --delete-[all][OPTIONS]
       timeshift --list-{snapshots|devices}[OPTIONS]

DESCRIPTION
       timeshift  is a system restore utility which takes snapshots of the system at regular intervals. These snapshots can be restored at a later date to undo sys‐
       tem changes. Creates incremental snapshots using rsync or BTRFS snapshots using BTRFS tools.

OPTIONS
       A summary of options is included below.

       List:
              --list[-snapshots] List snapshots.
              --list-devices List devices.

       Backup:
              --check Create snapshot if scheduled.
              --create Create snapshot (even if not scheduled).
              --comments <string> Set snapshot description.
              --tags {O,B,H,D,W,M} Add tags to snapshot (default: O).

       Restore:
              --restore Restore snapshot.
              --clone Clone current system.
              --snapshot <name> Specify snapshot to restore.
              --target[-device] <device> Specify target device.
              --grub[-device] <device> Specify device for installing GRUB2 bootloader.
              --skip-grub Skip GRUB2 reinstall.

       Delete:
              --delete Delete snapshot.
              --delete-all Delete all snapshots.

       Global:
              --snapshot-device <device> Specify backup device (default: config).
              --yes Answer YES to all confirmation prompts.
              --btrfs Switch to BTRFS mode (default: config).
              --rsync Switch to RSYNC mode (default: config).
              --debug Show additional debug messages.
              --verbose Show rsync output (default).
              --quiet Hide rsync output.
              --scripted Run in non-interactive mode.
              --help Show all options.

EXAMPLES
       timeshift --list
       timeshift --list --snapshot-device /dev/sda1
       timeshift --create --comments "after update" --tags D
       timeshift --restore
       timeshift --restore --snapshot '2014-10-12_16-29-08' --target /dev/sda1
       timeshift --delete  --snapshot '2014-10-12_16-29-08'
       timeshift --delete-all

NOTES
       1) --create will always create a new snapshot
       2) --check will create a snapshot only if a scheduled snapshot is due
       3) Use --restore without other options to select options interactively
       4) UUID can be specified instead of device name
       5) Default values will be loaded from app config if options are not specified

AUTHOR
       Written by Tony George.

                                                                            March  8 2020                                                               TIMESHIFT(1)
