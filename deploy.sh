#!/bin/bash
set -x
# DESCRIPTION  : Quickly update local kaisenlinux.org website repo OR kaisen-webdocs package repo
# USAGE	       : ./deploy.sh --website OR ./deploy.sh --package
# REQUIREMENTS :
#		- manual cloning of kaisenlinux.org & kaisen-webdocs
#		- manual build of manpages-dev repo with ./mix_build.sh OR mix_build.sh --package

func_website() {

read -p "What is the absolute path of kaisenlinux.org repo on your system ? :" kaisenlinuxorg
if [[ -d $kaisenlinuxorg ]]; then
  rm -Rf $kaisenlinuxorg/manpages/*
  cp -r doc/* $kaisenlinuxorg/manpages/
  echo "* Copied manpages generated with ./mix_build.sh to kaisen linux website repo."
else
  echo "ERROR : kaisenlinux.org repo not found !"
  exit
fi

}

func_deb_package() {
  
  echo "* Installing minimal requirements for deb packaging.."
  sudo apt install build-essential devscripts debhelper fakeroot -y
  read -p "What is the absolute path of kaisen-webdocs repo on your system ? :" kaisenwebdocs
  if [[ -d $kaisenwebdocs ]]; then
    rm -Rf $kaisenwebdocs/kaisen-manpages/*
    cp -r doc/* $kaisenwebdocs/kaisen-manpages/
    nano $kaisenwebdocs/debian/changelog
    cd $kaisenwebdocs/
    dpkg-buildpackage -rfakeroot -us -uc -tc
    echo "* Build done without sign"
  else
    echo "ERROR : kaisen-webdocs not found !"
  fi

}

if [[ $# -eq 1 ]]; then
  case $1 in
	--website)
	func_website
	;;
	--package)
	func_deb_package
	;;
	*)
	echo "ERROR :Command not found"
	exit
	;;
  esac
else
cat "ERROR : command not found
WARNING : this is a quick helper script !
You must run ./mix_build.sh  before deploying website
You must run ./mix_build.sh --package before deploying package"
fi
