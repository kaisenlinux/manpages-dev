ZSSH(1)                                                                                       ZSSH                                                                                      ZSSH(1)

NAME
       zssh - interactive file transfer wrapper for ssh

SYNOPSIS
       zssh [zssh options] [--] [ssh options]
       ztelnet [zssh options] [--] [telnet options]

DESCRIPTION
       zssh (Zmodem SSH) is a program for interactively transferring files to a remote machine while using the secure shell ( ssh ). It is intended to be a convenient alternative to scp , al‐
       lowing to transfer files without having to open another session and re-authenticate oneself.

       zssh is an interactive wrapper for ssh used to switch the ssh connection between the remote shell and file transfers. This is achieved by using another tty/pty pair  between  the  user
       and the local ssh process to plug either the user's tty (remote shell mode) or another process (file transfer mode) on the ssh connection.

       ztelnet behaves similarly to zssh, except telnet is used instead of ssh.  It is equivalent to 'zssh -s "telnet -8 -E"'

       Files are transferred through the zmodem protocol, using the rz and sz commands.

       zssh  behaves  as  an  usual ssh session until the escape sequence is depressed ( default is ^@ which can be produced by pressing C-space, or C-2, or C-` ), which enables file transfer
       mode. A new prompt is then displayed, and commands can be executed locally to initiate file transfers (among other things). It roughly behaves as a local shell featuring line  edition,
       history and completion (thanks to libreadline), globbing, and escape characters ( " ' and \ ).

       The following builtins are handled by zssh itself: ?  , cd , disconnect , escape , exit , help , hook , quit , repeat , rz , suspend , sz , version

       cd <dir>            change current directory

       disconnect          disconnect and exit

       escape [^X]         Change escape key to ^X. Without argument, print current escape key

       exit                exit file transfer mode. ^D may also be used for this purpose.

       help                print help and tips
       ?

       hook prg [args]     Hook program 'prg' on the the pty. Its standard input and output will go through the ssh channel.
                           typing 'sz'/'rz' is in fact equivalent to 'hook sz'/'hook rz'
                           A weird imagination is most useful to gain full advantage of this feature.

       quit                same as exit.

       repeat              repeats  cmd forever (^C to interrupt). Useful for example if you use a remote script invoking "sz" and you don't want to be typing "rz" each time...  Remember how‐
                           ever that several files can be transferred by a single sz/rz pair so this is not usually necessary to use repeat.

       rz                  Receive files from the remote machine. runs rz and plugs the process on the ssh connection.  running sz on the REMOTE machine is required :
                           1)   run `sz <remote_file> ...' from the remote machine shell
                           2)   press the escape sequence (C-space) to enter file transfer mode
                           3)   run the `rz' builtin

       suspend             suspend zssh (back to the local machine shell)

       sz <file> ...       Send files to the remote machine. runs sz and plugs the process on the ssh connection.  There is no need to manually run rz on the remote side.

       version             print version information

       builtins rz , sz , hook and exit return to shell mode after completion.

OPTIONS
       -f
       --force             Do not ask user any question

       -h
       --help              show basic help

       -s cmd
       --shell cmd         run cmd as remote shell instead of the default "ssh -e none" (zssh) or "telnet -8 -E" (ztelnet)
                           ex: zssh -s "rsh -x"

       -V
       --version           show version

       -z ^X
       --zssh-escape ^X    set escape sequence to ^X

       -- may be used to separate zssh options from ssh ones
       Other arguments are passed verbatim to ssh/telnet/whatever.

ENVIRONMENT
       ZSSHESCAPE
                 Setting the ZSSHESCAPE environment variable allows one to override the default escape sequence. ZSSHESCAPE should contain only two characters of the form `^X',  meaning  that
                 ^X is to be the new escape sequence.

REQUIREMENTS
       the following binaries need to be properly installed for zssh to work :

       ssh/telnet/...
                 the remote shell to be executed (local machine)

       sz rz     zmodem send and receive programs. Should be both on local and remote machine, and (hopefully) of compatible versions.

TIPS
       If file transfer is initiated but never completes
       ( ie a line like :
           Bytes Sent:  38144/4610624   BPS:3424     ETA 22:15
         or
           Bytes Sent:      0/    513   BPS:0        ETA 00:00  Retry 0: Got ZCAN
         can be seen, but transfer never completes
       )
       Chances are the pty/tty on one of the systems are not 8-bit clean.  (Linux is 8-bit clean, NetBSD is not).
       Using the -e (escape) option of rz should solve this problem.

       Transfers can be interrupted with ^C (somewhat experimental =)

       If you get stuck in rz/sz (for example you've just ran rz, but you then decided not to transmit anything), hit a dozen ^X (Ctrl-X, not the zssh escape!) to stop it

       Use `sz -y <files>' to overwrite files on the other side

BUGS / LIMITATIONS
       You  may  sometimes  have to hit return 2 or 3 times after file transfer completion in order get back to the shell. Some digits are usually displayed; don't worry it won't harm (you or
       your term) ...

       the tty may (sometimes) be somewhat upset after an interrupted transfer ( using ^C ). typing `reset' in this case should help.

       no pipe, redirection (and other stuff) support in shell ...  but after all there are already wonderful shells around =)

CREDITS
       ttssh's author - Robert O'Callahan - for the original idea

       The sourceforge team.

AUTHOR
       Matthieu Lucotte <gounter@users.sourceforge.net>

       zssh homepage: http://zssh.sourceforge.net

SEE ALSO
       ssh(1), telnet(1), scp(1), sz(1), rz(1), readline(3),

ZSSH                                                                                     June 26, 2000                                                                                  ZSSH(1)
