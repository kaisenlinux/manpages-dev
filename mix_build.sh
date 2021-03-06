#!/usr/bin/bash

# DESCRIPTION : Rename mix files to build doc for category then doc for packages. And check mix dependancy the first time.
# USAGE : mix_build.sh or mix_build.sh --package 
# DATE : 18/03/2021

function build_category () {
    if [[ -f mix_category.exs ]]; then
        echo "Build of category"
        cp mix_category.exs mix.exs

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

function build_packages () {
    if [[ -f mix_packages.exs ]]; then
        echo "Build of packages"
        cp mix_packages.exs mix.exs
        mix docs
        rm -f mix.exs
    fi
}
build_category
build_packages


case $# in
	0)
        cp -f priv/assets/doc-versions.js doc/
        cp -f priv/assets/packages/doc-versions.js doc/packages/
	;;   
 	1)
        cp -f priv/assets/doc-versions-packages.js doc/doc-versions.js
        cp -f priv/assets/packages/doc-versions-packages.js doc/packages/doc-versions.js
    	;;
	*)
	exit
	;;
esac

echo "Doc category builded in doc/ folder and Doc packages builded in doc/packages/ folder"
echo ""
echo "Run firefox doc/index.html or firefox doc/packages/readme.html to verify changes"
