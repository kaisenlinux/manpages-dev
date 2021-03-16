JMETER(1)                                                                   User Commands                                                                  JMETER(1)

NAME
       jmeter - Apache JMeter - Load testing tool

SYNOPSIS
       jmeter [options]

DESCRIPTION
       Apache  JMeter  is  a Java application designed to load test functional behavior and measure performance. It was originally designed for testing Web Applica‐
       tions but has since expanded to other test functions.

       Apache JMeter may be used to test performance both on static and dynamic resources (files, Servlets, Perl scripts, Java Objects, Data Bases and Queries,  FTP
       Servers  and  more). It can be used to simulate a heavy load on a server, network or object to test its strength or to analyze overall performance under dif‐
       ferent load types. You can use it to make a graphical analysis of performance or to test your server/script/object behavior under heavy concurrent load.

OPTIONS
       -h, --help

              print usage information and exit

       -v, --version

              print the version information and exit

       -p, --propfile <argument>

              the jmeter property file to use

       -q, --addprop <argument>

              additional JMeter property file(s)

       -t, --testfile <argument>

              the jmeter test(.jmx) file to run

       -l, --logfile <argument>

              the file to log samples to

       -j, --jmeterlogfile <argument>

              jmeter run log file (jmeter.log)

       -n, --nongui

              run JMeter in nongui mode

       -s, --server

              run the JMeter server

       -H, --proxyHost <argument>

              Set a proxy server for JMeter to use

       -P, --proxyPort <argument>

              Set proxy server port for JMeter to use

       -N, --nonProxyHosts <argument>

              Set nonproxy host list (e.g. *.apache.org|localhost)

       -u, --username <argument>

              Set username for proxy server that JMeter is to use

       -a, --password <argument>

              Set password for proxy server that JMeter is to use

       -J, --jmeterproperty <argument>=<value>

              Define additional JMeter properties

       -G, --globalproperty <argument>=<value>

              Define Global properties (sent to servers) e.g. -Gport=123

              or -Gglobal.properties

       -D, --systemproperty <argument>=<value>

              Define additional system properties

       -S, --systemPropertyFile <argument>

              additional system property file(s)

       -L, --loglevel <argument>=<value>

              [category=]level e.g. jorphan=INFO or jmeter.util=DEBUG

       -r, --runremote

              Start remote servers (as defined in remote_hosts)

       -R, --remotestart <argument>

              Start these remote servers (overrides remote_hosts)

       -d, --homedir <argument>

              the jmeter home directory to use

       -X, --remoteexit

              Exit the remote servers at end of test (non-GUI)

EXAMPLES
       Run Apache JMeter in GUI mode:

              jmeter [-p property-file]

       Run Apache JMeter in NON_GUI mode:

              jmeter -n -t test-file [-p property-file] [-l log-file]

       Tell Apache JMeter to use a proxy server:

              jmeter -H [your.proxy.server] -P [your proxy server port]

       Run Apache JMeter in server mode:

              jmeter -s

       or     jmeter-server

HOMEPAGE
       http://jmeter.apache.org

                                                                              July 2013                                                                    JMETER(1)
