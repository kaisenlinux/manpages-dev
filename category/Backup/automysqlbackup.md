automysqlbackup(8)                                                   Automatically backup MySQL                                                   automysqlbackup(8)

NAME
       automysqlbackup - backup all of your database daily, weekly, and monthly

SYNOPSIS
        automysqlbackup

DESCRIPTION
        This manual page documents briefly the automysqlbackup command.

        configuration is stored within the /etc/default/automysqlbackup file

PARAMETERS
       USERNAME=dbuser
              Username to access the MySQL server e.g. dbuser

       PASSWORD="password"
              Username to access the MySQL server e.g. password

       DBHOST=localhost
              Host name (or IP address) of MySQL server e.g localhost

       DBNAMES="DB1 DB2 DB3"
              List of DBNAMES for Daily/Weekly Backup e.g. "DB1 DB2 DB3"

       BACKUPDIR="/backups"
              Backup directory location e.g /backups

       MAILCONTENT="stdout"
              Mail setup What would you like to be mailed to you?
               - log   : send only log file
               - files : send log file and sql files as attachments (see docs)
               - stdout : will simply output the log to the screen if run manually.
               - quiet : Only send logs if an error occurs to the MAILADDR.

       MAXATTSIZE="4000"
              Set the maximum allowed email size in k. (4000 = approx 5MB email [see docs])

       MAILADDR="user@domain.com"
              Email Address to send mail to? (user@domain.com)

ADVANCED OPTIONS
       MDBNAMES="mysql $DBNAMES"
              List of DBBNAMES for Monthly Backups.

       DBEXCLUDE=""
              List of DBNAMES to EXCLUDE if DBNAMES are set to all (must be in " quotes)

       CREATE_DATABASE=yes
              Include CREATE DATABASE in backup?

       SEPDIR=yes
              Separate backup directory and file for each DB? (yes or no)

       DOWEEKLY=6
              Which day do you want weekly backups at? (1 to 7 where 1 is Monday)

       COMP=gzip
              Choose Compression type. (gzip or bzip2)

       COMMCOMP=no
              Compress communications between backup server and MySQL server?

       LATEST=no
              Additionally keep a copy of the most recent backup in a separate directory.

       MAX_ALLOWED_PACKET=
              The maximum size of the buffer for client/server communication. e.g. 16MB (maximum i

       SOCKET=
              For connections to localhost. Sometimes the Unix socket file must be specified.

       #PREBACKUP="/etc/automysqlbackup/mysql-backup-pre"
              Command to run before backups (uncomment to use)

       #POSTBACKUP="/etc/automysqlbackup/mysql-backup-post"
              Command run after backups (uncomment to use)

AUTHOR
       This manual page was written by Jose Luis Tallon <jltallon@adv-solutions.net>.  for the Debian GNU/Linux system, but can be used by others.

wipe_out                                                                     6 Sep 2008                                                           automysqlbackup(8)
