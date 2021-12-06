ETCDCTL(1)                                                                             User Commands                                                                            ETCDCTL(1)

NAME
       etcdctl - A simple command line client for etcd.

WARNING
       Set environment variable ETCDCTL_API=3 to use v3 API or ETCDCTL_API=2 to use v2 API.

USAGE
       etcdctl [options] command [command options] [arguments...]

COMMANDS V3
       alarm disarm
              Disarms all alarms

       alarm list
              Lists all alarms

       auth disable
              Disables authentication

       auth enable
              Enables authentication

       check perf
              Check the performance of the etcd cluster

       compaction
              Compacts the event history in etcd

       defrag Defragments the storage of the etcd members with given endpoints

       del    Removes the specified key or range of keys [key, range_end)

       elect  Observes and participates in leader election

       endpoint hashkv
              Prints the KV history hash for each endpoint in --endpoints

       endpoint health
              Checks the healthiness of endpoints specified in `--endpoints` flag

       endpoint status
              Prints out the status of endpoints specified in `--endpoints` flag

       get    Gets the key or a range of keys

       help   Help about any command

       lease grant
              Creates leases

       lease keep-alive
              Keeps leases alive (renew)

       lease list
              List all active leases

       lease revoke
              Revokes leases

       lease timetolive
              Get lease information

       lock   Acquires a named lock

       make-mirror
              Makes a mirror at the destination etcd cluster

       member add
              Adds a member into the cluster

       member list
              Lists all members in the cluster

       member remove
              Removes a member from the cluster

       member update
              Updates a member in the cluster

       migrate
              Migrates keys in a v2 store to a mvcc store

       move-leader
              Transfers leadership to another etcd cluster member.

       put    Puts the given key into the store

       role add
              Adds a new role

       role delete
              Deletes a role

       role get
              Gets detailed information of a role

       role grant-permission
              Grants a key to a role

       role list
              Lists all roles

       role revoke-permission
              Revokes a key from a role

       snapshot restore
              Restores an etcd member snapshot to an etcd directory

       snapshot save
              Stores an etcd node backend snapshot to a given file

       snapshot status
              Gets backend snapshot status of a given file

       txn    Txn processes all the requests in one transaction

       user add
              Adds a new user

       user delete
              Deletes a user

       user get
              Gets detailed information of a user

       user grant-role
              Grants a role to a user

       user list
              Lists all users

       user passwd
              Changes password of user

       user revoke-role
              Revokes a role from a user

       version
              Prints the version of etcdctl

       watch  Watches events stream on keys or prefixes

OPTIONS V3
       --cacert=""
              verify certificates of TLS-enabled secure servers using this CA bundle

       --cert=""
              identify secure client using this TLS certificate file

       --command-timeout=5s
              timeout for short running command (excluding dial timeout)

       --debug[=false]
              enable client-side debug logging

       --dial-timeout=2s
              dial timeout for client connections

       -d, --discovery-srv=""
              domain name to query for SRV records describing cluster endpoints

       --endpoints=[127.0.0.1:2379]
              gRPC endpoints

       -h, --help[=false]
              help for etcdctl

       --hex[=false]
              print byte strings as hex encoded strings

       --insecure-discovery[=true]
              accept insecure SRV records describing cluster endpoints

       --insecure-skip-tls-verify[=false]
              skip server certificate verification (CAUTION: this option should be enabled only for testing purposes)

       --insecure-transport[=true]
              disable transport security for client connections

       --keepalive-time=2s
              keepalive time for client connections

       --keepalive-timeout=6s
              keepalive timeout for client connections

       --key=""
              identify secure client using this TLS key file

       --user=""
              username[:password] for authentication (prompt if password is not supplied)

       -w, --write-out="simple"
              set the output format (fields, json, protobuf, simple, table)

COMMANDS V2
       backup backup an etcd directory

       cluster-health
              check the health of the etcd cluster

       mk     make a new key with a given value

       mkdir  make a new directory

       rm     remove a key or a directory

       rmdir  removes the key if it is an empty directory or a key-value pair

       get    retrieve the value of a key

       ls     retrieve a directory

       set    set the value of a key

       setdir create a new directory or update an existing directory TTL

       update update an existing key with a given value

       updatedir
              update an existing directory

       watch  watch a key for changes

       exec-watch
              watch a key for changes and exec an executable

       member member add, remove and list subcommands

       user   user add, grant and revoke subcommands

       role   role add, grant and revoke subcommands

       auth   overall auth controls

       help, h
              Shows a list of commands or help for one command

OPTIONS V2
       --debug
              output cURL commands which can be used to reproduce the request

       --no-sync
              don't synchronize cluster information before sending request

       --output simple, -o simple
              output response in the given format (simple, `extended` or `json`) (default: "simple")

       --discovery-srv value, -D value
              domain name to query for SRV records describing cluster endpoints

       --insecure-discovery
              accept insecure SRV records describing cluster endpoints

       --peers value, -C value
              DEPRECATED - "--endpoints" should be used instead

       --endpoint value
              DEPRECATED - "--endpoints" should be used instead

       --endpoints value
              a comma-delimited list of machine addresses in the cluster (default: "http://127.0.0.1:2379,http://127.0.0.1:4001")

       --cert-file value
              identify HTTPS client using this SSL certificate file

       --key-file value
              identify HTTPS client using this SSL key file

       --ca-file value
              verify certificates of HTTPS-enabled servers using this CA bundle

       --username value, -u value
              provide username[:password] and prompt if password is not supplied.

       --timeout value
              connection timeout per request (default: 2s)

       --total-timeout value
              timeout for the command execution (except watch) (default: 5s)

       --help, -h
              show help

       --version, -v
              print the version

SEE ALSO
       ectd(1)

3.3.25                                                                                 October 2020                                                                             ETCDCTL(1)
