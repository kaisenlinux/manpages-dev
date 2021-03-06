comgt(1)                                                                          General Commands Manual                                                                         comgt(1)

NAME
       comgt  - Option GlobeTrotter GPRS/EDGE/3G/HSDPA  and Vodafone 3G/GPRS datacard control tool

SYNOPSIS
       comgt -d device -ehstvVx script

OPTIONS
            -d device
                      set the device to be used to communicate with the data-card.  If not specified then comgt trys /dev/noz2, /dev/ttyUSB2 and then /dev/modem

            -e
                      turn on serial communications echo.

            -h
                      display summary help and exit.

            -s
                      don´t run the internal default script before an external script.

            -t
                      change to an alternate line terminator (default "0).

            -v
                      run in verbose mode. This traces scripts as they are executed.  It is intended to help in debugging scripts.

            -V
                      Print Version information.

            -x
                      for internal and external scripts, any reference to 115200 baud is converted to 57600.  This is useful for data cards that don't like 115200 baud such as the Globe‐
                      Trotter EDGE.

DESCRIPTION
       comgt is a scripting language interpreter useful for establishing communications on serial lines and through PCMCIA modems as well as GPRS and 3G datacards.

       comgt has some features that are rarely found in other utilities of the same type.

   Features
       - Pre-defined built-in scripts for 2G/3G datacard control
       - Simple, BASIC-like script language.
       - Command-line and file sourcing of script.
       - Multi-response waitfor.
       - waitquiet permits line stabilization.
       - In-line text capture.
       - Multi-process support: fork, wait, kill, exit.
       - Debugging verbose and log output.
       - logging to file.
       - Flow control: goto, gosub, return, if, else.
       - Low-impact on system resources.
       - Time commands and functions.
       - String manipulations.
       - Environment manipulation: env(), putenv.
       - External utilities system calls: system, exec.

   Supported GPRS and 3G datacards
       comgt has been tested against GlobeTrotter GPRS,EDGE, Combo EDGE, 3G, 3G EDGE, HSDPA and GlobeTrotter Fusion as well as Vodafone 3G.  It can set the PIN  and  display  information
       about datacards before a PPP connection is started.  Additionally, because the GlobeTrotter and Vodafone 3G/GPRS datacard have a secondary serial interface, these datacards can be
       monitored while a PPP connection is in existence and transferring data.

       comgt is primarily designed to work with the GlobeTrotter range of datacards but should be compatible with any other GPRS or 3G datacard provided its interface is  implemented  as
       one  or  more  serial  or  USB  serial devices and it is controlled and queried by an implementation of the Hayes command interface with the same AT command extensions used by the
       listed datacards.

   Using comgt
       comgt has only one function: to run a script. This may be one of a number of "standard" internal scripts or an external script. Both types of script are invoked in the  same  way.
       The  "standard"  scripts are built into comgt and will work for serially connected modems, built-in modems, PCMCIA modems as well as the GlobeTrotter GPRS and the Vodafone 3G/GPRS
       datacards.  There is a search priority order for scripts - 1)internal, 2)working directory, 3)/etc/comgt

   Built-in scripts
  comgt
       This runs the default internal script. Running comgt without any script specified, e.g., comgt -d /dev/ttyS1 it will check for a PIN and prompt you if it  is  required.  The  next
       thing  it  does  is  wait  for  the device to register, it then reports the signal strength.  If you don´t specify a port with the -d option then /dev/modem is assumed.  If the -s
       switch is not used then this default script is run before any external script.

  comgt help
       Lists these and the other options available.

  comgt info
       Lists the datacard configuration.

  comgt sig
       Prints the signal strength.

  comgt reg
       Prints the registration state.

  comgt 3G
       Puts a GlobeTrotter 3G/Fusion and Vodafone 3G into 3G network only mode (UMTS/HSDPA).

  comgt 2G
       Puts a GlobeTrotter 3G/Fusion and Vodafone 3G into 2G network only mode (GSM/GPRS/EDGE).

  comgt 3G2G
       Puts a GlobeTrotter 3G/Fusion and Vodafone 3G into 3G preferred mode (UMTS/HSDPA and GSM/GPRS/EDGE).

  comgt GTEDGE
       Use this command to initialise GlobeTrotter EDGE and GlobeTrotter Combo EDGE cards before doing anything else. (It switches on the radio).

  comgt USA
       Switch to 900/1900 MHz band for USA operation. GlobeTrotter GPRS datacards only.

  comgt EUROPE
       Switch to 900/1800 MHz band for European operation. GlobeTrotter GPRS datacards only.

  comgt PIN
       Test the SIM PIN status and use the environment variable COMGTPIN as the value .

  comgt APN
       Set the APN of the datacard to the value contained in the COMGTAPN environment variable.

   Custom Scripts
       As well as built in scripts you can make your own. The following script sets a Vodafone 3G datacard or Option Fusion card´s UMTS mode to GPRS:

            #Set GPRS only mode
            set com 115200n81
            set senddelay 0.05
            waitquiet 1 0.2
            send "AT_OPSYS=0^m"
            print "Setting GPRS only mode"

       If you saved the above script as GPRS you would call it like this:

            comgt GPRS

       If you needed to specify the port as well then do this:

            comgt -d /dev/ttyS1 GPRS

       You can also pass environment parameters to a comgt script via $env().

   Replacing chat
       chat is a utility that comes with the ppp package (for Linux, anyway) that, with a set of expect-send string couples, does enough to connect most people to ISPs and  such.   While
       chat´s use is very simple, it isn´t very flexible.  That´s where comgt takes over.

       comgt can be used in place of chat using the same strategy.  For example, a pppd line reading:

            pppd connect \
                 ´chat -v "" ATDT5551212 CONNECT "" ogin: ppp \
                 word: whitewater´ \
                 /dev/cua1 38400 debug crtscts modem defaultroute

       Would, using comgt, read:

            pppd connect ´comgt -s /root/scripts/isp.scr´ /dev/cua1 38400 \
                 debug crtscts modem defaultroute

       And the isp.scr script would read:

            send "ATDT5551212^m"
            waitfor 60 "ogin:"
            send "ppp^m"
            waitfor 60 "word:"
            send "whitewater^m"

       Of course it then becomes trivial to make this script a whole lot more functional by adding code for busy detect, re-dialing, etc...

   Verbose output
       When the verbose option is turned on, comgt reports everthing on the standard error channel.  If turned on from the command line (-v), the output contains 4 sections.

       - Command line argument actions
         These  are  actions  taken because they were specified from the command line, such as opening a communication device (-d), etc...  For these to be output, you must specify -v as
         the first argument.

       - List of arguments
         The number and list of arguments passed. This is useful in case you have a bunch of environment variables or quotes, back-quotes, backslashes on the command line and you´re  not
         sure what the script really sees.

       - Script list
         A  list  of  the  script  to  execute.  This may be a concatenation of the default internal script, unless this is suppressed by the -s option, and a script file.  Every line is
         listed with its line number and character position.

       - Execution output
         List of commands as they are executed. The parser prints the line its currently on, starting from the exact point where its at to the end of the line. Multiple command groups on
         a single line produce multiple output lines. Verbose output may be mixed with script output (print, eprint or lprint.)

       Here´s an example:

         $ comgt -v -d/dev/cua1 -s blah.scr
         comgt 00:18:46 -> Verbose output enabled
         comgt 00:18:46 -> Script file: blah.scr
         comgt 00:18:46 -> argc:5
         comgt 00:18:46 -> argv[0]=comgt
         comgt 00:18:46 -> argv[1]=-v
         comgt 00:18:46 -> argv[2]=-d/dev/cua1
         comgt 00:18:46 -> argv[3]=-s
         comgt 00:18:46 -> argv[4]=blah.scr
         comgt 00:18:46 ->  ---Script---
            1@0000 set com 38400n81 let a=2
            2@0025 print "9x",a,"=",9*a,"\n"
            3@0051 sleep 5
            4@0059 exit 0
         comgt 00:18:46 ->  ---End of script---
         comgt 00:18:46 -> @0000 set com 38400n81 let a=2
         comgt 00:18:46 -> @0017 let a=2
         comgt 00:18:46 -> @0025 print "9x",a,"=",9*a,"\n"
         9x2=18
         comgt 00:18:46 -> @0051 sleep 5
         comgt 00:18:51 -> @0059 exit 0

Programming manual
   Syntax
       The syntax used for comgt scripts is rather simple, somewhat BASIC-like.  A script is a non-tokenized, pure ASCII text file containing lines terminated by newline characters (Unix
       standard.)  Scripts can be created and/or modified using any standard text editor (vi, vim, joe, pico, emacs, ed, microEmacs) Lines in a comgt script read like so:

        - Empty line
        - [indent]rem remark
        - [indent][[:|label] LABEL] [command [arguments]] rem remark
        - [indent][[:|label] LABEL] [command [arguments]] [command [arguments]]...

       Characters used for indentation are the space and tabulation characters.
       The rem command makes the script parser skip the rest of the line.
       The rem command can also be written as "#" or "//".

       Labels consist of lowercase and uppercase letters and digits.
       Case is ignored in labels.

       Commands and their arguments are separated by spaces and/or tabs.
       Command groups are separated by spaces, tabs, or newlines.

       Expressions must not contain spaces or tabs.
       This is ok : let n=x+76
       This is not: let n= x + 76
         Because this space ^ would terminate the let command group.

   Error reporting
       When comgt detects a script error, it immediately turns on verbose mode, generates a dump (see the dump command), reports the error in three lines and stops  the  execution.   The
       first  line  reported  is the command group being executed, the second one shows where the parser got and the third line reports the character position of the program counter, the
       error and the exit code.

       Here´s an example:

            $ comgt -vs blar2.scr

       Where the blar2.scr script is:

            inc n
            dec d3
            let a=58/3
            let $d="fod"
            let c=1/0
            let $y4="sdfgsdfgsdfg"

       The trace and error report looks like this:

            comgt 11:20:15 -> Verbose output enabled
            comgt 11:20:15 -> Script file: blar2.scr
            comgt 11:20:15 -> argc:3
            comgt 11:20:15 -> argv[0]=comgt
            comgt 11:20:15 -> argv[1]=-vs
            comgt 11:20:15 -> argv[2]=blar2.scr
            comgt 11:20:15 ->  ---Script---
               1@0000 inc n
               2@0007 dec d3
               3@0015 let a=58/3
               4@0027 let $d="fod"
               5@0041 let c=1/0
               6@0052 let $y4="sdfgsdfgsdfg"
            comgt 11:20:15 ->  ---End of script---
            comgt 11:20:15 -> @0000 inc n
            comgt 11:20:15 -> @0007 dec d3
            comgt 11:20:15 -> @0015 let a=58/3
            comgt 11:20:15 -> @0027 let $d="fod"
            comgt 11:20:15 -> @0041 let c=1/0
            comgt 11:20:15 -> -- Error Report --
            comgt 11:20:15 -> ---->         ^
            comgt 11:20:15 -> Error @49, line 5, Division by zero. (6)

   Exit codes
       When comgt terminates, it does so with an "exit code".  That is a number passed back to the calling process to signify success or failures.  In every-day Unix, 0 (zero) means suc‐
       cess  and  everything else means whatever the author of the program wants it to mean.  In a shell script, or directly on the command line, you may look at the content of $?  after
       having called comgt to examine its exit code.

       Example:

            #!/bin/sh
            comgt /root/bin/call-isp
            if [ $? != 0 ]; then
              echo "Oops! Something went wrong."
            fi

       Internal comgt error codes are as follows:

            0 : No problems whatsoever.  Apparently.
            1 : Communication device problems.
            2 : Console (tty) device problems.
            3 : Memory problems.
            4 : File or pipe problems.
            5 : Syntax errors.
            6 : Division by zero.
            7 : Variable mis-management.
            8 : System problems.  (Couldn´t call /bin/sh or some such)

   Commands
       Command     : :   Alias: label
       Description : Notes an anchor point for goto or gosub to branch to.
       Syntax      : Keyword must not contain any special characters.
       Note        : Must be first statement in a line.
       See Also    : goto, gosub, return.
       Example:
                     :loop
                     gosub bravo
                     print "The time is ",$time(),"\n"
                     sleep 1
                     goto loop
                     label bravo
                     print "Twonk!\n"
                     return

       Command     : abort
       Description : Causes comgt to call abort() and produce a core dump.
       Syntax      : abort
       See Also    : dump, exit.

       Command     : cd
       Description : Change directory.
       Syntax      : cd directory
       Notes       : -1 is returned in % if the change could not be made.
       Notes       : directory is a string and thus could be a variable.
       See Also    : $cwd().
       Example:
                     cd "duh"
                     if % != 0 print "Could not cd into duh.\n"

       Command     : close
       Description : closes file previously opened with open.
       Syntax      : close file
       See Also    : open.

       Command     : dec
       Description : Decrements the content of an integer variable by 1.
       Syntax      : dec x
       Notes       : x is from a to z or a0 to z9.
       Notes       : Note that "let x=x-1" also works.
       See Also    : let, inc.

       Command     : dump
       Description : Lists all non-zero integer variables and modified string
       Description : variables as log entries (standard error channel.)
       Syntax      : dump
       See Also    : abort, exit

       Command     : else
       Description : Alternatively execute commands if last "if" tested false.
       Syntax      : else commands...
       See Also    : if
       Example:
                     if w<350 print "Wow! Imagine that.\n"
                     else print "Rush Limbaugh is a big fat bastard.\n"

       Command     : eprint
       Description : print a comma-separated list of arguments on stderr.
       Syntax      : eprint var,stringvar,"text",...
       Notes       : Like print but on the standard error file descriptor.
       Notes       : The error output can be re-directed with "2>file" on
       Notes       : the command line.
       See Also    : print.

       Command     : exec
       Description : Replaces current comgt process with another process.
       Syntax      : exec "command -args..."
       See Also    : system, fork.
       Example:
                     #Finished script, call cu.
                     exec "cu -l "+$dev()+" -s "+$baud()

       Command     : exit
       Description : terminates script execution with exit code.
       Syntax      : exit exit_code
       See Also    : abort, dump.
       Example:
                     :error
                     exit 1
                     :smeggit
                     exit 0

       Command     : flash
       Description : Toggles DTR on communication device for a specified time.
       Syntax      : flash float_constant
       Notes       : float_constant is precise down to 1/100th sec.
       Notes       : Causes modem to drop carrier or go to command mode,
       Notes       : depending on modem settings.  Setting the baud rate to 0
       Notes       : for a time has the same effect.
       See Also    : sleep, set com.
       Example:
                     :disconnect
                     flash 0.5
                     exit 0

       Command     : fprint
       Description : print a comma-separated list of arguments in a file.
       Syntax      : fprint var,stringvar,"text",...
       Notes       : Like print but appended to a file previously opened
       Notes       : by open.
       See Also    : print.

       Command     : fork
       Description : forks comgt process in two.  Both processes continue
       Description : executing the script.
       Syntax      : fork
       Notes       : % returns 0 for child process, new process ID for
       Notes       : parent or -1 for error.
       See Also    : wait, kill, pid(), ppid().
       Example:
                     fork
                     if % = -1 goto error
                     if % = 0 goto child
                     :parent
                     ...

       Command     : get
       Description : get string from communication device.
       Syntax      : get timeout "terminators" $string
       Notes       : timeout is a float constant, terminators is a
       Notes       : list of characters that, when received, terminate
       Notes       : get.  Terminators are ignored when received first.
       See Also    : waitfor.
       Example:
                     waitfor 60 "connect"
                     if % != 0 goto error
                     get 2 " ^m" $s
                     print "Connection parameters: ",$s,"\n"

       Command     : gosub
       Description : calls a subroutine.
       Syntax      : gosub label
       Notes       : Currently, comgt only supports 128 levels of gosub
       Notes       : calls (enough!)
       See Also    : :, goto, return.
       Example:
                     gosub routine
                     sleep 1
                     gosub routine
                     goto end
                     :routine
                     print "Flim-flam!\n"
                     return

       Command     : goto
       Description : Sends execution somewhere else in the script.
       Syntax      : goto label
       See Also    : :, gosub, return.
       Example:
                     :win95
                     print "Today I want to go and use Linux, thank you.\n"
                     goto win95

       Command     : hset
       Description : Set the hundreds timer.
       Syntax      : hset value
       Notes       : This command resets the hundreds of seconds timer to
       Notes       : a value for htime to start from.
       See Also    : htime().
       Example:
                     hset 0
                     :loop
                     print "Time in 1/100 of a sec.: ",htime(),"\n"
                     sleep 0.01
                     goto loop

       Command     : if
       Description : tests a condition
       Syntax      : if test_condition commands...
       Notes       : Conditionnaly executes commands if test condition is true.
       Notes       : Test operators are = (equal), != (not equal),
       Notes       : <> (not equal to) < (less than), > (greater than),
       Notes       : <= (less or equal), >= (greater or equal).
       Notes       : All operators can be used with integers and strings.
       Notes       : If test_condition is false, if skips to
       Notes       : the next line.
       See Also    : else.
       Example:
                     if n>30 print "Oh-ho! too many sheep!\n" goto error
                     if n=17 print "Hurray! we´ve enough sheep\n" goto party
                     if n<17 print "Murray, get more sheep.\n" goto getmore
                     if $z < "Marmaluke" goto ...
                     if 3*a>5+b goto ...

       Command     : inc
       Description : increments the content of an integer variable by 1.
       Syntax      : inc x
       Notes       : x is a-z or a0-z9.
       See Also    : dec, let.

       Command     : input
       Description : input string from keyboard into string variable.
       Syntax      : input $x
       Notes       : input terminates entry only with the ENTER key.
       Notes       : Spaces, tabs and other funny characters are all
       Notes       : stored in the variable.
       See Also    : set echo.
       Example:
                     print "Enter your full name :"
                     input $n4

       Command     : kill
       Description : Sends a signal to a process.
       Syntax      : kill signal processID
       Notes       : Both signal and processID are integer values.  Same as
       Notes       : standard unix kill except that signal aliases are not
       Notes       : accepted and signal is not optional.
       Notes       : 0 is returned in % if the signal could be sent, -1
       Notes       : otherwise.
       Notes       : Signal 0 can be used to detect process existance.
       See Also    : wait, pid(), ppid().
       Example:
                     fork
                     let p=%
                     if p = 0 goto child
                     sleep 300
                     kill 15 p
                     sleep 1
                     kill 0 p
                     if % != 0 print "Child terminated\n" goto ok
                     print "Could not terminate child!\n"
                     kill 9 p
                     sleep 1
                     kill 0 p
                     if % = 0 print "Could not kill child!\n" goto error
                     print "Child killed.\n"
                     :ok
                     ...

       Command     : let
       Description : Does a variable assignment.
       Syntax      : let x=content
       Notes       : x is [$]a0-z9.
       See Also    : inc, dec.
       Example:
                     let a=5
                     let b=(time()-a)+5
                     let y7=6809
                     let z=0%11010111  #Binary
                     let z=077324      #octal
                     let z=0xf5b8      #hexadecimal
                     let $c="Daniel "
                     let $d=$c+" Chouinard"
                     let $s5="Frimpin´ Jeosaphat!"

       Command     : lprint
       Description : Print a comma-separated list of arguments to the log.
       Syntax      : fprint var,stringvar,"text",...
       Notes       : Like print but printed like a log entry if verbose is on.
       Notes       : logging is sent to stderr.
       See Also    : print, eprint, fprint.

       Command     : open
       Description : Opens a file or a communication device.
       Syntax      : open com device, open com (stdin), open file FILE
       See Also    : close.
       Example:
                     open com /dev/cua1
                     set com 38400n81
                     open file "/tmp/log"
                     fprintf "This is a log\n"
                     close file

       Command     : print
       Description : print a comma-separated list of arguments.
       Syntax      : print var,stringvar,"text",...
       Notes       : Spaces and newlines are not automatically added.
       See Also    : eprint, fprint, lprint.
       Example:
                     let b=26
                     let $c="text variables"
                     print "Contstant text ",b," ",$c," time: ",$time(),"\n"

       Command     : putenv
       Description : Sets an environment variable.
       Syntax      : putenv "var=content"
       Notes       : Environment variables are automatically exported,
       Notes       : never returned. Children processes inherit the
       Notes       : environment.
       See Also    : $env().
       Example:
                     putenv "SCRIPTDIR=/usr/lib/comgt/scripts"
                     system "dothat"  # dothat reads env. var. SCRIPTDIR...

       Command     : rem  Aliases: #, //
       Description : Remark.  Rest of line is ignored.
       Syntax      : Note that a space must follow "rem".
       Example:
                     #This is a remark
                     // So is this
                     rem This ain´t no disco.

       Command     : return
       Description : Returns from subroutine.
       Syntax      : return
       See Also    : gosub.

       Command     : send
       Description : sends a string to the communication line (modem usually).
       Syntax      : send string
       Notes       : Carriage return (ENTER) is not sent automatically
       Notes       : (use ^m).
       Example:
                     send "atdt555-1212^m"
                     send $g+"^m"
                     send "The time is "+$time()+"^m^j"

       Command     : set
       Description : sets working parameters.
       Syntax      : set parameter value
       Notes       :

       Command                       Description
       ----------------------------- -------------------------------------------------
       set echo on|off               Keyboard echo on-screen.
       set comecho on|off            Received characters echoed on-screen.
       set senddelay time_constant   In-between character delay for "send"
       set ignorecase on|off         Case sensitivity for "waitfor".
                                     Default=on.
       set clocal on|off             clocal on = ignore modem signals
       set umask mode                file mode creation defaults.
                                     See man umask.
       set verbose on|off            verbose on = debug output enabled.
       set com com_params            communication parameters.
                                          ex.: 19200n81, 300e71
                                                    baud |||
                                                  Parity    |
                                               Data bits     |
                                               Stop bits      |

       Example:
                     set echo off
                     print "Password :"
                     input $p
                     print "\n"
                     set echo on
                     set comecho on
                     set clocal on
                     set senddelay 0.1
                     set ignorecase on
                     set com 38400n81
                     set umask 022 # Must be octal (leading zero)
                     ...

       Note on clocal:
         If want your script to keep working after the carrier detect
         signal has dropped, set clocal on, otherwise, a CD drop causes
         the device line to close (hang up).  This could happen if,
         let´s say, your script calls and connects, then disconnects or
         drops dtr (flash), then tries to re-connect again.

       Command     : sleep
       Description : Pauses execution.
       Syntax      : sleep float_constant
       Notes       : Float_constant is precise down to 1/100th sec, unless
       Notes       : more than 100 seconds, in which case the precision
       Notes       : falls down to 1 sec.

       Example:
                     sleep 0.06
                     sleep 3
                     sleep 86400 /* A whole day */

       Command     : system
       Description : Calls a system (unix) command
       Syntax      : system "command"
       See Also    : exec.
       Example:
                     :dir
                     print "listing of directory ",$cwd(),\n"
                     system "ls -l |more"

       Command     : testkey
       Description : Tests keyboard for keystroke, returns 1 in % if present.
       Syntax      : testkey
       Notes       : Can only test for ENTER key.  Future versions of comgt
       Notes       : will test for more and return keycodes in %.
       See Also    : input.
       Example:
                     let n=1
                     :loop
                     print n," sheep... ZZZzzz...\n"
                     sleep n
                     inc n
                     testkey
                     if % = 0 goto loop

       Command     : wait
       Description : Wait for a child process to terminate.
       Syntax      : wait
       Notes       : Process ID of terminated child is returned in %
       See Also    : fork, kill.
       Example:
                     fork
                     let p=%
                     if p=0 goto child
                     if p=-1 goto error
                     print "Waiting for child to finish..."
                     wait
                     print "\n"
                     if %!=p print "Wait got wrong PID!\n" goto error
                     print "Child is done.\n"

       Command     : waitfor
       Description : Waits until one of a list of strings is received
       Syntax      : waitfor timeout "string1","string2","string3"...
       Notes       : Timeout is a floating time constant.  waitquiet returns
       Notes       : 0 for the first string received, 1 for the second, etc...
       Notes       : and -1 for a timeout.  Case is ignored by default unless
       Notes       : ignorecase is set to off.
       See Also    : get.
       Example:
                     :dial
                     send "atdt555-4411^m"
                     waitfor 60 "no carrier","busy","no dial tone","connect"
                     if % = -1 goto timedout
                     if % = 0 goto nocd
                     if % = 1 goto redial
                     if % = 2 goto error
                     if % = 3 goto connected

       Command     : waitquiet
       Description : Waits until communication line stops receiving for a time.
       Syntax      : waitquiet timeout quiettime
       Notes       : Both timeout and quiettime are floating time constants
       Notes       : with 1/100th sec. accuracy.  Usefull for "swallowing"
       Notes       : incoming characters for a while or waiting for an
       Notes       : unknown prompt.
       Example:
                     :closecon
                     send "logoff^m"
                     waitquiet 10 0.5
                     send "yes^m"

   Integer functions
       I-Function  : Access
       Description : Verifies access rights to a file
       Syntax      : let x=access("/tmp/file","frwx")
       Notes       : The second string contains one or more of
       Notes       : ´f´,´r´,´w´,´x´ to repectively check
       Notes       : existence, read, write and execute permissions.
       Notes       : Under root id, the only useful check is ´f´, as
       Notes       : all others will return true.
       Return Value: 0 if the file exists, is readable, writable,
       Return Value: executable, or -1 if not.
       See Also    : man access(2)

       I-Function  : baud
       Description : Returns current baudrate of communication line.
       Syntax      : let x=baud()
       Notes       : Does not necessarily match the modem connection speed.
       See Also    : $baud().

       I-Function  : len
       Description : Returns the length of a string.
       Syntax      : let x=len($s)
       Notes       : "" is zero.  Strings currently have a maximum length of
       Notes       : 1024 characters. comgt doesn´t handle string overflow
       Notes       : at all.

       I-Function  : htime
       Description : Returns hundreds of seconds since start of script.
       Syntax      : let x=htime()
       Notes       : Set to a specific value with hset.
       See Also    : hset.

       I-Function  : pid
       Description : Returns process ID number of current process (comgt)
       Syntax      : let x=pid()
       See Also    : ppid(), fork

       I-Function  : ppid
       Description : Returns process ID number of parent process.
       Syntax      : let x=ppid()
       Notes       : Can be used by forked child to detect parent
       Notes       : process.

       I-Function  : time
       Description : Returns time in seconds since Jan 1, 00:00:00 1970 GMT.
       Syntax      : let x=time()
       Notes       : Used to calculate time differences.
       See Also    : $time()

       I-Function  : val
       Description : Returns value of string.
       Syntax      : let x=val($x)
       Notes       : String is not an expression; must only contain [0-9]
       Notes       : characters. Future versions of comgt will be able to
       Notes       : evaluate expressions. (Maybe) (This was written 6
       Notes       : years ago.)

       I-Function  : verbose
       Description : Returns value of verbose setting.
       Syntax      : let x=verbose()
       Notes       : 0=off, 1=on.

   String functions
       S-Function  : basename
       Description : Returns basename part of path.
       Syntax      : let $x=$basename($p)
       Notes       : $basename("/usr/bin/more")="more"
       See Also    : $dirname().

       S-Function  : baud
       Description : Returns string representation of current baud rate.
       Syntax      : let $x=$baud()
       Notes       : Defined by "set com"
       See Also    : baud(), set com.

       S-Function  : cwd
       Description : Returns current working directory pathname.
       Syntax      : let $x=$cwd()
       See Also    : cd.

       S-Function  : dev
       Description : Returns current communication device pathname.
       Syntax      : let $x=$dev()
       Notes       : defined by "-d" command line argument or "open com"
       See Also    : open com.

       S-Function  : dirname
       Description : Returns directory name part of path.
       Syntax      : let $x=$dirname($p)
       Notes       : $dirname("/usr/bin/more")="/usr/bin"
       See Also    : $basename().

       S-Function  : env
       Description : Returns content of an environment variable
       Syntax      : let $x=$env("HOME")
       Notes       : Non-existant variables return an empty string.
       See Also    : putenv.

       S-Function  : hex
       Description : Converts value to hexadecimal representation
       Syntax      : let $x=$hex(x)
       Notes       : Letters a-f in lowercase, no preceding "0x"
       See Also    : $hexu(), $oct().

       S-Function  : hexu
       Description : Converts value to hexadecimal representation
       Syntax      : let $x=$hex(x)
       Notes       : Letters A-F in uppercase, no preceding "0x"
       See Also    : $hex(), $oct().

       S-Function  : hms
       Description : Converts number of seconds into time string
       Syntax      : let $x=$hms(x)
       Notes       : Format is "HH:MM:SS".  Useful for chronometer displays
       Notes       : Use with "time()", do not try to increment a variable
       Notes       : every second using "sleep 1".  (See ISP script example)
       Notes       : Format becomes "HHH:MM:SS" after 99 hours, 59 minutes,
       Notes       : 59s...
       See Also    : time().

       S-Function  : left
       Description : Returns left portion of a string
       Syntax      : let $x=$left($s,l)
       Notes       : $s=Source string, l=length
       Notes       : l must be less than the length of the string.
       See Also    : $right(), $mid().

       S-Function  : mid
       Description : Returns midsection of a string.
       Syntax      : let $x=$mid($s,s,l)
       Notes       : $s=Source string, s=start, l=length
       Notes       : s must be less than the length of the string, l can be
       Notes       : some huge number (9999) to return the right side of a
       Notes       : string to the end.  the first character of a string is
       Notes       : position 0, not 1.
       See Also    : $right(), $left().

       S-Function  : oct
       Description : Converts value to octal representation.
       Syntax      : let $x=$oct(x)
       See Also    : $hex(), $hexu().

       S-Function  : right
       Description : Returns right portion of a string.
       Syntax      : let $x=$right($s,l)
       Notes       : $s=Source string, l=length
       Notes       : l must be less than the length of the string.
       See Also    : $left(), $mid().

       S-Function  : rpipe
       Description : Returns the first line from a system piped command
       Syntax      : let $x=$rpipe("/bin/ls |grep myfile")
       Notes       : Not very useful unless used with head, tail, grep,
       Notes       : etc...
       See Also    : system.

       S-Function  : time
       Description : Returns 24 character local time string
       Syntax      : let $x=$time()
       See Also    : time().
       Notes       : Time is in this format: Mon Apr  8 14:21:22 1996
                                             012345678901234567890123
                                                       1         2

       S-Function  : tolower
       Description : Returns lowercase´d string.
       Syntax      : let $x=$tolower($y)

       S-Function  : toupper
       Description : Returns uppercase´d string.
       Syntax      : let $x=$toupper($y)

   Test operators
       Operator Description       Example       Result
       =        equal             if 1+2=3      yes
       !=       not equal         if 1+2!=3     no
       <>       not equal         if 1+2<>3     no
       >        Greater than      if 1+3>3      yes
       <        Less than         if 1+3<3      no
       >=       Greater or equal  if 3>=3       yes
       <=       Greater or equal  if 2<=3       yes

       Strings can be compared using the same operators.

       "aaa" < "aab",  "aaaa" > "aaa", "Test" != "test", "One" = "One",
       "A" > "a", "Fumble" <= "Fumigate", "Farsical" <> "Comedic"

       Note that "set ignorecase on" does NOT apply to string comparisons.

   Expression operators
       Operator  Description      Example           Result
       +         Addition         let a=2+2         4
       +         Concatenation    let $b="aa"+"bb"  "aabb"
       -         Substraction     let e=2-5         -3
       *         Multiplication   let f=11*2        22
       /         Division         let g=34/11       3
       &         Bit-Wise AND     let h=42&7        2
       |         Bit-Wise OR      let a=42|5        47
       ^         Bit-Wise XOR     let a=42^7        45

       Mixed expression examples:

       #Returns number of seconds since 00:00:00
       let $t=$time() #Take a snapshot.
       let a=(val(mid$($t,11,2))*3600)+(val(mid$($t,14,2))*60)+val(mid$($t,17,2))
       #Notice the extra sets of parenthesis because comgt´s expression
       #evaluator is brain-dead.
       #For example, 5-2+1 should give you 4, right?  Well, according to
       #getvalue(), it actually gives 2, because it does it somewhat from
       #right to left.
       #So to evaluate 5-2+1 correctly, use (5-2)+1.  If you´re using
       #simple, two-element calculations, don´t worry about it.
       #5-2 will give you 3.

       #Concatenation  (Calls cu)
       exec "cu -l "+$dev()+" -s "+$baud()"

       #In a test condition
       if a+c > strlen($c) goto toomuch

       #String comparison
       let $t=$mid($time(),11,8)
       if $t > "19:59:59" print "Too late for that!\n" goto toolate
       if $t < "08:00:00" print "Too early!\n" goto tooearly
       if $t = "00:00:00" print "Oh god!  It´s Twinkee time!\n"

KNOWN FEATURES
       The getvalue() parser.  It makes me laugh so I think I´ll leave it that way.  - Daniel.Chouinard@pwc.utc.com

ENVIRONMENT VARIABLES
       COMGTPIN - the 4 digit pin of the SIM for use by PIN script COMGTAPN - the APN to write to the data card, used by the APN script.

AUTHORS
       Daniel.Chouinard <Daniel.Chouinard@pwc.utc.com> wrote the original dcon utility.

       Paul Hardwick <paul@peck.org.uk> updated it for the latest compilers, provided the built-in script functionality and tested it against GPRS and 3G datacards.

       Martin Gregorie <martin@gregorie.org> wrote the original manpage for comgt from the dcon documentation and packaged comgt for distribution.

   History
       Daniel Chouinard wrote most (90%) of dcon back in 1989 when he started doing Unix Apps tech support mostly by modem to customer systems.  He was tired of typing  all  those  pass‐
       words and funny call-charging codes everytime he used cu.  Also, the company he worked for needed a system that would log call times and estimated costs.  Thus dcon was born.  Six
       or seven years later (1996) and he was using pppd to connect to his ISP site.  He was more or less happy with chat but found it lacked flow control and  multiple  response  checks
       from "atdt...".  He wanted it to do different things for "no carrier", "no dial tone", and "busy".  Although he thought that chat would probably be enhanced someday, when he found
       dcon.c on one of his old 45M tapes he tried compiling it on his Linux box and, lo and behold, it did.  In the end, he added a few things to it (kill, fork, wait, 1/100 sec. times)
       and left it at that.

       A  couple of years ago Paul Hardwick found the program, dcon 0.97, last modified in 1996. The purpose of this program was to run scripts that would control Linux serial ports. The
       implementation was very similar to something he had written for Windows. Anyway, rather than reinvent he contacted the author, Daniel Chouinard, and asked his permission to  reuse
       the  code.   Happily  he  gave permission and a basic but useful utility called comgt was created. Paul takes no credit for the engine, apart from making it compatible with todays
       compilers.  It is basically dcon repackaged.

                                                                                     20 October, 2006                                                                             comgt(1)
