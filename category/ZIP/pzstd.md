PZSTD(1)                                                                    User Commands                                                                   PZSTD(1)

NAME
       PZSTD - parallelised Zstandard compression, al la pigz

DESCRIPTION
   Usage:
              pzstd [args] [FILE(s)]

   Parallel ZSTD options:
       -p, --processes
              #    : number of threads to use for (de)compression (default:<numcpus>)

   ZSTD options:
       -#     : # compression level (1-19, default:<numcpus>)

       -d, --decompress
              : decompression

       -o     file : result stored into `file` (only if 1 input file)

       -f, --force
              : overwrite output without prompting, (de)compress links

       --rm   : remove source file(s) after successful (de)compression

       -k, --keep
              : preserve source file(s) (default)

       -h, --help
              : display help and exit

       -V, --version
              : display version number and exit

       -v, --verbose
              : verbose mode; specify multiple times to increase log level (default:2)

       -q, --quiet
              : suppress warnings; specify twice to suppress errors too

       -c, --stdout
              : force write to standard output, even if it is the console

       -r     : operate recursively on directories

       --ultra
              : enable levels beyond 19, up to 22 (requires more memory)

       -C, --check
              : integrity check (default)

       --no-check
              : no integrity check

       -t, --test
              : test compressed file integrity

       --     : all arguments after "--" are treated as files

PZSTD version: 1.4.8.                                                       December 2020                                                                   PZSTD(1)
