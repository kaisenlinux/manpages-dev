recoverdm(1)                                                 recover files on disks with damaged sectors                                                recoverdm(1)

NAME
       recoverdm - recover files on disks with damaged sectors

SYNOPSIS
       recoverdm -t <type> -i <file/device-in> -o <output_file> [-l <sectors_file>] [-n retries]
                 [-s rotation_speed] [-r retries] [-b start_offset] [-p skip_blocks_count]

DESCRIPTION
       recoverdm  recover  disks  with  bad  sectors.  You can recover files as well complete devices. In case it finds sectors which simply cannot be recovered, it
       writes an empty sector to the output file and continues.

       When recovering a CD or a DVD and the program cannot read the sector in "normal mode", then the program will try to read the sector in  "RAW  mode"  (without
       error checking etc.). This toolkit also has a utility called mergebad which merges multiple images into one.

OPTIONS
       -t <type>
              See the above table to choose a value for <type>.

       -i <file/device-in>
              Device or file to recover.

       -o <output_file>
              File where to write to. This file should not already exist.

       -l <sectors_file>
              Generates  a mapfile containing checksums and a list of bad sectors. This mapfile can then be used with mergebad to create one correct image from sev‐
              eral damaged images.

       -n retries
              Number of retries before going on with next sector. Default is 6. For CDROMs it is advised to use 1.

       -s rotation_speed
              Rotation speed of CDROM/DVD. Default is 1.

       -r retries
              Number of retries while reading in RAW mode before going on with next sector. Default is 6. It is advised to use at least 3.

       -b start_offset
              Point to start.

       -p skip_blocks_count
              How many sectors are skipped after non-read one. Use more to speed-up the recover process. Default is 1.

TYPE OF DEVICES
       These are the values can be used with -t option:

           FILE            1
           FLOPPY          10
           FLOPPY_IDE      11
           FLOPPY_SCSI     12
           CDROM_IDE       20
           CDROM_SCSI      21
           DVD_IDE         30
           DVD_SCSI        31
           DISK_IDE        40
           DISK_SCSI       41

SEE ALSO
       mergebad(1)

AUTHOR
       The recoverdm was written by Folkert van Heusden <folkert@vanheusden.com>.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

RECOVERDM 0.20                                                                Jul 2015                                                                  recoverdm(1)
