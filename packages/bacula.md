Bacula(8)                                                                         System Manager's Manual                                                                        Bacula(8)

NAME
       Bacula - The Network Backup Solution

SYNOPSIS
       bacula-dir - Director
       bacula-fd - File daemon or Client
       bacula-sd - Storage daemon
       bconsole - Console to control Bacula

DESCRIPTION
       Bacula  is a set of computer programs that permits you (or the system administrator) to manage backup, recovery, and verification of computer data across a network of computers of
       different kinds.  In technical terms, it is a network Client/Server based backup program.  Bacula is relatively easy to use and efficient, while  offering  many  advanced  storage
       management  features that make it easy to find and recover lost or damaged files.  Due to its modular design, Bacula is scalable from small single computer systems to systems con‐
       sisting of hundreds of computers located over a large network.

       Bacula Director service consists of the program that supervises all the backup, restore, verify and archive operations.  The system  administrator  uses  the  Bacula  Director  to
       schedule backups and to recover files.  For more details see the Director Services Daemon Design Document in the Bacula Developer's Guild.  The Director runs as a daemon or a ser‐
       vice (i.e.  in the background).

       Bacula Console services is the program that allows the administrator or user to communicate with the Bacula Director (see above).  Currently, the Bacula Console  is  available  in
       two  versions.   The first and simplest is to run the Console program in a shell window (i.e.  TTY interface).  Most system administrators will find this completely adequate.  The
       second version is a Qt 4.2 GUI interface named bat that has more features than the bconsole program.

       Bacula File services (or Client program) is the software program that is installed on the machine to be backed up.  It is specific to the operating system on which it runs and  is
       responsible  for providing the file attributes and data when requested by the Director.  The File services are also responsible for the file system dependent part of restoring the
       file attributes and data during a recovery operation.  For more details see the File Services Daemon Design Document in the Bacula Developer's Guide.  This program runs as a  dae‐
       mon  on  the  machine to be backed up, and in some of the documentation, the File daemon is referred to as the Client (for example in Bacula's configuration file).  In addition to
       Unix/Linux File daemons, there is a Windows File daemon (normally distributed in binary format).  The Windows File daemon runs on all currently known Windows versions  (2K,  2003,
       XP, and Vista).

       Bacula  Storage  services consist of the software programs that perform the storage and recovery of the file attributes and data to the physical backup media or volumes.  In other
       words, the Storage daemon is responsible for reading and writing your tapes (or other storage media, e.g.  files).  For more details see the Storage Services Daemon  Design  Docu‐
       ment in the Bacula Developer's Guide.  The Storage services runs as a daemon on the machine that has the backup device (usually a tape drive).

       Catalog services are comprised of the software programs responsible for maintaining the file indexes and volume databases for all files backed up.  The Catalog services permit the
       System Administrator or user to quickly locate and restore any desired file.  The Catalog services sets Bacula apart from simple backup programs like tar and bru, because the cat‐
       alog  maintains a record of all Volumes used, all Jobs run, and all Files saved, permitting efficient restoration and Volume management.  Bacula currently supports three different
       databases, MySQL, PostgreSQL, and SQLite3, one of which must be chosen when building Bacula.

OPTIONS
       See the HTML/PDF documentation at:
        <http://www.bacula.org>
       for details of the command line options.

CONFIGURATION
       Each daemon has its own configuration file which must be tailored for each particular installation.  Please see the HTML/PDF documentation for the details.

SEE ALSO
       The HTML manual installed on your system (typically found in
       /usr/share/doc/bacula-<version>) or the online manual at:
       <http://www.bacula.org>

BUGS
       See <http://bugs.bacula.org>

AUTHOR
       Kern Sibbald

   Current maintainer
       Kern Sibbald

   Contributors
       An enormous list of past and former persons who have devoted their time and energy to this project -- thanks. See the AUTHORS file in the main Bacula source directory.

COPYRIGHT
       This man page document is released under the BSD 2-Clause license.

                                                                                The Network Backup Solution                                                                      Bacula(8)
