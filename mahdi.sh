red() {
  printf '\e[1;31m%s\n\e[0;39;49m' "$@"
}
green() {
  printf '\e[1;32m%s\n\e[0;39;49m' "$@"
}
brown() {
  printf '\e[1;33m%s\n\e[0;39;49m' "$@"
}
brown "Installing Packages ... !"
sudo apt-get -y update && sudo apt-get -y upgrade 
sudo apt-get --force-yes install git wget screen tmux libconfig9 libevent-dev libjansson4 libstdc++6 lua-socket lua5.2 liblua5.2 make unzip redis-server software-properties-common g++
sudo apt-get -y update && sudo apt-get -y upgrade
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test && sudo apt-get update && sudo apt-get install -y gcc-4.9 g++-4.9 && sudo update-alternatives —install /usr/bin/gcc gcc /usr/bin/gcc-4.9 60 —slave /usr/bin/g++ g++ /usr/bin/g++-4.9
sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade && sudo apt-get -y autoremove
sudo service redis-server restart
sudo apt install cmake
sudo apt install libreadline-dev
sudo apt install liblua5.2-dev
sudo apt install libconfig++-dev
sudo apt install gperf
sudo apt install libssl-dev
green "End Installing Packages ."
brown "Clone Td BoT ..."
git clone --recursive https://github.com/AaBibak/tdbot
chmod +x tdbot/td/src.sh
sleep 5 
cd tdbot
brown "Edit Telegram.h ..."
red "Inter Your Api hash :" 
read -rp ' ' APIHASH
sed -i 's/APIHASH/'$APIHASH'/g' telegram.h
green "Done "$APIHASH" Saved !"
red "And Now Inter Your Api id :" 
read -rp ' ' APIID
sed -i 's/APIID/'$APIID'/g' telegram.h
green "Done "$APIID" Saved !"
red "And Now Inter Version Number (1 or 2 or 3 or ..)  :" 
read -rp ' ' VERSION
sed -i 's/NUMBER/'$VERSION'/g' telegram.h
green "Done "$VERSION" Saved !"
red "And Now Inter Your Name :" 
read -rp ' ' NAME
sed -i 's/NAME/'$NAME'/g' cliclient.cpp
green "Done "$NAME" Saved !"

green "End Edit"
brown "Compile Start ... !"
mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make
green "Compile Ended And telegram-bot Saved To tdbot/build"	
#cd build && mv telegram-bot /root/td
green "Good Luck :)"
