#!/usr/bin/bash

set -e

# DESCRIPTION : Rename mix files to build doc for category then doc for packages. And check mix dependancy the first time.
# USAGE : mix_build.sh or mix_build.sh --package
# DATE : 18/03/2021

function build_categories () {
    if [[ -f mix_categories.exs ]]; then
        echo "Build of categories"
        cp mix_categories.exs mix.exs

        # Check mix dependancy the first time
        if [[ ! -f mix.log ]]; then
            mix deps.get
            echo "First deps checked" > mix.log
        fi
            # build doc for category
            mix docs
            rm -f mix.exs
    fi
}

function build_commands () {
    if [[ -f mix_commands.exs ]]; then
        echo "Build of commands"
        cp mix_commands.exs mix.exs
        mix docs
        rm -f mix.exs
    fi
}
function build_configuration_files () {
    if [[ -f mix_configuration_files.exs ]]; then
        echo "Build of configuration_files"
        cp mix_configuration_files.exs mix.exs
        mix docs
        rm -f mix.exs
    fi
}
build_categories
build_commands
build_configuration_files

echo "Doc categories builded in doc/ folder"
echo "Doc commands builded in doc/commandes folder"
echo "Doc configuration_files builded in doc/configuration_files folder"
echo ""
echo "Run firefox doc/index.html to verify changes"
echo "Run firefox doc/commands/index.html to verify changes"
echo "Run firefox doc/configuration_files/index.html to verify changes"
