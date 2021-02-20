#!/bin/bash

# version
version=1.0

# banner
echo """
  _|_|_  _   .|| _  _  _ |_  _  _|  _  _
   | | |(/_\/|||(_|(_|(/_| |(_|(_|<(/_| 
                    _|                  
          ------------------          
       ~ |Do Hacks to Secure| ~
          ------------------
  https://twitter.com/thevillagehackr

    Hey don't miss this version $version

    """

#spinner
spinner ()
{
    bar="+++++++++++++++++++++++++++++++++++++++++++"
    barlength=${#bar}
    i=0
    while ((i <100)); do
        n=$((i*barlength / 100))
        printf "\033[1;95m\r%-${bar}s\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.01
        printf " "
    done  
    printf "\n"
}

#Date
printf "\033[1;93m"
now="$(date)"
echo "Date: "$now""
printf "\033[0m"

#calling spinner
echo -e "   "
echo "Initiating Ping request to all Targets"
echo -e "   "
spinner
sleep 0.01

#check file and get data to ping
cat $1 |  while read output
do
    ping -c 1 "$output" > /dev/null
    if [ $? -eq 0 ]; then
    echo -e "\033[0;92m  [+] node [$output] is \033[0;92m up \033[0;92m "
    echo -e "\033[0m "
    else
    echo -e "\033[0;91m  [-] node $output is \033[0;91m down \033[0;91m "
    echo -e " \033[0m "
    fi
done
echo "All done"
