export ISTIO="
#  ####  ##### #  ####   ####  ##### #
# #        #   # #    # #    #   #   #
#  ####    #   # #    # #        #   #
#      #   #   # #    # #        #   #
# #    #   #   # #    # #    #   #   #
#  ####    #   #  ####   ####    #   ######
"

istio_install() {
    if [ -n "${DISTRO}" ]; then
        echo "$ISTIO"
        echo "--------------------------------------------------------------"
        echo "We found this OS to be $DISTRO so we are installing for Linux"
        echo "We are going to check your paths to see if istioctl is installed."
        echo "If it is installed already, you will have to remove it for this to work."
        echo "We install istioctl to $HOME/bin so we do not need root privilges"
        echo "Please make sure that '$HOME/bin' is in your path, usually in .bashrc or .zshrc"
        echo "Checking for istioctl with the command - which istioctl......."
        echo "---------------------------------------------------------------"
        istio_install_linux
    else
        echo "DISTRO is not set. Trying to install for OSX(Mac)"
        istio_install_mac
    fi





}

istio_install_linux() {
if [[ -f $(which istioctl) ]]; then
    echo "Istioctl exists already. Please remove from $(which istioctl) because I don't have root"
else
    # https://github.com/istio/istio/releases/
    export ISTIO_VERSION="1.8.2"
    curl -sS -L https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istioctl-${ISTIO_VERSION}-linux-amd64.tar.gz | bsdtar -xf - -C $HOME/bin \
    && chmod +x $HOME/bin/istioctl

   fi
}



istio_install_mac() {

}

