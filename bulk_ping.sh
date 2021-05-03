#!/bin/bash

# version
version=1.2

# banner
echo """
██████╗░██╗░░░██╗██╗░░░░░██╗░░██╗  ██████╗░██╗███╗░░██╗░██████╗░
██╔══██╗██║░░░██║██║░░░░░██║░██╔╝  ██╔══██╗██║████╗░██║██╔════╝░
██████╦╝██║░░░██║██║░░░░░█████═╝░  ██████╔╝██║██╔██╗██║██║░░██╗░
██╔══██╗██║░░░██║██║░░░░░██╔═██╗░  ██╔═══╝░██║██║╚████║██║░░╚██╗
██████╦╝╚██████╔╝███████╗██║░╚██╗  ██║░░░░░██║██║░╚███║╚██████╔╝
╚═════╝░░╚═════╝░╚══════╝╚═╝░░╚═╝  ╚═╝░░░░░╚═╝╚═╝░░╚══╝░╚═════╝░

                        By

          _|_|_  _   .|| _  _  _ |_  _  _|  _  _
           | | |(/_\/|||(_|(_|(/_| |(_|(_|<(/_|
                            _|
                  ------------------
               ~ |Do Hacks to Secure| ~
                  ------------------
            https://twitter.com/thevillagehackr

              Hey don't miss this version $version
    """

#Date
printf "\033[1;93m"
now="$(date)"
echo -e "\e[45m\033[1;97m Date: "$now"\033[0;37m"
echo -e "   "

# Initiation bar
BAR='Initiating Ping probe...'
init_bar() {  
    for i in {1..30}; do
        echo -ne "\e[41m\033[1;97m \r${BAR:0:$i} \033[0;37m" 
        sleep 0.01                 
    done
    echo " "
}
init_bar
sleep 0.5
echo " "

#check file and get data to ping
Ping ()
{
  mkdir results
  cat $tar |  while read output
  do
    echo -e "\e[40m\033[1;97m Sending Ping request to \e[105m\033[1;97m $output \033[0;37m"
    echo "---------------------------------------------------"
    ping -c 1 "$output" > /dev/null
    if [ $? -eq 0 ]; then
    echo -e "\e[42m\033[1;97m [+] node [$output] is up \033[0;37m" 
    echo "$output" >>results/tmp1.txt
    cat results/tmp1.txt | sort -u >results/up.txt
    echo " "
    else
    echo -e "\e[5m\e[41m\033[1;97m [-] node [$output] is down \033[0;37m"
    echo "$output" >>results/tmp2.txt
    cat results/tmp2.txt | sort -u >results/down.txt
    echo " "
    fi
done
cd results
rm tmp1.txt tmp2.txt
echo -e "\e[41m\033[1;97m Removed Temporary files...\033[0;37m"
echo " "
echo -e "\e[45m\033[1;97m All done \033[0;37m"
}

# Validate input
if [ $# -eq 0 ]
then
    echo -e "\e[5m\e[41m\033[1;97m No target files supplied \033[0;37m"
    exit -1
else
    tar=$1
    Ping
fi
