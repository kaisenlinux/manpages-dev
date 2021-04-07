DDRESCUE(1)                                                                            User Commands                                                                           DDRESCUE(1)

NAME
       ddrescue - data recovery tool

SYNOPSIS
       ddrescue [options] infile outfile [mapfile]

DESCRIPTION
       GNU ddrescue - Data recovery tool.  Copies data from one file or block device to another, trying to rescue the good parts first in case of read errors.

       Always  use  a  mapfile  unless you know you won't need it. Without a mapfile, ddrescue can't resume a rescue, only reinitiate it.  NOTE: In versions of ddrescue prior to 1.20 the
       mapfile was called 'logfile'. The format is the same; only the name has changed.

       If you reboot, check the device names before restarting ddrescue.  Don't use options '-F' or '-G' without reading the manual first.

OPTIONS
       -h, --help
              display this help and exit

       -V, --version
              output version information and exit

       -a, --min-read-rate=<bytes>
              minimum read rate of good areas in bytes/s

       -A, --try-again
              mark non-trimmed, non-scraped as non-tried

       -b, --sector-size=<bytes>
              sector size of input device [default 512]

       -B, --binary-prefixes
              show binary multipliers in numbers [SI]

       -c, --cluster-size=<sectors>
              sectors to copy at a time [128]

       -C, --complete-only
              don't read new data beyond mapfile limits

       -d, --idirect
              use direct disc access for input file

       -D, --odirect
              use direct disc access for output file

       -e, --max-bad-areas=[+]<n>
              maximum number of [new] bad areas allowed

       -E, --max-error-rate=<bytes>
              maximum allowed rate of read errors per second

       -f, --force
              overwrite output device or partition

       -F, --fill-mode=<types>
              fill blocks of given types with data (?*/-+l)

       -G, --generate-mode
              generate approximate mapfile from partial copy

       -H, --test-mode=<file>
              set map of good/bad blocks from given mapfile

       -i, --input-position=<bytes>
              starting position of domain in input file [0]

       -I, --verify-input-size
              verify input file size with size in mapfile

       -J, --verify-on-error
              reread latest good sector after every error

       -K, --skip-size=[<i>][,<max>]
              initial,maximum size to skip on read error

       -L, --loose-domain
              accept an incomplete domain mapfile

       -m, --domain-mapfile=<file>
              restrict domain to finished blocks in <file>

       -M, --retrim
              mark all failed blocks as non-trimmed

       -n, --no-scrape
              skip the scraping phase

       -N, --no-trim
              skip the trimming phase

       -o, --output-position=<bytes>
              starting position in output file [ipos]

       -O, --reopen-on-error
              reopen input file after every read error

       -p, --preallocate
              preallocate space on disc for output file

       -P, --data-preview[=<lines>]
              show some lines of the latest data read [3]

       -q, --quiet
              suppress all messages

       -r, --retry-passes=<n>
              exit after <n> retry passes (-1=infinity) [0]

       -R, --reverse
              reverse the direction of all passes

       -s, --size=<bytes>
              maximum size of input data to be copied

       -S, --sparse
              use sparse writes for output file

       -t, --truncate
              truncate output file to zero size

       -T, --timeout=<interval>
              maximum time since last successful read

       -u, --unidirectional
              run all passes in the same direction

       -v, --verbose
              be verbose (a 2nd -v gives more)

       -w, --ignore-write-errors
              make fill mode ignore write errors

       -x, --extend-outfile=<bytes>
              extend outfile size to be at least this long

       -X, --max-read-errors=<n>
              maximum number of read errors allowed

       -y, --synchronous
              use synchronous writes for output file

       -Z, --max-read-rate=<bytes>
              maximum read rate in bytes/s

       --ask  ask for confirmation before starting the copy

       --cpass=<n>[,<n>]
              select what copying pass(es) to run

       --delay-slow=<interval>
              initial delay before checking slow reads [30]

       --log-events=<file>
              log significant events in <file>

       --log-rates=<file>
              log rates and error sizes in <file>

       --log-reads=<file>
              log all read operations in <file>

       --mapfile-interval=[i][,i]
              save/sync mapfile at given interval [auto]

       --max-slow-reads=<n>
              maximum number of slow reads allowed

       --pause-on-error=<interval>
              time to wait after each read error [0]

       --pause-on-pass=<interval>
              time to wait between passes [0]

       --reset-slow
              reset slow reads if rate rises above min

       --same-file
              allow infile and outfile to be the same file

       Numbers may be in decimal, hexadecimal or octal, and may be followed by a multiplier: s = sectors, k = 1000, Ki = 1024, M = 10^6, Mi = 2^20, etc...  Time intervals have the format
       1[.5][smhd] or 1/2[smhd].

       Exit  status:  0 for a normal exit, 1 for environmental problems (file not found, invalid flags, I/O errors, etc), 2 to indicate a corrupt or invalid input file, 3 for an internal
       consistency error (eg, bug) which caused ddrescue to panic.

REPORTING BUGS
       Report bugs to bug-ddrescue@gnu.org
       Ddrescue home page: http://www.gnu.org/software/ddrescue/ddrescue.html
       General help using GNU software: http://www.gnu.org/gethelp

COPYRIGHT
       Copyright © 2018 Antonio Diaz Diaz.  License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.html>
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for ddrescue is maintained as a Texinfo manual.  If the info and ddrescue programs are properly installed at your site, the command

              info ddrescue

       should give you access to the complete manual.

ddrescue 1.23                                                                          February 2018                                                                           DDRESCUE(1)
