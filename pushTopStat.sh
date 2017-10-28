#CONSTANTS
date=$(date)
hour=$(date "+%H")

#SPEED-TEST
if (($hour%3==0))
then
    downloadStartTime=$(date "+%s")
    mkdir /media/pi/temp/$downloadStartTime
        wget -O /media/pi/temp/$downloadStartTime/speedtest.dat https://api.fast.com/netflix/speedtest?https=true
    downloadEndTime=$(date "+%s")
    downloadFileSize=$(du -h /media/pi/temp/$downloadStartTime/speedtest.dat | cut -f1)
    downloadTime=$((dowloadEndTime - downloadStartTime))
echo "{\"start\":\"$downloadStartTime\",\"end\":\"$downloadEndTime\",\"size\":\"$downloadFileSize\",\"time\":\"$downloadTime\"}" > speedTest.json
fi

#TOP
(top -n 1 -b | head -n 20) > top.txt

#Pihole API
curl http://pi.hole/admin/api.php  > piholeAPI.json

#RPI STATS
temp=$(vcgencmd measure_temp)
tempOutput="{\"date\":\"$date\",\"temp\":\"$temp\"}"
volt=$(vcgencmd measure_volts core)
voltOutput="{\"date\":\"$date\",\"volt\":\"$volt\"}"
echo "$tempOutput">temp.json
echo "$voltOutput">corevolts.json

#GIT 
git add .
git commit -m "RPI $date" --author "RPI Sukrit <>"
git push -u origin master
