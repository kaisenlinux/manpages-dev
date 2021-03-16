HARDINFO(1)                                                                 User Commands                                                                HARDINFO(1)

NAME
       HardInfo - System profiler and benchmark for Linux systems.

USAGE
       hardinfo [OPTION...]

DESCRIPTION
       Is  a  system  profiler and benchmark for Linux systems, that gathers information about the hardware and operating system, performs benchmarks, and generates
       reports.  The information gathered is presented on an simple and intuitive GUI.

       Information is grouped in four main groups: Computer, Devices, Network, and Benchmarks.

       The Computer group contains mostly information about basic software.  This includes but is not limited to information about the operating system (kernel ver‐
       sion, C library, distribution, etc.), kernel modules, locale information, filesystem usage, users/groups, and development tools.

       The  Devices  group  contains information about the hardware, as detected by the operating system.  Hardinfo is incapable of detecting hardware by itself, it
       merely lists what the operating system was able to find.  This includes, but does not limit to, information about  the  processor  (including  cache  layout,
       known bugs, and feature flags with their explanation), devices (such as USB, PCI, and Input devices), among other things.

       The Network group lists information about network interfaces, routing table, DNS servers, and other networking-related topics.

       The  Benchmarks  group  allow  performing simple benchmarks to test CPU and FPU capabilities, as well as some of the graphical user interface capabilities as
       well.  In previous versions, it was possible to send the benchmark results to a central server, so it was possible  to  compare  the  benchmarks  with  other
       Hardinfo users; this service has been deactivated in the mean time.

       Reports  can  be  generated  either by invoking Hardinfo with special command-line parameters (see below), or by clicking the "Generate Report" button in the
       GUI.  Reports can be customized in the GUI and saved in either HTML or plain text formats.

OPTIONS
       -h, --help
              Show help options

       -r, --generate-report
              creates a report and prints to standard output

       -f, --report-format
              chooses a report format (text, html)

       -b, --run-benchmark
              run benchmark; requires benchmark.so to be loaded

       -l, --list-modules
              lists modules

       -m, --load-module
              specify module to load

       -a, --autoload-deps
              automatically load module dependencies

       -v, --version
              shows program version and quit

AUTHORS/CONTRIBUTORS
       For current maintainers committing, see AUTHORS.md file and more info are at https://github.com/lpereira/hardinfo/graphs/contributors .   More  contributions
       are in each files source headers.

COPYRIGHT
       HardInfo  its Copyright © 2003, 2009-2017 Leandro A. F. Pereira <leandro@hardinfo.org>.  This is free software; see the source for copying conditions.  There
       is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  This manpage was created by PICCORO  Lenz  McKAY  <mckaygerhard@gmail.com>
       for the hardinfo project.

0.6                                                                           July 2017                                                                  HARDINFO(1)
