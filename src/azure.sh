export AZURE="
   #
  # #   ###### #    # #####  ######
 #   #      #  #    # #    # #
#     #    #   #    # #    # #####
#######   #    #    # #####  #
#     #  #     #    # #   #  #
#     # ######  ####  #    # ######
"

azure_install() {
    if [ -n "${DISTRO}" ]; then
        echo "$AZURE"
        echo "--------------------------------------------------------------"
        echo "We found this OS to be $DISTRO so we are installing for Linux"
        echo "We are going to check your paths to see if azure cli is installed."
        echo "If it is installed already, you will have to remove it for this to work."
        echo "We install azure cli to $HOME/bin so we do not need root privilges"
        echo "Please make sure that '$HOME/bin' is in your path, usually in .bashrc or .zshrc"
        echo "Checking for azure cli with the command - which az......."
        echo "---------------------------------------------------------------"
        azure_install_linux
    else
        echo "DISTRO is not set. Trying to install for OSX(Mac)"
        azure_install_mac
    fi





}

azure_install_linux() {
if [[ -f $(which az) ]]; then
    echo "az exists already. Please remove from $(which az) because I don't have root"
else
    curl -L https://aka.ms/InstallAzureCli | bash
   fi
}



azure_install_mac() {

}

