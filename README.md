# NullWpsPinAuto
Simple bash script intended to exploit the Null Wps Pin breach automatically on all APs. Built for Kali Linux.

The script will scan APs using airodump-ng, filter WEP/OPN APs, exploit the Null Wps Pin breach for each AP and display the remaining time and APs. 

The results are displayed on screen and stored in results.txt

# Demo
![ScreenShot](https://gifyu.com/images/ezgif.com-resize10fe1f.gif)

# Requirements
This script requires the latest fork of [reaver-wps](https://github.com/t6x/reaver-wps-fork-t6x) and the latest version of [Wiire's Pixiewps](https://github.com/wiire/pixiewps) installed
```
apt-get -y install build-essential libpcap-dev aircrack-ng pixiewps && git clone https://github.com/t6x/reaver-wps-fork-t6x.git && cd reaver* && cd src && ./configure && sudo make install
```
# Download
```
git clone https://github.com/Emilien942702/NullWpsPinAuto
```
# Usage
```
cd NullWpsPinAuto/
sudo bash NullWpsPinAuto.sh
```
# Options
The script will ask you for the name of your wifi card, the APs scan duration, and the time per attack. Knowing that this attack is supposed to be really fast (~4 seconds) I recommend not more than 20 seconds for this option.

# Sources
[Reaver-WPS Arbitrary String](https://github.com/t6x/reaver-wps-fork-t6x/wiki/Introducing-a-new-way-to-crack-WPS:-Option--p-with-an-Arbitrary-String)

[0-day null PIN breach discovered by crakcdtv](http://www.crack-wifi.com/forum/topic-12166-0day-crack-box-sfr-nb6v-en-deux-secondes-par-pin-null.html)
