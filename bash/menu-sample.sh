# we will write a script that would gather some useful information about our server like:

# Current Disk usage
# Current CPU usage
# Current RAM usage
# Check the exact Kernel version
# ----------------------------------------

# Script that returns the current server status
#!/bin/bash

server_name=$(hostname)
echo $server_name
# BASH script that checks:
#   - Memory usage
#   - CPU load
#   - Number of TCP connections
#   - Kernel version

function memory_check() {
    echo "----------------------------------------------------"
    echo "Memory usage on ${server_name} is: "
    free -h
    echo ""
}

function cpu_check() {
    echo "----------------------------------------------------"
    echo "CPU load on ${server_name} is: "
 
    uptime
    echo ""
}

function tcp_check() {
    echo "----------------------------------------------------"
    echo "TCP connections on ${server_name}: "
 
    cat  /proc/net/tcp | wc -l
    echo ""
}

function kernel_check() {
    echo "----------------------------------------------------"
    echo "Kernel version on ${server_name} is: "

    uname -r
    echo ""
}

function all_checks() {
    memory_check
    cpu_check
    tcp_check
    kernel_check
}

all_checks

# ------------------------
##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

##
# Color Functions
##

ColorGreen(){
    echo -ne $green$1$clear
}
ColorBlue(){
    echo -ne $blue$1$clear
}

# echo -ne $(ColorBlue 'Some text here')
# echo -ne $(ColorGreen 'Some text here')

# menu 
menu(){
echo -ne "
    My First Menu
    $(ColorGreen '1)') Memory usage
    $(ColorGreen '2)') CPU load
    $(ColorGreen '3)') Number of TCP connections
    $(ColorGreen '4)') Kernel version
    $(ColorGreen '5)') Check All
    $(ColorGreen '0)') Exit
    $(ColorBlue 'Choose an option:') "
            read a
            case $a in
                1) memory_check ; menu ;;
                2) cpu_check ; menu ;;
                3) tcp_check ; menu ;;
                4) kernel_check ; menu ;;
                5) all_checks ; menu ;;
                0) exit 0 ;;
                *) echo -e $red"Wrong option."$clear; WrongCommand;;
            esac
}
# Call the menu function
menu
