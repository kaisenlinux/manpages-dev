filezilla(1)                                                              FileZilla Manual                                                              filezilla(1)

NAME
       FileZilla - FTP client

SYNOPSIS
       filezilla
       filezilla [-l <logontype>] <FTP URL>
       filezilla -h|-s|-v
       filezilla -c <site>
       filezilla -a <path>

DESCRIPTION
       FileZilla is a powerful client for plain FTP, FTP over SSL/TLS (FTPS) and the SSH File Transfer Protocol (SFTP).

OPTIONS
       -c <site>, --site <site>
              Connect  to the given site from the Site Manager.  Site has to be given as complete path, with a slash as separation character. Any slash or backslash
              that is part of a segment has to be escaped with a backslash. Path has to be prefixed with 0 for user defined entries or 1 for default  entries.  Site
              path may not contain double quotation marks.

              Example: filezilla -c 0/foo/bar/sl\/ash connects to the user site sl/ash in the site directory foo/bar

              May not be used together with -s nor with URL parameter.

       -a <path>, --local <path>
              Sets the local site to the given path.

              Example: filezilla -a "/foo bar/"

       -h, --help
              Displays a help dialog listing these commandline options.

       -l <logontype>, --logontype <logontype>
              Set a special logontype, can only be used in combination with a FTP URL as argument.

              Logontype has to be either ask or interactive. If -l isn't given, the normal logontype is used.

       -s, --sitemanager
              Start with Site Manager opened. May not be used together with -c nor with URL parameter.

       -v, --version
              Display version number of FileZilla.

ENVIRONMENT
       The FZ_DATADIR environment variable can be used to specify the directory containing FileZilla's data files.

SUPPORT
       Please  visit  https://filezilla-project.org/ for further information. Report bugs only if you are using the latest version available from the FileZilla web‐
       site.

COPYRIGHT
       Copyright (C) 2004-2019  Tim Kosse

       FileZilla is distributed under the terms of the GNU General Public License version 2 or later.

SEE ALSO
       fzdefaults.xml(5)

                                                                            January 2018                                                                filezilla(1)
