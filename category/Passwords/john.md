JOHN(8)                                                                             System Manager's Manual                                                                             JOHN(8)

NAME
       john - a tool to find weak passwords of your users

SYNOPSIS
       john [options] password-files

DESCRIPTION
       This  manual  page  documents  briefly  the  john command.  This manual page was written for the Debian GNU/Linux distribution because the original program does not have a manual page.
       john, better known as John the Ripper, is a tool to find weak passwords of users in a server. John can use a dictionary or some search pattern as well as a password file to  check  for
       passwords.  John  supports different cracking modes and understands many ciphertext formats, like several DES variants, MD5 and blowfish. It can also be used to extract AFS and Windows
       NT passwords.

USAGE
       To use John, you just need to supply it a password file and the desired options. If no mode is specified, john will try "single" first, then "wordlist" and finally "incremental".

       Once John finds a password, it will be printed to the terminal and saved into a file called ~/.john/john.pot. John will read this file when it restarts so it doesn't try to  crack  al‐
       ready done passwords.

       To see the cracked passwords, use

       john -show passwd

       Important: do this under the same directory where the password was cracked (when using the cronjob, /var/lib/john), otherwise it won't work.

       While  cracking,  you  can  press any key for status, or Ctrl+C to abort the session, saving point information to a file ( ~/.john/john.rec by default). By the way, if you press Ctrl+C
       twice John will abort immediately without saving.  The point information is also saved every 10 minutes (configurable in the configuration file, ~/.john/john.ini or ~/.john/john.conf )
       in case of a crash.

       To continue an interrupted session, run:

       john -restore

       Now, you may notice that many accounts have a disabled shell, you can make John ignore these (assume that shell is called /etc/expired ):

       john -show -shells:-/etc/expired passwd

       You might want to mail all the users who got weak passwords, to tell them to change the passwords. It's not always a good idea though (unfortunately, lots of people seem to ignore such
       mail, it can be used as a hint for crackers, etc), but anyway, I'll assume you know what you're doing. Get a copy of the 'mailer' script supplied with John, so you  won't  change  any‐
       thing  that's  under  /usr/sbin  ; edit the message it sends, and possibly the mail command inside it (especially if the password file is from a different box than you got John running
       on).  Then run:

        ./mailer passwd

       Anyway, you probably should have a look at /usr/share/doc/john/OPTIONS for a list of all the command line options, and at /usr/share/doc/john/EXAMPLES for more John usage examples with
       other cracking modes.

OPTIONS
       All the options recognized by john start with a single dash (`-').  A summary of options is included below.

       -external:MODE
              Enables an external mode, using external functions defined in ~/john.ini's [List.External:MODE] section.

       -format:NAME
              Allows  you  to  override  the ciphertext format detection. Currently, valid format names are DES, BSDI, MD5, BF, AFS, LM. You can use this option when cracking or with '-test'.
              Note that John can't crack password files with different ciphertext formats at the same time.

       -groups:[-]GID[,..]
              Tells John to load users of the specified group(s) only.

       -incremental[:MODE]
              Enables the incremental mode, using the specified ~/john.ini definition (section [Incremental:MODE], or [Incremental:All] by default).

       -makechars:FILE
              Generates a charset file, based on character frequencies from ~/.john/john.pot, for use with the incremental mode. The entire ~/.john/john.pot will be used for the charset  file
              unless you specify some password files. You can also use an external filter() routine with this option.

       -restore[:FILE]
              Continues an interrupted cracking session, reading point information from the specified file (~/.john/john.rec by default).

       -rules Enables wordlist rules, that are read from [List.Rules:Wordlist] in /etc/john/john.conf (or the alternative configuration file you might specify on the command line).
              This option requires the -wordlist option to be passed as well.

       -salts:[-]COUNT
              This  feature  sometimes  allows you to achieve better performance. For example you can crack only some salts using '-salts:2' faster, and then crack the rest using '-salts:-2'.
              Total cracking time will be about the same, but you will get some passwords cracked earlier.

       -savemem:LEVEL
              You might need this option if you don't have enough memory, or don't want John to affect other processes too much. Level 1 tells John not to waste memory on login names, so  you
              won't see them while cracking. Higher levels have a performance impact: you should probably avoid using them unless John doesn't work or gets into swap otherwise.

       -session:FILE
              Allows  you  to  specify another point information file's name to use for this cracking session. This is useful for running multiple instances of John in parallel, or just to be
              able to recover an older session later, not always continue the latest one.

       -shells:[-]SHELL[,..]
              This option is useful to load accounts with a valid shell only, or not to load accounts with a bad shell. You can omit the path before a shell name, so '-shells:csh' will  match
              both '/bin/csh' and '/usr/bin/csh', while ´-shells:/bin/csh' will only match '/bin/csh'.

       -show  Shows the cracked passwords in a convenient form. You should also specify the password files. You can use this option while another John is cracking, to see what it did so far.

       -single
              Enables the "single crack" mode, using rules from [List.Rules:Single].

       -status[:FILE]
              Prints  status of an interrupted or running session. To get an up to date status information of a detached running session, send that copy of John a SIGHUP before using this op‐
              tion.

       -stdin These are used to enable the wordlist mode (reading from stdin).

       -stdout[:LENGTH]
              When used with a cracking mode, except for "single crack", makes John print the words it generates to stdout instead of cracking. While applying wordlist rules, the  significant
              password length is assumed to be LENGTH, or unlimited by default.

       -test  Benchmarks all the enabled ciphertext format crackers, and tests them for correct operation at the same time.
              This option does not need any file passed as argument. Its only function is to benchmark the system john is running on.

       -users:[-]LOGIN|UID[,..]
              Allows you to filter a few accounts for cracking, etc. A dash before the list can be used to invert the check (that is, load all the users that aren't listed).

       -wordlist:FILE
              These are used to enable the wordlist mode, reading words from FILE.

MODES
       John can work in the following modes:

       Wordlist
              John will simply use a file with a list of words that will be checked against the passwords. See RULES for the format of wordlist files.

       Single crack
              In this mode, john will try to crack the password using the login/GECOS information as passwords.

       Incremental
              This  is  the most powerful mode. John will try any character combination to resolve the password.  Details about these modes can be found in the MODES file in john's documenta‐
              tion, including how to define your own cracking methods.

FILES
       /etc/john/john.conf
              is where you configure how john will behave.

       /etc/john/john-mail.msg
              has the message sent to users when their passwords are successfully cracked.

       /etc/john/john-mail.conf
              is used to configure how john will send messages to users that had their passwords cracked.

SEE ALSO
       mailer(8), unafs(8), unique(8), unshadow(8),

       The programs and the configuration files are documented fully by John's documentation, which should be available in /usr/share/doc/john or other location, depending on your system.

AUTHOR
       This manual page was written by Jordi Mallach <jordi@debian.org> and Jeronimo  Pellegrini <pellegrini@mpcnet.com.br>, for the Debian GNU/Linux system (but may be used by others).
       John the Ripper was written by Solar Designer <solar@openwall.com>.  The complete list of contributors can be found in the CREDITS file in the documentation directory.

john                                                                                     June 09, 2008                                                                                  JOHN(8)
