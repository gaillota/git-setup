#!bin/bash

# Is Git installed?
set +e
hasGit=$(git --version | grep "version")
set -e

if [ ! "$hasGit" ]; then
	echo "You need to install Git first."
	echo "Install Git for you ?"
	select yn in "Yes" "No"; do
	    case $yn in
	        Yes ) sudo apt-get update && sudo apt-get install git; break;;
	        No ) exit;;
	    esac
	done
	echo "Git successfully installed. Re-run script to setup configuration"
else
	echo "Enter your git username:"
	read _USERNAME
	echo "Enter your git email:"
	read _EMAIL

	echo "Setting up user informations..."
	git config --global user.name ${_USERNAME}
	git config --global user.email ${_EMAIL}

	echo "Setting up push default"
	git config --global push.default matching

	echo "Setting up aliases..."
	git config --global alias.co checkout
	git config --global alias.ci commit
	git config --global alias.st status
	git config --global alias.br branch

	echo "Configuration is done !"
fi