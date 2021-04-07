NWIPE(1)                                                                               User Commands                                                                              NWIPE(1)

NAME
       nwipe - securely erase disks

SYNOPSIS
       nwipe [options] [device1] [device2] ...

DESCRIPTION
       nwipe  is  a  command  that will securely erase disks using a variety of recognised methods.  It is a fork of the dwipe command used by Darik's Boot and Nuke (dban).  nwipe is in‐
       cluded with partedmagic if you want a quick and easy bootable CD version.  nwipe was created out of a need to run the DBAN dwipe command outside of DBAN, in order to allow its use
       with any host distribution, thus giving better hardware support.  It is essentially the same as dwipe, with a few changes:

       - pthreads is used instead of fork

       - The parted library is used to detect drives

       - The code is designed to be compiled with gcc

       - SIGUSR1 can be used to log the stats of the current wipe

OPTIONS
       -V, --version
              Prints the version number

       -h, --help
              Prints a help summary

       --autonuke
              If no devices have been specified on the command line, starts wiping all devices immediately. If devices have been specified, starts wiping only those specified devices im‐
              mediately.

       --autopoweroff
              Power off system on completion of wipe delayed for for one minute. During this one minute delay you can abort the shutdown by typing sudo shutdown -c

       --sync Open devices in sync mode

       --noblank
              Do not perform the final blanking pass after the wipe (default is to blank, except when the method is RCMP TSSIT OPS-II).

       --nowait
              Do not wait for a key before exiting (default is to wait).

       --nosignals
              Do not allow signals to interrupt a wipe (default is to allow).

       --nousb
              Do not show or wipe any USB devices, whether in GUI, --nogui or autonuke mode. (default is to allow USB devices to be shown and wiped).

       --nogui
              Do not show the GUI interface. Can only be used with the autonuke option.  Nowait option is automatically invoked with the nogui option.  SIGUSR1 can be  used  to  retrieve
              the current wiping statistics.

       -v, --verbose
              Log more messages, useful for debugging.

       --verify=TYPE
              Whether to perform verification of erasure (default: last)

              off   - Do not verify

              last  - Verify after the last pass

              all   - Verify every pass

              Please mind that HMG IS5 enhanced always verifies the last (PRNG) pass regardless of this option.

       -m, --method=METHOD
              The wiping method (default: dodshort).

              dod522022m / dod       - 7 pass DOD 5220.22-M method

              dodshort / dod3pass    - 3 pass DOD method

              gutmann                - Peter Gutmann's Algorithm

              ops2                   - RCMP TSSIT OPS-II

              random / prng / stream - PRNG Stream

              zero / quick           - Overwrite with zeros

              verify                 - Verifies disk is zero filled

              is5enh                 - HMG IS5 enhanced

       -l, --logfile=FILE
              Filename to log to. Default is STDOUT

       -p, --prng=METHOD
              PRNG option (mersenne|twister|isaac)

       -r, --rounds=NUM
              Number of times to wipe the device using the selected method (default: 1)

       -e, --exclude=DEVICES
              Up to ten comma separated devices to be excluded, examples:
               --exclude=/dev/sdc
               --exclude=/dev/sdc,/dev/sdd

BUGS
       Please see the GitHub site for the latest list (https://github.com/martijnvanbrummelen/nwipe/issues)

AUTHOR
       Nwipe is developed by Martijn van Brummelen <github@brumit.nl>

SEE ALSO
       shred(1), dwipe(1), dd(1), dcfldd(1), dc3dd(1)

nwipe version 0.30                                                                     December 2020                                                                              NWIPE(1)
