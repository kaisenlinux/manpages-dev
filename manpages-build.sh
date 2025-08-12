#!/bin/bash

# DESCRIPTION   : Generate manpages for Kaisen Linux system (https://kaisenlinux.org) in output/ folder.
# REQUIREMENTS  : Kaisen Linux with MATE desktop
# AUTHOR        : Arnaud Cormier
# DATE          : 02042021
#
# USAGE         : ./manpages-build [OPTIONS]
#
# OPTIONS       :
#                  --scan [STEPS]
#
#                  STEPS     TASKS
#                  step1     Scanning system for manpages files (all sections)
#                  step2     Scanning system for desktop files (applications and kaisen-menu)
#                  step3     Scanning system for docs files
#                  step4     Scanning system for packages installed
#                  step5     Scanning repository main contrib non-free packages
#                  full      Execute all 5 steps sequentially (normal build)
#                  clean     Clean all previous generated scan (folders : output_scan_JJMMAAAA_HHMM/)
#
#                  --parse [kaisen-apps] | [kaisen-categories] | [full] | [clean]

# DEBUG
#set -x

# base folders where all files are generated when :
## running full build
base_dir="output_fullbuild_$(date +%d%m%Y)"

## running with option scan only
base_dir_scan="output_scan_$(date +%d%m%Y_%HH%M)"

## running with option parse only
base_dir_parse="output_parse_$(date +%d%m%Y_%HH%M)"

# error message used in func_error and run_options too
error_option="ERROR : Command not found, see help below\n"


#Clean environment
rm -rfv categories/ commands/ configuration_files/ output_fullbuild* _build doc *.exs mix.log mix.lock

func_init() {

if [[ -d "lib/" ]]; then
  echo "functions checked"
  echo "Script started..."
  echo ""
else
  echo "lib init failed"
  exit
fi

}

func_usage() {

    cat << EOF
DESCRIPTION   : Generate manpages md files with category of an installed Kaisen Linux system (for new release)
USAGE         : ./manpages-build [OPTIONS]
OPTIONS       : --fullbuild           : generate manpages-dev updated repo (ready for execution of ./mix_build.sh)
              : --fullbuild clean     : Remove generated output_fullbuild_* directory

EOF

                # --scan [STEPS]

                #   STEPS     TASKS
                #   step1     Scanning system for manpages files    (all sections)
                #   step2     Scanning system for desktop files     (applications and kaisen-menu)
                #   step3     Scanning system for docs files
                #   step4     Scanning system for packages installed
                #   step5     Scanning repository for packages      (main contrib non-free)
                #   full      Execute all 5 steps sequentially      (normal build)
                #   clean     Clean all previous generated scan     (folders : output_scan_JJMMAAAA_HHMM/)

                # --parse [kaisen-apps] | [kaisen-categories] | [full] | [clean]
}


func_error() {

if [[ "$1" = "--scan" ]] ||  [[ "$1" = "--parse" ]] && [[ "$#" -ne 2  ]]; then
    echo -e "$error_option"
    func_usage
fi

if  [[ "$#" -eq 2 ]] && [[ "$1" = "--fullbuild" ]] && [[ "$2" != "clean" ]]; then
    echo -e "$error_option"
    func_usage
fi

if [[ "$#" -eq 0 ]]; then
     echo -e "$error_option"
     func_usage
fi

}

########
# RUN
########

func_init

###############
# CHECK WRONG ARGS
###############

func_error "$@"


#############
# SOURCE FX
#############

source lib/1-scan
source lib/2-parse
source lib/3-gen
source lib/4-postgen
source lib/5-buildrepo


# ############
# # SOURCE LIB
# ############

#source lib/run_options

source lib/run_fullbuild

#func_options "$@"


