#!/bin/bash
# cd ~ && wget -N https://raw.githubusercontent.com/Elkmar/ALQO-Masternodes/master/update_binary.sh -O update_binary.sh && chmod +x update_binary.sh && ./update_binary.sh
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;36m'
NC='\033[0m'

    echo
    echo -ne "${BLUE}Updating Wallet${NC}"
    echo
    echo -ne "${GREEN} >Progress: ${BLUE}[###-----------]\r"
    cd ~
    mkdir ALQO
    mkdir build
    cd build
    git clone https://github.com/ALQO-Universe/ALQO.git  > /dev/null 2>&1
    echo -ne "${GREEN} >Progress: ${BLUE}[#####---------]\r"
    cd ALQO
    ./autogen.sh  > /dev/null 2>&1
    echo -ne "${GREEN} >Progress: ${BLUE}[#######-------]\r"
    ./configure --without-gui --disable-tests  > /dev/null 2>&1
    echo -ne "${GREEN} >Progress: ${BLUE}[##########----]\r"
    make  > /dev/null 2>&1
    echo -ne "${GREEN} >Progress: ${BLUE}[##############]${NC}"
    cd ~/alqo/ALQO-v6.4.0.0-7d5f56499-lin64
    echo -ne "${BLUE}Stopping old Wallet${NC}"
    ./alqo-cli stop
    sleep 10
    rm -rf alqod
    rm -rf alqo-cli
    cd ~/ALQO
    mv ~/build/ALQO/src/alqod ~/ALQO
    mv ~/build/ALQO/src/alqo-cli ~/ALQO
    echo -ne "${BLUE}Starting new Wallet${NC}"
    cd 
    ./alqod -daemon