  IW
 
## NAME
        iw - show / manipulate wireless devices and their configuration
 
## SYNOPSIS
        iw [## OPTIONS] { help [ command ] | OBJECT COMMAND }
 
        OBJECT := { dev | phy | reg }
 
        OPTIONS:= { --version | --debug }
 
## OPTIONS
         --version
               print version information and exit.
 
         --debug
               enable netlink message debugging.
 
 IW - COMMAND SYNTAX
    OBJECT
        dev <interface name>
               - network interface.
 
        phy <phy name>
               - wireless hardware device (by name).
 
        phy#<phy index>
               - wireless hardware device (by index).
 
        reg    - regulatory agent.
 
    COMMAND
        Specifies the action to perform on the object.  The set of possible actions depends on the object type.  iw help will print all supported commands, while iw
        help command will print the help for all matching commands.
 
## SEE ALSO
        ip(8), crda(8), regdbdump(8), regulatory.bin(5)
 
        http://wireless.kernel.org/en/users/Documentation/iw
 
 iw                                                                           7 June 2012                                                                       IW(8)
