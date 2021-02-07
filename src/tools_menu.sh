#!/bin/bash

devops_tools_menu() {
selection=
until [ "$selection" = "0" ]; do
    echo "
    DEVOPS TOOLS INSTALL MENU
    1 - Show me what I have installed already
    2 - Install Terraform (12, 13, 14)
    3 - Install kubectl
    4 - Install Helm 3
    5 - Install Stern
    6 - Install Operator SDK
    7 - Install Tools (tflint, terragrunt, astro, tvm, tfk8s)
    8 - Install Istio (istioctl)
    9 - Install awscli (AWS)
   10 - Install az (Azure)
   11 - Install gotop

    0 - exit program
"
    echo -n "Enter selection: "
    read selection
    echo ""
    case $selection in
        1 ) ls -altr $HOME/bin ; press_enter ;;
        2 ) terraform_install ; press_enter ;;
        3 ) kubectl_install ; press_enter ;;
        4 ) helm_install ; press_enter ;;
        5 ) stern_install ; press_enter ;;
        6 ) operator_install ; press_enter ;;
        7 ) tools_install ; press_enter ;;
        8 ) istio_install ; press_enter ;;
        9 ) aws_install ; press_enter ;;
       10 ) azure_install ; press_enter ;;
       11 ) gotop_install ; press_enter ;;
        0 ) exit ;;
        * ) echo "Please enter 1, 2,3,4 or 0"; press_enter
    esac
done
}
