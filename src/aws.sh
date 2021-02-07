export AWS="
  ##   #    #  ####
 #  #  #    # #
#    # #    #  ####
###### # ## #      #
#    # ##  ## #    #
#    # #    #  ####
"

aws_install() {
    if [ -n "${DISTRO}" ]; then
        echo "$AWS"
        echo "--------------------------------------------------------------"
        echo "We found this OS to be $DISTRO so we are installing for Linux"
        echo "We are going to check your paths to see if awscli is installed."
        echo "If it is installed already, you will have to remove it for this to work."
        echo "We install awscli to $HOME/bin so we do not need root privilges"
        echo "Please make sure that '$HOME/bin' is in your path, usually in .bashrc or .zshrc"
        echo "Checking for awscli with the command - which awscli......."
        echo "---------------------------------------------------------------"
        aws_install_linux
    else
        echo "DISTRO is not set. Trying to install for OSX(Mac)"
        aws_install_mac
    fi





}

aws_install_linux() {
if [[ -f $(which aws) ]]; then
    #echo "aws exists already. Please remove from $(which aws) because I don't have root"
    echo "Found another version of awscli. Will try to update your version to the latest version...."
    pip install git+git://github.com/aws/aws-cli.git#2.0.0
else
    curl -sS -L  -o awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip \
    && unzip awscliv2.zip \
    && ./aws/install --bin-dir $HOME/bin --install-dir $HOME/bin/aws-cli --update \
    && rm -rf aws awscliv2.zip
    echo "AWS has been installed."
 fi
}



aws_install_mac() {

}

