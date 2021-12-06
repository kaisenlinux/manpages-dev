PUPPET(8)                                                                              Puppet manual                                                                             PUPPET(8)

NAME
       puppet

       Usage: puppet subcommand [options] action [options]

       Available subcommands:

       agent  The  puppet  agent daemon apply Apply Puppet manifests locally ca Local Puppet Certificate Authority management. (Deprecated) catalog Compile, save, view, and convert cata‐
       logs. cert Manage certificates and requests (Deprecated) certificate Provide access to the CA for certificate management. (Deprecated) certificate_request Manage  certificate  re‐
       quests. (Deprecated) certificate_revocation_list Manage the list of revoked certificates. (Deprecated) config Interact with Puppet's settings. describe Display help about resource
       types device Manage remote network devices doc Generate Puppet references epp Interact directly with the EPP template parser/renderer. facts Retrieve and store  facts.  filebucket
       Store  and  retrieve  files  in a filebucket generate Generates Puppet code from Ruby definitions. help Display Puppet help. key Create, save, and remove certificate keys. (Depre‐
       cated) lookup Interactive Hiera lookup man Display Puppet manual pages. (Deprecated) master The puppet master daemon module Creates, installs and searches for modules on the  Pup‐
       pet  Forge.  node View and manage node definitions. parser Interact directly with the parser. plugin Interact with the Puppet plugin system. report Create, display, and submit re‐
       ports. resource The resource abstraction layer shell script Run a puppet manifests as a script without compiling a catalog status View puppet server status. (Deprecated)

       See 'puppet help subcommand action' for help on a specific subcommand action. See 'puppet help subcommand' for help on a specific subcommand. Puppet v5.5.22

Puppet, Inc.                                                                            March 2021                                                                               PUPPET(8)
