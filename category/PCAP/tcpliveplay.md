tcpliveplay(1)                                                                         User Commands                                                                        tcpliveplay(1)

NAME
       tcpliveplay - Replays network traffic stored in a pcap file on live networks using new TCP connections

SYNOPSIS
       tcpliveplay  [-flags]  [-flag  [value]]  [--option-name[[=| ]value]] <eth0/eth1> <file.pcap> <Destination IP [1.2.3.4]> <Destination mac [0a:1b:2c:3d:4e:5f]> <'random' dst port OR
       specify dport #>

       This program, 'tcpliveplay' replays a captured set of packets using new TCP connections with the captured TCP payloads against a remote host in order to do comprehensive  vulnera‐
       bility testing.

DESCRIPTION
       The  basic operation of tcpliveplay is it rewrites the given pcap file in a scheduled event format and responds with the appropriate packet if the remote host meets tcp protocal's
       SEQ/ACK expectation. Once expectations are met, then the local packets are sent with the same payload except with new tcp SEQ & ACK numbers meeting the response  from  the  remote
       hose.

       The  input  pcap  file  are rewritten to start at the first encounter of the SYN packet for correct operation making this packet be the first action in the event schedule of local
       host doing the replay.

       For more details, please see the Tcpreplay Manual at: http://tcpreplay.appneta.com

OPTIONS
       -d number, --dbug=number
              Enable debugging output.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 5
              The default number for this option is:
                   0

              If configured with --enable-debug, then you can specify a verbosity level for debugging output.  Higher numbers increase verbosity.

       -V, --version
              Print version information.

       -h, --less-help
              Display less usage information and exit.

       -H, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       --save-opts [=cfgfile]
              Save the option state to cfgfile.  The default is the last configuration file listed in the OPTION PRESETS section, below.  The command will exit after updating the config
              file.

       --load-opts=cfgfile, --no-load-opts
              Load options from cfgfile.  The no-load-opts form will disable the loading of earlier config/rc/ini files.  --no-load-opts is handled early, out of order.

OPTION PRESETS
       Any option that is not marked as not presettable may be preset by loading values from configuration ("RC" or ".INI") file(s).  The homerc file is "$$/", unless that is a direc‐
       tory.  In that case, the file ".tcpliveplayrc" is searched for within that directory.

FILES
       See OPTION PRESETS for configuration files.

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_FAILURE)
              The operation failed or the command syntax was not valid.

       66  (EX_NOINPUT)
              A specified configuration file could not be loaded.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

AUTHORS
       Copyright 2012 Yazan Siam For support please use the tcpreplay-users@lists.sourceforge.net mailing list.  The latest version of this software is always available from:
       http://tcpreplay.appneta.com

COPYRIGHT
       Copyright (C) 2012 Yazan Siam all rights reserved.  This program is released under the terms of the Modified Berkeley Software Distribution License.

NOTES
       This manual page was AutoGen-erated from the tcpliveplay option definitions.

tcpliveplay                                                                             01 May 2021                                                                         tcpliveplay(1)
