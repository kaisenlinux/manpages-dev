PACKER(1)                                                                      packer                                                                      PACKER(1)

NAME
       packer - tool for creating machine images for multiple platforms

SYNOPSIS
       $ packer <command> [<options>] <args>

       $ packer build -only=amazon-ebs template.json

DESCRIPTION
       Packer is a CLI tool for the automatic creation of identical machine images (single deployable units that contain a pre-configured OS and installed software)
       for multiple platforms (public cloud providers, private cloud and desktop virtualization solutions) from a single JSON template configuration file.  For  the
       documentation of Packer, especially on how to write proper Packer templates, please see <https://www.packer.io/docs>.

COMMANDS
       build  build image(s) from a template. For a full list of options related to this command, see the output of: $ packer build -h.

       fix    fix  templates  from old versions of Packer like this: $ packer fix old.json > new.json. For a full list of fixes which this command performs and spe‐
              cial options, see the output of: $ packer fix -h.

       inspect
              print components of a template. This command validates the basic syntax of the template by necessity, but not if the configuration is valid  (this  is
              what the command validate is for).

       validate
              check  if  a template is valid. The command returns a zero exit status if a template is valid, and a non-zero exit status if it isn't. If -syntax-only
              is given as option, only the syntax of the template is checked.

       version
              print the Packer version

LOGGING
       To get a build log, run packer like this: $ PACKER_LOG=1 packer build foo.json 2>>build.log, or use $PACKER_LOG_PATH.

ENVIRONMENT VARIABLES
       For a full list of available environment variables, see <https://www.packer.io/docs/other/environmental-variables.html>.

AUTHORS
       HashiCorp's Packer is developed by Mitchell Hashimoto  <mitchell.hashimoto@gmail.com>,  Jack  Pearkes  <jackpearkes@gmail.com>,  Mark  Peek,  Ross  Smith  II
       <ross@smithii.com>, and Rickard von Essen <rickard.von.essen@gmail.com>.

       This manpage is written by Daniel Stender <stender@debian.org> for the Debian Go packaging team.

                                                                                                                                                           PACKER(1)
