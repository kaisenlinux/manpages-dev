IOPING(1)                                                                   User Commands                                                                  IOPING(1)

NAME
       ioping - simple disk I/O latency monitoring tool

SYNOPSYS
       ioping [-ABCDJLRWGYykq] [-a count] [-c count] [-i interval] [-l speed] [-r rate] [-t time] [-T time] [-s size] [-S wsize] [-o offset] [-w deadline]
              [-p period] [-P period] directory|file|device
       ioping -h | -v

DESCRIPTION
       This tool generates various I/O patterns and lets you monitor I/O speed and latency in real time.

OPTIONS
       -a, -warmup count
              Ignore in statistics first count requests, default 1.

       -c, -count count
              Stop after count requests, default 0 (infinite).

       -i, -interval time
              Set time between requests, default 1s.

       -l, -speed-limit size
              Set speed limit in size per second. Increases interval to request-size / speed.

       -r, -rate-limit count
              Set rate limit in count per second. Increases interval to 1 / rate.

       -t, -min-time time
              Minimal valid request time (0us).  Too fast requests are ignored in statistics.

       -T, -max-time time
              Maximum valid request time.  Too slow requests are ignored in statistics.

       -s, -size size
              Request size, default 4k.

       -S, -work-size size
              Working set size (1m for directory, whole size for file or device).

       -o, -work-offset size
              Starting offset in the file/device (0).

       -w, -work-time time
              Stop after time passed, default 0 (infinite).

       -p, -print-count count
              Print raw statistics for every count requests (see format below).

       -P, -print-interval time
              Print raw statistics for every time.

       -A, -async
              Use asynchronous I/O (io_setup(2), io_submit(2) etc syscalls).

       -B, -batch
              Batch mode. Be quiet and print final statistics in raw format.

       -C, -cached
              Use cached I/O. Suppress cache invalidation via posix_fadvise(2)) before read and fdatasync(2) after each write.

       -D, -direct
              Use direct I/O (see O_DIRECT in open(2)).

       -J, -json
              Print output in JSON format.

       -L, -linear
              Use sequential operations rather than random. This also sets default request size to 256k (as in -size 256k).

       -R, -rapid
              Disk seek rate test, or bandwidth test if used together with -linear.

              This option suppress human-readable output for each request (as -quiet), sets default interval to zero (-interval 0), stops measurement after 3
              seconds (-work-time 3) and increases default working set size to 64m (-work-size 64m).  Working set (-work-size) should be increased accordingly if
              disk has huge hardware cache.

       -W, -write
              Use writes rather than reads. Safe for temporary file in directory target.  Write I/O gives more reliable results for systems where non-cached reads
              are not supported or cached at some level.

              Might be *DANGEROUS* for file/device: it will shred your data.  In this case should be repeated three times (-WWW).

       -G, -read-write
              Alternate read and write requests.

       -Y, -sync
              Use sync I/O (see O_SYNC in open(2)).

       -y, -dsync
              Use data sync I/O (see O_DSYNC in open(2)).

       -k, -keep
              Keep and reuse temporary working file "ioping.tmp" (only for directory target).

       -q, -quiet
              Suppress periodical human-readable output.

       -h, -help
              Display help message and exit.

       -v, -version
              Display version and exit.

   Argument suffixes
       For options that expect time argument (-interval, -print-interval and -work-time), default is seconds, unless you specify one of the following suffixes
       (case-insensitive):

       ns, nsec
              nanoseconds (a billionth of a second, 1 / 1 000 000 000)

       us, usec
              microseconds (a millionth of a second, 1 / 1 000 000)

       ms, msec
              milliseconds (a thousandth of a second, 1 / 1 000)

       s, sec seconds

       m, min minutes

       h, hour
              hours

       For options that expect "size" argument (-size, -speed-limit, -work-size and -work-offset), default is bytes, unless you specify one of the following
       suffixes (case-insensitive):

       sector disk sectors (a sector is always 512).

       KiB, k, kb
              kilobytes (1 024 bytes)

       page   memory pages (a page is always 4KiB).

       MiB, m, mb
              megabytes (1 048 576 bytes)

       GiB, g, gb
              gigabytes (1 073 741 824 bytes)

       TiB, t, tb
              terabytes (1 099 511 627 776 bytes)

       For options that expect "number" argument (-count and -print-count) you can optionally specify one of the following suffixes (case-insensitive):

       k      kilo (thousands, 1 000)

       m      mega (millions, 1 000 000)

       g      giga (billions, 1 000 000 000)

       t      tera (trillions, 1 000 000 000 000)

EXIT STATUS
       Returns 0 upon success. The following error codes are defined:

       1      Invalid usage (error in arguments).

       2      Error during preparation stage.

       3      Error during runtime.

RAW STATISTICS
       ioping -print-count 100 -count 200 -interval 0 -quiet .
       99 10970974 9024 36961531 90437 110818 358872 30756 100 12516420
       100 9573265 10446 42785821 86849 95733 154609 10548 100 10649035
       (1) (2)     (3)   (4)      (5)   (6)   (7)    (8)   (9) (10)

       (1) count of requests in statistics
       (2) running time         (nanoseconds)
       (3) requests per second  (iops)
       (4) transfer speed       (bytes per second)
       (5) minimal request time (nanoseconds)
       (6) average request time (nanoseconds)
       (7) maximum request time (nanoseconds)
       (8) request time standard deviation (nanoseconds)
       (9) total requests       (including warmup, too slow or too fast)
       (10) total running time  (nanoseconds)

EXAMPLES
       ioping .
              Show disk I/O latency using the default values and the current directory, until interrupted. This command prepares temporary (unlinked/hidden) working
              file and reads random chunks from it using non-cached read requests.

       ioping -c 10 -s 1M /tmp
              Measure latency on /tmp using 10 requests of 1 megabyte each.

       ioping -R /dev/sda
              Measure disk seek rate.

       ioping -RL /dev/sda
              Measure disk sequential speed.

       ioping -RLB . | awk '{print $4}'
              Get disk sequential speed in bytes per second.

SEE ALSO
       iostat(1), dd(1), fio(1), stress(1), stress-ng(1), dbench(1), sysbench(1), fsstress, xfstests, hdparm(8), badblocks(8),

HOMEPAGE
       ⟨https://github.com/koct9i/ioping/⟩.

AUTHORS
       This program was written by Konstantin Khlebnikov ⟨koct9i@gmail.com⟩.
       Man-page was written by Kir Kolyshkin ⟨kir@openvz.org⟩.

                                                                              Oct 2014                                                                     IOPING(1)
