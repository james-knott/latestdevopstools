export GOTOP="
 ####   ####  #####  ####  #####
#    # #    #   #   #    # #    #
#      #    #   #   #    # #    #
#  ### #    #   #   #    # #####
#    # #    #   #   #    # #
 ####   ####    #    ####  #
"

gotop_install() {
    if [ -n "${DISTRO}" ]; then
        echo "$GOTOP"
        echo "--------------------------------------------------------------"
        echo "We found this OS to be $DISTRO so we are installing for Linux"
        echo "We are going to check your paths to see if gotop is installed."
        echo "If it is installed already, you will have to remove it for this to work."
        echo "We install gotop to $HOME/bin so we do not need root privilges"
        echo "Please make sure that '$HOME/bin' is in your path, usually in .bashrc or .zshrc"
        echo "Checking for gotop with the command - which gotop......."
        echo "---------------------------------------------------------------"
        gotop_install_linux
    else
        echo "DISTRO is not set. Trying to install for OSX(Mac)"
        gotop_install_mac
    fi





}

gotop_install_linux() {
if [[ -f $(which gotop) ]]; then
    echo "gotop exists already. Please remove from $(which gotop) because I don't have root"
else
    curl -sS -L https://github.com/xxxserxxx/gotop/releases/download/v4.1.1/gotop_v4.1.1_linux_amd64.tgz | bsdtar -xf - -C $HOME/bin \
    && chmod +x $HOME/bin/gotop
fi
}



gotop_install_mac() {

}

