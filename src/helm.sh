export HELM="
#     #
#     # ###### #      #    #
#     # #      #      ##  ##
####### #####  #      # ## #
#     # #      #      #    #
#     # #      #      #    #
#     # ###### ###### #    #
"

helm_install() {
    if [ -n "${DISTRO}" ]; then
        echo "$HELM"
        echo "--------------------------------------------------------------"
        echo "We found this OS to be $DISTRO so we are installing for Linux"
        echo "We are going to check your paths to see if helm is installed."
        echo "If it is installed already, you will have to remove it for this to work."
        echo "We install helm to $HOME/bin so we do not need root privilges"
        echo "Please make sure that '$HOME/bin' is in your path, usually in .bashrc or .zshrc"
        echo "Checking for helm with the command - which helm......."
        echo "---------------------------------------------------------------"
        helm_install_linux
    else
        echo "DISTRO is not set. Trying to install for OSX(Mac)"
        helm_install_mac
    fi





}

helm_install_linux() {
if [[ -f $(which helm) ]]; then
    echo "Helm exists already. Please remove from $(which helm) because I don't have root"
else
    # https://github.com/kubernetes/helm/releases
    export HELM3_VERSION="v3.5.2"
    curl -sS -L https://get.helm.sh/helm-${HELM3_VERSION}-linux-amd64.tar.gz | bsdtar -xf - --include=linux-amd64/helm -s /linux-amd64/./ -C $HOME/bin  \
    && chmod +x $HOME/bin/helm

fi
}



helm_install_mac() {

}

