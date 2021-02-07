export TERRAFORM="
#######
   #    ###### #####  #####    ##   ######  ####  #####  #    #
   #    #      #    # #    #  #  #  #      #    # #    # ##  ##
   #    #####  #    # #    # #    # #####  #    # #    # # ## #
   #    #      #####  #####  ###### #      #    # #####  #    #
   #    #      #   #  #   #  #    # #      #    # #   #  #    #
   #    ###### #    # #    # #    # #       ####  #    # #    # "
terraform_install() {
    if [ -n "${DISTRO}" ]; then
        echo "$TERRAFORM"
        echo "--------------------------------------------------------------"
        echo "We found this OS to be $DISTRO so we are installing for Linux"
        echo "We are going to check your paths to see if terraform is installed."
        echo "If it is installed you will have to remove it for this to work."
        echo "We install terraform in $HOME/bin so we do not need root privilges"
        echo "Please make sure that '$HOME/bin' is in your path, usually in .bashrc or .zshrc"
        echo "Checking for terraform with the command - which terraform......."
        echo "---------------------------------------------------------------"
        terraform_install_linux
    else
        echo "DISTRO is not set. Please set this variable if Linux and do not set if OSX(Mac)"
        terraform_install_mac

    fi

}

terraform_install_linux() {
if [[ -f $(which terraform) ]]; then
    echo "Terraform exists already. Please remove from $(which terraform) because I don't have root"
else
    echo "Installing Terraform......on $DISTRO "
    export TERRAFORM12_VERSION="0.12.24"
    curl -sS -L https://releases.hashicorp.com/terraform/${TERRAFORM12_VERSION}/terraform_${TERRAFORM12_VERSION}_linux_amd64.zip | bsdtar -xf - -C $HOME/bin/ \
    && mv $HOME/bin/terraform $HOME/bin/terraform12 \
    && chmod +x $HOME/bin/terraform12

    export TERRAFORM13_VERSION="0.13.6"
    curl -sS -L https://releases.hashicorp.com/terraform/${TERRAFORM13_VERSION}/terraform_${TERRAFORM13_VERSION}_linux_amd64.zip | bsdtar -xf - -C $HOME/bin/ \
    && mv $HOME/bin/terraform $HOME/bin/terraform13 \
    && chmod +x $HOME/bin/terraform13

    export TERRAFORM14_VERSION="0.14.4"
    curl -sS -L https://releases.hashicorp.com/terraform/${TERRAFORM14_VERSION}/terraform_${TERRAFORM14_VERSION}_linux_amd64.zip | bsdtar -xf - -C $HOME/bin/ \
    && mv $HOME/bin/terraform $HOME/bin/terraform14 \
    && chmod +x $HOME/bin/terraform14
fi
}
terraform_install_mac() {

}
