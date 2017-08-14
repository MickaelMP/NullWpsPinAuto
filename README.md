# NullWpsPinAuto
Simple bash script intended to exploit the NullWpsPinAuto breach on all close APs. Built for Kali Linux.

# Requirements
This script requires the latest fork of reaver-wps and the latest version of [Wiire's Pixiewps](https://github.com/wiire/pixiewps) installed
```
apt-get -y install build-essential libpcap-dev aircrack-ng pixiewps && git clone https://github.com/t6x/reaver-wps-fork-t6x.git && cd reaver* && cd src && ./configure && sudo make install
```
# Download
```
git clone https://github.com/Emilien942702/NullWpsPinAuto
```
# Usage
```
cd NullWpsPinAuto
sudo bash NullWpsPinAuto.sh
```
