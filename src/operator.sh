export OPERATOR="
#######                                                        #####  ######  #    #
#     # #####  ###### #####    ##   #####  ####  #####        #     # #     # #   #
#     # #    # #      #    #  #  #    #   #    # #    #       #       #     # #  #
#     # #    # #####  #    # #    #   #   #    # #    # #####  #####  #     # ###
#     # #####  #      #####  ######   #   #    # #####              # #     # #  #
#     # #      #      #   #  #    #   #   #    # #   #        #     # #     # #   #
####### #      ###### #    # #    #   #    ####  #    #        #####  ######  #    #
"

operator_install() {
    if [ -n "${DISTRO}" ]; then
        echo "$OPERATOR"
        echo "--------------------------------------------------------------"
        echo "We found this OS to be $DISTRO so we are installing for Linux"
        echo "We are going to check your paths to see if the operator-sdk is installed."
        echo "If it is installed already, you will have to remove it for this to work."
        echo "We install operator-sdk to $HOME/bin so we do not need root privilges"
        echo "Please make sure that '$HOME/bin' is in your path, usually in .bashrc or .zshrc"
        echo "Checking for operator-sdk with the command - which operator-sdk......."
        echo "---------------------------------------------------------------"
        operator_install_linux
    else
        echo "DISTRO is not set. Trying to install for OSX(Mac)"
        operator_install_mac
    fi





}

operator_install_linux() {
if [[ -f $(which operator) ]]; then
    echo "Operator-SDK exists already. Please remove from $(which operator) because I don't have root"
else
# https://sdk.operatorframework.io/docs/install-operator-sdk/
# https://github.com/operator-framework/operator-sdk/releases
export OPERATOR_FRAMEWORK_VERSION="v1.4.0"
curl -sS -L -o $HOME/bin/operator-sdk https://github.com/operator-framework/operator-sdk/releases/download/${OPERATOR_FRAMEWORK_VERSION}/operator-sdk_linux_amd64 \
&& curl -sS -L -o $HOME/bin/ansible-operator https://github.com/operator-framework/operator-sdk/releases/download/${OPERATOR_FRAMEWORK_VERSION}/ansible-operator_linux_amd64 \
&& curl -sS -L -o $HOME/bin/helm-operator https://github.com/operator-framework/operator-sdk/releases/download/${OPERATOR_FRAMEWORK_VERSION}/helm-operator_linux_amd64 \
&& chmod +x $HOME/bin/operator-sdk $HOME/bin/ansible-operator $HOME/bin/helm-operator
fi
}



helm_install_mac() {

}

