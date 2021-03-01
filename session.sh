#!/bin/bash
function pilih(){
    printf "\e[1;34mType \e[1;31m ctrl+d \e[1;0m or \e[1;31mexit\e[1;33m for \e[1;31mkill \e[1;32msession\e[1;0m"
    printf "\n\e[1;36m1.\e[1;31m  Create Session\n\e[1;36m2. \e[1;31m Open Session\n"
    while true
    do
        printf "\e[1;36mPILIH :\e[1;0m"
        read pi
        if [[ $pi == "1" ]] || [[ $pi == "01" ]]; then
            printf "Session Name : "
            read ses
            byobu new-session -s $ses "neofetch&&bash login.sh && bash"
        elif [[ $pi == "2" ]] || [[ $pi == "02" ]]; then
            printf "Session Name : "
            read ses
            byobu attach -t $ses
        else
        continue
        fi

    done 
}
pilih