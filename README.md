# Install Instructions
---------------------
* Copy start.sh to $HOME/bin - You may need to make the file executable with chmod +x
* Create ENV var in .bashrc or .zshrc - export OSDP=~/libs/osdp/osdp.sh 
* Create ENV var in .bashrc or .zshrc - export DISTRO=$(cat /etc/*-release | grep -w NAME | cut -d= -f2 | tr -d '"')
* Create folder structure mkdir -p ~/libs/osdp and copy osdp.sh to that folder
* Copy the folder src into ~/libs/osdp/ so the supporting scritps can find it in ~/libs/osdp/src
* If $HOME/bin is in your path you should be able to run start.sh from anywhere. 





# ROADMAP
------------
* Create an installer
* Create better looking menu and screens
* Do more error checking in the function libraries
* Better Support for versions when downloading.
* Mac Support as much as possible with darwin binaries and homebrew
* More tools
* Linux Distro package support
* Multiple levels of Menus
* More system support
* Dot files backup
* Custom Vim Setup
* Development Environment setup
* Python Version/Support
* Slack Support
* Website
