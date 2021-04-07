KEEPASSXC(1)                                                                      General Commands Manual                                                                     KEEPASSXC(1)

NAME
       keepassxc - a modern open-source password manager

SYNOPSIS
       keepassxc [options] [filename(s)]

DESCRIPTION
       KeePassXC is a free/open-source password manager or safe which helps you to manage your passwords in a secure way. The complete database is always encrypted with the
       industry-standard AES (alias Rijndael) encryption algorithm using a 256 bit key. KeePassXC uses a database format that is compatible with KeePass Password Safe. Your wallet works
       offline and requires no Internet connection.

OPTIONS
       -h, --help
           Displays this help.

       -v, --version
           Displays version information.

       --config <config>
           Path to a custom config file.

       --keyfile <keyfile>
           Key file of the database.

       --pw-stdin
           Read password of the database from stdin.

       --pw, --parent-window <handle>
           Parent window handle.

       --debug-info
           Displays debugging information.

NOTES
       Project homepage
           https://keepassxc.org

       QuickStart Guide
           https://keepassxc.org/docs/KeePassXC_GettingStarted.html

       User Guide
           https://keepassxc.org/docs/KeePassXC_UserGuide.html

       Git repository
           https://github.com/keepassxreboot/keepassxc.git

AUTHOR
       This manual page was originally written by Janek Bevendorff <janek@jbev.net>.

REPORTING BUGS
       Bugs and feature requests can be reported on GitHub at https://github.com/keepassxreboot/keepassxc/issues.

COPYRIGHT
       Copyright (C) 2016-2020 KeePassXC Team <team@keepassxc.org>

       KeePassXC code is licensed under GPL-2 or GPL-3.

KeePassXC 2.6.0                                                                         2020-07-10                                                                            KEEPASSXC(1)
