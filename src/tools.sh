export TOOLS="
#######
   #     ####   ####  #       ####
   #    #    # #    # #      #
   #    #    # #    # #       ####
   #    #    # #    # #           #
   #    #    # #    # #      #    #
   #     ####   ####  ######  ####
"

tools_install() {
    if [ -n "${DISTRO}" ]; then
        echo "$TOOLS"
        echo "--------------------------------------------------------------"
        echo "We found this OS to be $DISTRO so we are installing for Linux"
        echo "We are going to check your paths to see if tools are installed."
        echo "If it is installed already, you will have to remove it for this to work."
        echo "We install tools to $HOME/bin so we do not need root privilges"
        echo "Please make sure that '$HOME/bin' is in your path, usually in .bashrc or .zshrc"
        echo "Checking for tools with the command - which tools......."
        echo "---------------------------------------------------------------"
        tools_install_linux
    else
        echo "DISTRO is not set. Trying to install for OSX(Mac)"
        tools_install_mac
    fi

}

tools_install_linux() {
if [[ -f $(which tools) ]]; then
    echo "Helm exists already. Please remove from $(which tools) because I don't have root"
else
    # tflint
    curl -sS -L "$(curl -Ls https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep -o -E "https://.+?_linux_amd64.zip")" | bsdtar -xf - -C $HOME/bin \
    && chmod +x $HOME/bin/tflint \
    && echo "Installed tflint"

    # terragrunt
    curl -sS -L "$(curl -Ls https://api.github.com/repos/gruntwork-io/terragrunt/releases/latest | grep -o -E "https://.+?_linux_amd64")" -o $HOME/bin/terragrunt \
    && chmod +x $HOME/bin/terragrunt \
    && echo "Installed terragrunt"

    # astro
    curl -sS -L "$(curl -Ls https://api.github.com/repos/uber/astro/releases/latest | grep -o -E "https://.+?_linux_64-bit.tar.gz")" | bsdtar -xf - --include=astro  --include=tvm -C $HOME/bin \
    && echo "Installed astro and tvm"

    # tfk8s (yaml to kubernetes_manifest)
    mkdir /tmp/tfk8s \
    && git clone https://github.com/jrhouston/tfk8s.git /tmp/tfk8s \
    && make -C /tmp/tfk8s build \
    && mv /tmp/tfk8s/tfk8s $HOME/bin/ \
    && rm -rf /tmp/tfk8s


fi
}



tools_install_mac() {

}

