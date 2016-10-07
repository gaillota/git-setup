@echo off

WHERE git
IF %ERRORLEVEL% NEQ 0 (
	ECHO "You need to install git first."
	GOTO :end
)

SET /p username="Enter your git username: "
SET /p email="Enter your git email: "

ECHO "Setting up user informations..."
git config --global user.name %username%
git config --global alias.email %email%

ECHO "Setting up configuration"
git config --global push.default matching
git checkout -b master
git branch --set-upstream-to origin master

ECHO "Setting up aliases..."
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch

ECHO "Configuration done !"

:end
pause