#!/usr/bin/bash

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


case $# in
	0)
        cp -f priv/assets/doc-versions.js doc/
        cp -f priv/assets/packages/doc-versions.js doc/commands/
        cp -f priv/assets/doc-versions-conf.js doc/configuration_files/doc-versions.js

	;;   
 	1)
        cp -f priv/assets/doc-versions-packages.js doc/doc-versions.js
        cp -f priv/assets/packages/doc-versions-packages.js doc/commands/doc-versions.js
        cp -f priv/assets/packages/doc-versions-conf.js doc/configuration_files/doc-versions.js
    	;;
	*)
	exit
	;;
esac

echo "Doc categories builded in doc/ folder"
echo "Doc commands builded in doc/ folder"
echo "Doc configuration files builded in doc/ folder 
echo ""
echo "Run firefox doc/index.html or firefox doc/commands/readme.html or doc/configuration_files/readme.html to verify changes"
