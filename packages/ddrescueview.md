  ddrescueview
 
## NAME
        ddrescueview - graphical viewer for GNU ddrescue map files
 
## SYNOPSIS
        ddrescueview [## OPTIONS] [[-m domain-mapfile] rescue-mapfile]
 
## DESCRIPTION
        This  small  tool  allows the user to graphically examine ddrescue's map files in a user friendly GUI application. The Main window displays a block grid with
        each block's color representing the block types it contains. Many people know this type of view from defragmentation programs.
 
## OPTIONS:
 
        -r (off|5s|10s|30s|1m|2m|5m)
               Set refresh interval, e.g. -r 30s
 
        -lp    Show (bottom) log panel on start
 
        -gs (4|6|8|10|12|14|16|20|24)
               Set grid size on start
 
        -ub    Use binary unit prefixes instead of decimal
 
        -x left
               X position of window on screen, in pixels
 
        -y top Y position of window on screen, in pixels
 
        -w width
               ClientWidth of window, in pixels
 
        -h height
               ClientHeight of window, in pixels
 
        -safe  Turn off optimizations
 
## SEE ALSO
        Project website: <https://sourceforge.net/p/ddrescueview>
        Full documentation at: <https://sourceforge.net/p/ddrescueview/wiki>
 
## AUTHORS
        Written by Martin Bittermann <martinbittermann@gmx.de>
 
        This manual page was written by Graham Inggs <graham@nerve.org.za>
 
 COPYRIGHT
        Copyright 2013-2020 Martin Bittermann <martinbittermann@gmx.de>
 
        This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the  Free  Software
        Foundation, either version 3 of the License, or (at your option) any later version.
 
 ddrescueview 0.4                                                             2020-09-01                                                              ddrescueview(1)
