export STERN="
 #####
#     # ##### ###### #####  #    #
#         #   #      #    # ##   #
 #####    #   #####  #    # # #  #
      #   #   #      #####  #  # #
#     #   #   #      #   #  #   ##
 #####    #   ###### #    # #    #
"

stern_install() {
    if [ -n "${DISTRO}" ]; then
        echo "$STERN"
        echo "--------------------------------------------------------------"
        echo "We found this OS to be $DISTRO so we are installing for Linux"
        echo "We are going to check your paths to see if stern is installed."
        echo "If it is installed already, you will have to remove it for this to work."
        echo "We install stern to $HOME/bin so we do not need root privilges"
        echo "Please make sure that '$HOME/bin' is in your path, usually in .bashrc or .zshrc"
        echo "Checking for stern with the command - which helm......."
        echo "---------------------------------------------------------------"
        stern_install_linux
    else
        echo "DISTRO is not set. Trying to install for OSX(Mac)"
        stern_install_mac
    fi





}

stern_install_linux() {
if [[ -f $(which stern) ]]; then
    echo "Stern exists already. Please remove from $(which stern) because I don't have root"
else
    # https://github.com/wercker/stern/releases
    curl -sS -L -o $HOME/bin/stern https://github.com/wercker/stern/releases/download/1.11.0/stern_linux_amd64 \
    && chmod +x $HOME/bin/stern

fi
}



stern_install_mac() {

}

