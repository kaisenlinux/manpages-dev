SENSORS-DETECT(8)                                                      System Manager's Manual                                                     SENSORS-DETECT(8)

NAME
       sensors-detect - detect hardware monitoring chips

SYNOPSIS
       sensors-detect [ --auto ]

DESCRIPTION
       sensors-detect  is  an  interactive program that will walk you through the process of scanning your system for various hardware monitoring chips, or sensors,
       supported by libsensors(3), or more generally by the lm_sensors tool suite.

       sensors-detect will look for the following devices, in order:

       •      Sensors embedded in CPUs, south bridges and memory controllers.

       •      Sensors embedded in Super I/O chips.

       •      Hardware monitoring chips accessed through ISA I/O ports.

       •      Hardware monitoring chips reachable over the SMBus or more generally any I2C bus on your system.

       As the last two detection steps can cause trouble on some systems, they are normally not attempted if the second detection step led to the discovery of a Su‐
       per  I/O chip with complete hardware monitoring features.  However, the user is always free to ask for all detection steps if so is his/her wish. This can be
       useful if a given system has more than one hardware monitoring chip. Some vendors are known to do this, most notably Asus and Tyan.

OPTIONS
       --auto Run in automatic, non-interactive mode. Assume default answers to all questions. Note that this isn't necessarily safe as the internal logic may  lead
              to potentially dangerous probes being attempted. See the WARNING section below.

WARNING
       sensors-detect needs to access the hardware for most of the chip detections.  By definition, it doesn't know which chips are there before it manages to iden‐
       tify them. This means that it can access chips in a way these chips do not like, causing problems ranging from SMBus lockup to permanent hardware  damage  (a
       rare case, thankfully.)

       The  authors made their best to make the detection as safe as possible, and it turns out to work just fine in most cases, however it is impossible to guaran‐
       tee that sensors-detect will not lock or kill a specific system. So, as a rule of thumb, you should not run sensors-detect on  production  servers,  and  you
       should  not run sensors-detect if can't afford replacing a random part of your system. Also, it is recommended to not force a detection step which would have
       been skipped by default, unless you know what you are doing.

SEE ALSO
       sensors(1), libsensors(3)

AUTHOR
       Frodo Looijaard and Jean Delvare

lm-sensors 3                                                               September 2013                                                          SENSORS-DETECT(8)
