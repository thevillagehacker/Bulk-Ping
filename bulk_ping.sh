#!/bin/bash

# version
version=1.1

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
echo -e "\e[102m\033[1;97m Date: "$now"\033[0;37m"
echo -e "   "
echo -e "\e[41m\033[1;97m Initiating Ping probe... \033[0;37m"
echo -e "   "
sleep 0.5

#check file and get data to ping
cat $1 |  while read output
do
    echo -e "\e[40m\033[1;97m Sending ping request to \e[105m\033[1;97m [$output] \033[0;37m"
    echo "---------------------------------------------------"
    ping -c 1 "$output" > /dev/null
    if [ $? -eq 0 ]; then
    echo -e "\e[102m\033[1;97m [+] node [$output] is up \033[0;37m"
    echo " "
    else
    echo -e "\e[5m\e[41m\033[1;97m [-] node [$output] is down \033[0;37m"
    echo " "
    fi
done
echo -e "\e[45m\033[1;97m All done \033[0;37m"
