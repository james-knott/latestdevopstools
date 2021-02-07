#!/bin/bash

# BEGIN: Read functions from bash-common-helpers library.
if [[ -z "${OSDP}" ]]; then
  echo "Required environment variable is not set: OSDP"
  exit 1
fi
if [[ ! -f "${OSDP}" ]]; then
  echo "Required file does not exist: ${OSDP}"
  exit 2
fi
source "${OSDP}"


press_enter()
{
    echo -en "\nPress Enter to continue"
    read
    clear
}
clear
SELECTION=
until [ "$SELECTION" = "0" ]; do
    echo "
    OPEN SOURCE DEVOPS PLATFORM MENU
    --------------------------------

    1 - Display Disk usage for projects
    2 - Display Free Memory
    3 - DevOps Tools Menu
    0 - Exit OSDP
"
    echo -n "Enter selection: "
    read selection
    echo ""
    case $selection in
        1 ) disk_space_info ; press_enter ;;
        2 ) free ; press_enter ;;
        3 ) devops_tools_menu ; press_enter ;;
        0 ) exit ;;
        * ) echo "Please enter 1, 2, or 0"; press_enter
    esac
done
