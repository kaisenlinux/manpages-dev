DOCKER-COMPOSE(1)                                                                      User Commands                                                                     DOCKER-COMPOSE(1)

NAME
       docker-compose - Define and run multi-container applications with Docker.

SYNOPSIS
       docker-compose [OPTIONS] [COMMAND] [ARGS]...

DESCRIPTION
       docker-compose  allows  you  to  define a multi-container application with all of its dependencies in a single file, then spin the application up in a single command. The applica‐
       tion’s structure and configuration are held in a single place, which makes spinning up applications simple and repeatable everywhere.

OPTIONS
       -f, --file FILE
              Specify an alternate compose file (default: docker-compose.yml)

       -p, --project-name NAME
              Specify an alternate project name (default: directory name)

       --verbose
              Show more output

       -v, --version
              Print version and exit

COMMANDS
   build
       Build or rebuild services

       --no-cache
              Do not use cache when building the image.

   help
       Displays help and usage information on a command.

   kill
       Forces running containers to stop by sending a SIGKILL signal.

       -s SIGNAL
              SIGNAL to send to the container. Default signal is SIGKILL.

   logs
       View output from containers.

       --no-color
              Produce a monochrome output.

   port
       Print the public port for a port binding

       --protocol=proto
              Choose the 4th layer protocol, tcp or udp. Default is tcp.

       --index=index
              Index of the container if there are multiple instances of a service. Default is 1.

   ps
       List containers.

       -q     Only display IDs.

   pull
       Pulls service images from Docker registry.

       --allow-insecure-ssl
              Allow insecure connections to the Docker registry.

   restart
       Restart running containers.

       -t, --timeout TIMEOUT
              Specify a shutdown timeout in seconds. Default is 10.

   rm
       Remove stopped service containers

       -f, --force
              Do not ask to confirm removal.

       -v     Remove volumes associated with containers.

   run
       Run a one-off command on a service. By default linked services will be started, unless they are already running.

       --allow-insecure-ssl
              Allow insecure connections to the Docker registry.

       -d     Detached mode. Run container in the background, print new container name.

       --entrypoint CMD
              Override the entrypoint of the image with CMD.

       -e KEY=VAL
              Set an environment variable. Can be used multiple times.

       -u, --user=USER
              Run as a specific USER, a username or uid.

       --no-deps
              Do not start linked services.

       --rm   Remove container after run. This option is ignored in the detached mode.

       --service-ports
              Run command with the service's ports enabled and mapped to the host.

       -T     Disable pseudo tty allocation. By default a tty is allocated.

   scale
       Set number of containers to run for a service. Numbers are specified in the form service=num as arguments.

              # docker-compose scale web=2 worker=3

   start
       Start existing containers.

   stop
       Stop running containers without removing them.

       -t, --timeout TIMEOUT
              Specify a shutdown timeout in seconds. Default is 10.

   up
       Build, (re)create, start and attach to containers.  If there are existing containers for a service, `docker-compose up` will stop and recreate  them  (preserving  mounted  volumes
       with  volumes-from),  so  that changes in `docker-compose.yml` are picked up. If you do not want existing containers to be recreated, `docker-compose up --no-recreate` will re-use
       existing containers.

       --allow-insecure-ssl
              Allow insecure connections to the Docker registry.

       -d     Detached mode. Run container in the background, print new container name.

       --no-color
              Produce a monochrome output.

       --no-deps
              Do not start linked services.

       --x-smart-recreate
              Only recreate containers whose configuration or image needs to be updated. This feature is experimental.

       --no-recreate
              If containers already exist, do not recreate them.

       --no-build
              Do not build an image even if it is missing.

       -t, --timeout TIMEOUT
              Specify a shutdown timeout in seconds. Default is 10.

   migrate-to-labels
       Recreate containers to add labels. If docker-compose detects containers that were created without labels, it will refuse to run so that you don't end up with two sets of them.

ENVIRONMENTAL VARIABLES
       Several environmental variables are available to configure docker-compose behavior.

       Variables starting with DOCKER_ are the same as those used to configure the Docker command-line client. If you're using boot2docker, eval "$(boot2docker shellinit)" will set  them
       to their correct values.

   COMPOSE_PROJECT_NAME
       Sets the project name, which is prepended to the name of every container started by docker-compose.  Defaults to the basename of the current working directory.

   COMPOSE_FILE
       Specify  what  file  to  read configuration from. If not provided, docker-compose will look for docker-compose.yml in the current working directory, and then each parent directory
       successively, until found.

   DOCKER_HOST
       Sets the URL of the docker daemon. As with the Docker client, defaults to unix:///var/run/docker.sock.

   DOCKER_TLS_VERIFY
       When set to anything other than an empty string, enables TLS communication with the daemon.

   DOCKER_CERT_PATH
       Configures the path to the ca.pem, cert.pem, and key.pem files used for TLS verification.  Defaults to ~/.docker.

SEE ALSO
       Full documentation for docker-compose at: <http://docs.docker.com/compose/>

AUTHOR
       This manual page was written by Dariusz Dwornikowski <dariusz.dwornikowski@cs.put.poznan.pl> based on the official docker compose documentation.

docker-compose                                                                           July 2015                                                                       DOCKER-COMPOSE(1)
