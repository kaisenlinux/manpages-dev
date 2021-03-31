STRESSANT(1)                                                                               Stressant                                                                               STRESSANT(1)

NAME
       stressant - Stressant Documentation

SYNOPSIS
       stressant  [-h]  [–version]  [–logfile PATH] [–email EMAIL] [–smtpserver HOST] [–smtpuser USERNAME] [–smtppass PASSWORD] [–information] [–disk] [–no-smart] [–diskDevice PATH] [–jobFile
       PATH] [–overwrite] [–writeSize SIZE] [–directory PATH] [–diskRuntime DISKRUNTIME] [–cpu] [–cpuBurnTime TIME] [–network] [–iperfServer HOST] [–iperfTime TIME]

DESCRIPTION
       Stressant is a simple yet complete stress-testing tool that forces a computer to perform a series of test using well-known Linux software in order to detect  possible  design  or  con‐
       struction failures.

OPTIONS
          -h, --help
                 show this help message and exit

          --version
                 show program’s version number and exit

          --logfile PATH
                 write reports to the given logfile (default: None)

          --email EMAIL
                 send report by email to given address

          --smtpserver HOST
                 SMTP  server  to  use, use a colon to specify the port number if non-default (25). willl attempt to use STARTTLS to secure the connexion and fail if unsupported (default: de‐
                 liver using the –mta command)

          --smtpuser USERNAME
                 username for the SMTP server (default: no user)

          --smtppass PASSWORD
                 password for the SMTP server (default: prompted, if –smtpuser is specified)

          --information, --no-information
                 gather basic information (default: True)

          --disk, --no-disk
                 run disk tests (default: True)

          --no-smart, --smart
                 run SMART tests (default: False)

          --diskDevice PATH
                 device to benchmark (default: /dev/sda)

          --jobFile PATH
                 path to the fio job file to use (default: /usr/share/doc/fio/examples/basic-verify.fio)

          --overwrite
                 actually destroy the given device (default: False)

          --writeSize SIZE
                 size to write to disk, bytes or percentage (default: 100M)

          --directory PATH
                 directory to perform file tests in, created if missing (default: None)

          --diskRuntime DISKRUNTIME
                 upper limit for disk benchmark (default: 1m)

          --cpu, --no-cpu
                 run CPU tests (default: True)

          --cpuBurnTime TIME
                 timeout for CPU burn-in (default: 1m)

          --network, --no-network
                 run network tests (default: True)

          --iperfServer HOST
                 iperf server to use (default: iperf.he.net)

          --iperfTime TIME
                 timeout for iperf test, in seconds (default: 60)

EXAMPLES
       Small run load with defaults:

          stressant

       Very fast test, useful to run if you are worried about crashing the machine:

          stressant --writeSize 1M --cpuBurnTime 1s --iperfTime 1

       Extensive test with complete disk wipe and SMART long test:

          sudo stressant --writeSize 100% --overwrite --cpuBurnTime 24h --smart
          # wait for the prescribed time, then show the SMART test results:
          sudo smartctl -l selftest

       Network test only on dedicated server:

          stressant --no-information --no-cpu --no-disk --iperfServer iperf.example.net

       Send test results by email:

          stressant --email person@example.com

       If the mail server refuses mail from your location, you can use another relay (password will be prompted):

          stressant --email person@example.com --smtpserver submission.example.net --smtpuser person --smtppassword

       The stressant-meta package also depends on other tools that are not directly called by the automated script above, but are documented below. The meta-package also  suggests  many  more
       useful tools.

   Wiping disks
       DANGER:
          Wiping  disks, just in case it’s not totally obvious, will DELETE DATA on the given file or device. DO NOT run ANY command in this section unless you are sure you are writing to the
          CORRECT DEVICE and that you REALLY want to DESTROY DATA.

       As mentioned above, the stressant commandline tool can be used to directly wipe a disk with the fio(1) command which is actually a disk-testing command that is abused for that purpose.
       You may not have fio(1) installed on your machine, however, so you may also use the venerable badblocks(8) command to test disks, without wiping them:

          badblocks -nsv /dev/sdc

       You can also wipe disks with the -w flag:

          badblocks -wsv /dev/sdc

       Be  aware, however, that the effect of this will vary according to the physical medium. For example, data may be recovered old spinning hard drives (HDD) if only the above technique is
       used. For that purpose, you should use a tool like nwipe(1) that erases disks using multiple passes and patterns:

          nwipe --autonuke --nogui --method=random --verify=off --logfile=nwipe.log /dev/sdc

       Those tools are also ineffective on solid state drives (SSD) as they have a more complex logic layer and different layout semantics. For this, you need to use a “ATA secure erase” pro‐
       cedure using the hdparm(8) command:

          hdparm --user-master u --security-set-pass Eins /dev/sdc
          time hdparm --user-master u --security-erase Eins /dev/sdc

       More information about this procedure is available in the ATA wiki.

       NOTE:
          The “secure erase” procedure basically delegates the task of erasing the data to the disk controler. Nothing garantees the destruction of that data, short of physical destruction of
          the drive. See this discussion for more information.

   Testing disks
       A good way to test disks is to wipe them, as above, but that’s obviously destructive. Sometimes you might want to just test the disk’s performance by  hand,  without  wiping  anything.
       Stressant ships with fio(1) and bonnie++(1) for that purpose. The latter is probably the simplest to use:

          bonnie++ -s 4G -d /mnt/disk/ -n 1024

       Make sure the file size (-s) is at least twice the main memory (see free -h). The /mnt/disk directory should be writable by the current user as well.

       Stressant itself, when disk tests are enabled, will run the following commands:

          dd bs=1M count=512 conv=fdatasync if=/dev/zero of=/mnt/disk/testfile
          dd bs=1M count=512 conv=fdatasync if=/mnt/disk/testfile of=/dev/null
          hdparm -Tt /dev/disk
          smartctl -t long /dev/disk

       Those provide a quick overview of basic disk statistics as well.

       More elaborate workloads can be done with fio. A simple benchmark could be:

          fio --name=stressant --group_reporting --directory=/mnt/disk --size=100M

       That is a basic read test. The result here, on a Western Digital Blue M.2 500GB Internal SSD (WDS500G1B0B) with LUKS encryption, LVM and ext4, looks like:

          Run status group 0 (all jobs):
             READ: bw=267MiB/s (280MB/s), 267MiB/s-267MiB/s (280MB/s-280MB/s), io=100MiB (105MB), run=374-374msec

          Disk stats (read/write):
              dm-3: ios=323/0, merge=0/0, ticks=484/0, in_queue=484, util=70.99%, aggrios=511/0, aggrmerge=0/0, aggrticks=764/0, aggrin_queue=764, aggrutil=76.86%
              dm-0: ios=511/0, merge=0/0, ticks=764/0, in_queue=764, util=76.86%, aggrios=511/0, aggrmerge=0/0, aggrticks=547/0, aggrin_queue=576, aggrutil=73.55%
            sdb: ios=511/0, merge=0/0, ticks=547/0, in_queue=576, util=73.55%

       A  more  realistic  workload  will ignore the cache (--direct=1), include random (--readwrite=randrw) or sequential writes (--readwrite=readwrite), and parallelize the test to put more
       pressure on the disk (--numjobs=4):

          $ fio --name=stressant --group_reporting --directory=test --size=100M --readwrite=randrw --direct=1 --numjobs=4
          Run status group 0 (all jobs):
             READ: bw=45.8MiB/s (48.0MB/s), 45.8MiB/s-45.8MiB/s (48.0MB/s-48.0MB/s), io=199MiB (209MB), run=4346-4346msec
            WRITE: bw=46.2MiB/s (48.5MB/s), 46.2MiB/s-46.2MiB/s (48.5MB/s-48.5MB/s), io=201MiB (211MB), run=4346-4346msec

          Disk stats (read/write):
              dm-3: ios=49674/50087, merge=0/0, ticks=10028/3912, in_queue=13972, util=97.22%, aggrios=50982/51423, aggrmerge=0/0, aggrticks=10204/3852, aggrin_queue=14092, aggrutil=96.62%
              dm-0: ios=50982/51423, merge=0/0, ticks=10204/3852, in_queue=14092, util=96.62%, aggrios=50982/51423, aggrmerge=0/0, aggrticks=9042/2598, aggrin_queue=11224, aggrutil=92.54%
            sdb: ios=50982/51423, merge=0/0, ticks=9042/2598, in_queue=11224, util=92.54%

       There is, of course, way more information shown by the default fio output, including latency distribution, but those are the numbers people first look for.

       Parameters can be stored in a job file, passed as an argument to fio. Examples are available in /usr/share/doc/fio/examples.

       NOTE:
          There are many other ways to test disks, obviously. In particular, simple tools like disk-filltest might be considered for inclusion in the future, provided they enter Debian.

   Testing flash memory
       Flash memory cards are known to sometimes be “fake”, that is, they misreport the actual capacity of the card or the bandwith available. The stressant distribution therefore  recommends
       a tool called f3 which allows you to perform tests on the memory card. For example, this is a probe on a honest memory card:

          $ sudo f3probe --destructive --time-ops /dev/sdb
          F3 probe 6.0
          Copyright (C) 2010 Digirati Internet LTDA.
          This is free software; see the source for copying conditions.

          WARNING: Probing normally takes from a few seconds to 15 minutes, but
                   it can take longer. Please be patient.

          Good news: The device `/dev/sdb' is the real thing

          Device geometry:
                       *Usable* size: 30.00 GB (62916608 blocks)
                      Announced size: 30.00 GB (62916608 blocks)
                              Module: 32.00 GB (2^35 Bytes)
              Approximate cache size: 0.00 Byte (0 blocks), need-reset=no
                 Physical block size: 512.00 Byte (2^9 Bytes)

          Probe time: 4'57"
           Operation: total time / count = avg time
                Read: 3.07s / 4815 = 637us
               Write: 4'51" / 4192321 = 69us
               Reset: 324.5ms / 1 = 324.5ms

       WARNING:
          As the --destructive flag hints, this will destroy the data on the card, so backup the data elsewhere before doing those tests.

       Note that older versions of f3probe(1) (6.0 or earlier) will have trouble doing its job unless the card is connected through a USB reader. Newer versions can deal with normal block de‐
       vices, provided that you pass the magic --reset-type=2 argument. Here’s such an example, on a fake MicroSD card that is labeled and announced as 32GB but is actually closer to 16GB:

          root@curie:/home/anarcat/backup# ~anarcat/dist/f3/f3probe --destructive --time-ops --reset-type=2  /dev/mmcblk0
          F3 probe 6.0
          Copyright (C) 2010 Digirati Internet LTDA.
          This is free software; see the source for copying conditions.

          WARNING: Probing normally takes from a few seconds to 15 minutes, but
                   it can take longer. Please be patient.

          Bad news: The device `/dev/mmcblk0' is a counterfeit of type limbo

          You can "fix" this device using the following command:
          f3fix --last-sec=30983327 /dev/mmcblk0

          Device geometry:
                       *Usable* size: 14.77 GB (30983328 blocks)
                      Announced size: 31.25 GB (65536000 blocks)
                              Module: 32.00 GB (2^35 Bytes)
              Approximate cache size: 7.00 MB (14336 blocks), need-reset=no
                 Physical block size: 512.00 Byte (2^9 Bytes)

          Probe time: 2'29"
           Operation: total time / count = avg time
                Read: 1.57s / 32937 = 47us
               Write: 2'27" / 200814 = 736us
               Reset: 2us / 2 = 1us

       To repair the device, you can repartition it quickly with the f3fix(1) command, as recommended in the output:

          f3fix --last-sec=30983327 /dev/mmcblk0

       You will also need to reformat the partition so the new size is taken into account, for example if this is a FAT32 filesystem:

          mkfs.fat /dev/mmcblk0p1

       You can also perform bandwidth tests with f3read(1) and f3write(1):

          pmount /dev/sdb1
          f3write /media/sdb1
          f3read /media/sdb1

       This allows you to detect hidden caches and fake sizes directly as well.

   Network performance testing
       The --iperfServer option of stressant runs a bandwidth test against a predefined (or specified) server. You can, of course, call iPerf directly to run your own client/server  tests  to
       find  issues  in specific routes on the network. The iperf3 package was chosen over the older iperf because public servers are available for the test to work automatically. iperf3 also
       has interesting performance features like --zerocopy and --file, see iperf3(1) for details.

       To run a test, start a server:

          iperf3 --server

       On another machine, connect to the server:

          iperf3 --client 192.0.2.1

       This runs a TCP test. You can specify UDP test on the client and disable bandwidth limitations (otherwise UDP tests are limited to 1 Mbit/s):

          iperf3 -c 192.0.2.1 --udp --bandwidth 0

       To simulate a DDOS condition, you can try multiple clients and run the test for a longer period:

          iperf3 -c 192.0.2.1 -u -b 0 --parallel 50 --time 30

SEE ALSO
       hdparm(8), smartctl(8), dd(1), fio(), stress-ng(1), iperf3(1)

AUTHOR
       Antoine Beaupre

COPYRIGHT
       2020, Antoine Beaupre

???                                                                                       Feb 20, 2020                                                                             STRESSANT(1)
