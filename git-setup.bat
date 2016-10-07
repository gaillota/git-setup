@echo off

::TODO: Check if Git is installed ?

SET /P username="Enter your git username:"
SET /P email="Enter your git email: "

ECHO "Setting up user informations..."
git config --global user.name %username%
git config --global user.email %email%

git rev-parse --abbrev-ref HEAD | find /i "master"
IF %ERRORLEVEL% == 0 (
	ECHO "Setting up upstream branch"
	git branch --set-upstream-to origin master
)

ECHO "Setting up push default"
git config --global push.default matching

ECHO "Setting up aliases..."
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch

ECHO "Configuration is done !"

:end
pause