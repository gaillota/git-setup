@echo off

::Is Git installed ?
WHERE git
IF %ERRORLEVEL% NEQ 0 (
	ECHO "You need to install Git first."
	GOTO :end
)

SET /p username="Enter your git username: "
SET /p email="Enter your git email: "

ECHO "Setting up user informations..."
git config --global user.name %username%
git config --global user.email %email%

ECHO "Setting up upstream branch"
git checkout -b master
git branch --set-upstream-to origin master

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