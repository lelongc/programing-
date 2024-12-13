#!/bin/bash

##
# 2018 Bobby I. <bobby@bobbyiliev.com>
# Script that summarizes your access logs
# This includes:
# - POST requests
# - GET requests
# - IP logs and their geo location
##

########################
### Color  Variables ###
########################
green='\e[32m'
blue='\e[34m'
clear='\e[0m'
orange='\e[33m'
red='\e[31m'

#########################
###  Color Functions  ###
#########################

ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}
ColorRed(){
	echo -ne $red$1$clear
}
ColorOrange(){
	echo -ne $orange$1$clear
}

###########################################################################
## GeoIP domain                                                          ##
## Uses our own GEO location API script to get the country code of an IP ##
## The connection goes though HTTPS                                      ##
## To disable the GEO location check set the value to 0                  ##
###########################################################################

geoipdomain="https://bobbyiliev.com/ip.php"

#################
## Apache logs ##
#################

function access_log_summary() {

	# The log is the first argument
	log=${1}
	if [[ $log ]] ; then
	       	# Check if the log is empty
		if [[ $(cat $log  2>/dev/null | wc -l ) -lt 1 ]]; then
			echo ""
        	       	echo $(ColorOrange "    Empty log or does not exist");
		        echo $(ColorGreen "    Specify the log file that you want to summarize");
		        echo $(ColorOrange "    Example:");
		        echo $(ColorOrange "        ./spike_check your_log");
			echo ""
               		exit 0
	       	fi

		echo ""
                echo $(ColorOrange "Summarizing log..")
		echo $(ColorOrange "This might take a while depending on the size of the log")
                echo ""
	                echo $(ColorGreen "Top 20 GET requests: ")
			sleep 1
			cat $log 2>/dev/null | grep -v 'ftp.' | grep GET | cut -d\" -f2 | awk '{print $1 " " $2}' | cut -d? -f1 | sort | uniq -c | sort -n | sed 's/[ ]*//' | tail -20 |  sed  's/^ *//g' | column -s '' -s ' ' -t
			sleep 1
			echo ""
			echo $(ColorGreen "Most Recent top 20 GET requests: ")
			sleep 1
			tail -n 1000 $log 2>/dev/null | grep -v 'ftp.' | grep GET | cut -d\" -f2 | awk '{print $1 " " $2}' | cut -d? -f1 | sort | uniq -c | sort -n | sed 's/[ ]*//' | tail -20  | sed  's/^ *//g' | column -s '' -s ' ' -t
			sleep 1
                	echo ""
	                echo $(ColorGreen "Top 20 POST requests for: ")
			sleep 1
			cat $log 2>/dev/null | grep -v 'ftp.' | grep POST | cut -d\" -f2 | awk '{print $1 " " $2}' | cut -d? -f1 | sort | uniq -c | sort -n | sed 's/[ ]*//' | tail -20  | sed  's/^ *//g' | column -s '' -s ' ' -t
			sleep 1
	                echo ""
        		echo $(ColorGreen "Most Recent top 20 POST requests: ")
			sleep 1
			tail -n 1000 $log 2>/dev/null | grep -v 'ftp.' | grep POST | cut -d\" -f2 | awk '{print $1 " " $2}' | cut -d? -f1 | sort | uniq -c | sort -n | sed 's/[ ]*//' | tail -20  | sed  's/^ *//g' | column -s '' -s ' ' -t
			sleep 1
			echo ""
		        echo $(ColorGreen "Top 20 IP addresses that have been accessing your site: ")
			sleep 1
		        echo "Do you want geo location check for the IPs? [yes/no]"
        		read geo
        	        if [[ $geo == 'yes' ]] ; then
                	        oIFS="$IFS"
                        	IFS=$'\n'
	                        for ips in $(cat $log 2>/dev/null | awk  '{print $1}' |sort | uniq -c | sort -rn | head -20 | sed  's/^ *//g' | column -s '' -s ' ' -t); do
        	                           IFS=' '
                	                   array=($ips)
                        	           hits="${array[0]}"
                                	   ip="${array[1]}"
					if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
		                                location=$(curl ${geoipdomain}?ip=$ip 2>/dev/null)
	        	                        echo $hits - $ip - $location | sed  's/^ *//g' | column -s '-' -t
					fi
                	                unset location
                        	done
	                        IFS="$oIFS"
        	        else
                	        cat $log 2>/dev/null | awk '{print $1}' |sort | uniq -c | sort -rn | head -20 | sed  's/^ *//g' | column -s ' ' -s ' ' -t
	                fi
			echo ""
		        echo $(ColorGreen "Most Recent top 20 IP addresses: ")
			if [[ $geo == "yes" ]] ; then
        	                oIFS="$IFS"
	                        IFS=$'\n'
        	                for ips in $(tail -n 1000 $log 2>/dev/null | awk  '{print $1}' |sort | uniq -c | sort -rn | head -20  | sed  's/^ *//g' | column -s '' -s ' ' -t); do
                	                   IFS=' '
                        	           array=($ips)
                                	   hits="${array[0]}"
	                                   ip="${array[1]}"
					if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        		                        location=$(curl ${geoipdomain}?ip=$ip 2>/dev/null)
	                	                echo $hits - $ip - $location | sed  's/^ *//g' | column -s '-' -t
					fi
                        	        unset location
	                        done
        	                IFS="$oIFS"
                	else
	                       	tail -n 1000 $log 2>/dev/null | awk '{print $1}' |sort | uniq -c | sort -rn | head -20 | sed  's/^ *//g' | column -s '' -s ' ' -t
        	        fi
		else
			echo ""
	                echo $(ColorGreen "No log found..");
			sleep 1
		fi
                echo $(ColorRed "########## END log ###########");
}

if [[ -z $1 ]] ; then
	echo ""
	echo $(ColorGreen "    This script summarizes your access logs, optimized for Apache");
	echo ""
	echo $(ColorGreen "    Specify the log that you want to summarize..");
	echo $(ColorOrange "    Example:");
	echo $(ColorOrange "        ./spike_check your_log");
	echo ""
else
	access_log_summary $1
fi
