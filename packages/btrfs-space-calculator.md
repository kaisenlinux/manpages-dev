BTRFS-SPACE-CALCULATOR(1)                                                            Btrfs Space Calculator                                                           BTRFS-SPACE-CALCULATOR(1)

NAME
       btrfs-space-calculator - calculate usable and wasted space

SYNOPSIS
       btrfs-space-calculator [args] sizes

DESCRIPTION
       The btrfs-space-calculator program shows the amount of allocatable space on btrfs physical and virtual level, and the amount of unallocatable space resulting from having differently
       sized block devices added to the filesystem.

       In a btrfs filesystem, raw storage is shared by data of different types (System, MetaData and Data) and profiles (e.g. single, DUP, RAID1). Also, a filesystem can have multiple block
       devices of different sizes attached.

       An example:

           -$ btrfs-space-calculator -m raid1 -d raid1 2TB 500G 1TB
           Target metadata profile: RAID1
           Target data profile: RAID1
           Mixed block groups: False
           Total raw filesystem size: 3.18TiB
           Device sizes:
             Device 1: 1.82TiB
             Device 2: 465.66GiB
             Device 3: 931.32GiB
           Metadata to data ratio: 1:200
           Estimated virtual space to use for metadata: 7.00GiB
           Estimated virtual space to use for data: 1.36TiB
           Total unallocatable raw amount: 465.66GiB
           Unallocatable raw bytes per device:
             Device 1: 465.66GiB
             Device 2: 0.00B
             Device 3: 0.00B

       Note that most physical disk vendors specify their sizes in GB or TB for deceptive marketing reasons, while partitions created in your average partition table or with lvm2 etc... are
       usually using MiB, GiB and TiB.

OPTIONS
       -h, --help
              Show the built-in help message and exit.

       -m, --metadata PROFILE
              Metadata profile, values like for data profile.

       -d, --data PROFILE
              Data profile, raid0, raid1, raid5, raid6, raid10, dup or single.

       -M, --mixed
              Use mixed block groups (data and metadata profile must match).

       -r, --ratio RATIO
              Data to metadata ratio, e.g. 200 (the default), which means allocate 0.5% for metadata. Setting this ratio only makes sense for non-mixed filesystems. When using this option in
              combination with -M, it will be ignored.

SEE ALSO
       This program is an example of what can be done using the python-btrfs library.

       Source and documentation on github: https://github.com/knorrie/python-btrfs

                                                                                              2018                                                                    BTRFS-SPACE-CALCULATOR(1)
