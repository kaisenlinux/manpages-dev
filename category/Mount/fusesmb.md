FUSESMB(1)                                                                        General Commands Manual                                                                       FUSESMB(1)

NAME
       fusesmb - Mount network neighbourhood

SYNOPSIS
       fusesmb mountpoint [options]

DESCRIPTION
       fusesmb is a Network Neighborhood (Samba shares) filesystem. It works like smbfs, but instead of accessing one share at a time, all computers and workgroups are accessible at once
       from a single filesystem mount.

OPTIONS
       fusesmb accepts the following options:

       -h     Show summary of options.

FILES
       ~/.smb/fusesmb.conf
              Configuration file for fusesmb. Make sure that this file is only readable by the owner or else fusesmb will not start.

       ~/.smb/fusesmb.cache
              A sorted list of all workgroups, servers and shares found on your network.

SEE ALSO
       fusesmb.conf(5)

AUTHOR
       Vincent Wagelaar <vincent@ricardis.tudelft.nl>.

                                                                                      August 5, 2005                                                                            FUSESMB(1)
