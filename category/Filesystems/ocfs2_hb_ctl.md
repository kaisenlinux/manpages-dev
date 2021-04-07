ocfs2_hb_ctl(8)                                                                     OCFS2 Manual Pages                                                                     ocfs2_hb_ctl(8)

NAME
       ocfs2_hb_ctl - Starts and stops the O2CB local heartbeat on a given device.

SYNOPSIS
       ocfs2_hb_ctl -S -d device service
       ocfs2_hb_ctl -S -u uuid service
       ocfs2_hb_ctl -K -d device service
       ocfs2_hb_ctl -K -u uuid service
       ocfs2_hb_ctl -I -d device
       ocfs2_hb_ctl -I -u uuid
       ocfs2_hb_ctl -P -d device [-n io_priority]
       ocfs2_hb_ctl -P -u uuid [-n io_priority]
       ocfs2_hb_ctl -h

DESCRIPTION
       ocfs2_hb_ctl  starts  and stops local heartbeat on a OCFS2 device.  Users are strongly urged not to use this tool directly. It is automatically invoked by mount.ocfs2(8) and other
       tools that require heartbeat notifications.

       This utility only operates in the local heartbeat mode. It fails silently when run in global heartbeat mode. More information on the heartbeat modes can be found in o2cb(7).

       The tools accepts devices to be specified by its name or its uuid. Service denotes the application that is requesting the heartbeat notification.

OPTIONS
       -S     Starts the heartbeat.

       -K     Stops the heartbeat.

       -I     Prints the heartbeat reference counts for that heartbeat region.

       -d     Specify region by device name.

       -u     Specify region by device uuid.

       -n     Adjust IO priority for the heartbeat thread. This option calls the ionice tool to set its IO scheduling class to realtime with scheduling class data as provided.  This  op‐
              tion is usable only with the O2CB cluster stack.

       -h     Displays help and exit.

SEE ALSO
       mount.ocfs2(8) o2cb(7) o2cb(8) o2cb.sysconfig(5) ocfs2.cluster.conf(5) o2cluster(8)

AUTHORS
       Oracle Corporation

COPYRIGHT
       Copyright © 2004, 2012 Oracle. All rights reserved.

Version 1.8.6                                                                          January 2012                                                                        ocfs2_hb_ctl(8)
