  BAT
 
## NAME
         bat - Bacula Administration Tool Console
 
## SYNOPSIS
        bat [options]
 
## DESCRIPTION
        This  manual  page documents briefly the bat command, the Qt4 version of the Bacula Administration Tool console.  This is a GUI full featured program similar
        the bconsole program, but it is graphical oriented and more features.
 
## OPTIONS
        bat [-s] [-c config_file] [-d debug_level] [-t]
 
        -c <config>
               Specify configuration file.  Default is bat.conf.
 
        -d <nn>
               Set debug level to nn.
 
        -s     No signals. Used in debugging only.
 
        -t     Test config mode: read configuration and exit.
 
        -?     Show version and usage of program.
 
## SEE ALSO
        bacula-dir(8), bls(1), bextract(1).
 
## AUTHOR
        This manual page was written by Kern Sibbald.
 
 COPYRIGHT
        This man page document is released under the BSD 2-Clause license.
 
 Kern Sibbald                                                              26 September 2009                                                                   BAT(1)
