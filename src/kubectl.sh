export KUBECTL="
#    #
#   #  #    # #####  ######  ####  ##### #
#  #   #    # #    # #      #    #   #   #
###    #    # #####  #####  #        #   #
#  #   #    # #    # #      #        #   #
#   #  #    # #    # #      #    #   #   #
#    #  ####  #####  ######  ####    #   ######
"

kubectl_install() {
        if [ -n "${DISTRO}" ]; then
        echo "$KUBECTL"
        echo "--------------------------------------------------------------"
        echo "We found this OS to be $DISTRO so we are installing for Linux"
        echo "We are going to check your paths to see if kubectl is installed."
        echo "If it is installed you will have to remove it for this to work."
        echo "We install kubectl in $HOME/bin so we do not need root privilges"
        echo "Please make sure that '$HOME/bin' is in your path, usually in .bashrc or .zshrc"
        echo "Checking for kubectl with the command - which terraform......."
        echo "---------------------------------------------------------------"
        kubectl_install_linux
        else
            echo "DISTRO Env Var is not set. Trying OSX(Mac) install."
            kubectl_install_mac
        fi
}

kubectl_install_linux() {
    if [ -x "$(command -v kubectl)" ]; then
            echo "Kubectl exists already. Please remove from $(command -v kubectl) because I don't have root"
            echo "If it is already installed in $HOME/bin and you want to upgrade, please remove it and rerun."
      else
      curl -sS -L -o $HOME/bin/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
      && chmod +x $HOME/bin/kubectl
      fi
      }

kubectl_install_mac() {


     }


