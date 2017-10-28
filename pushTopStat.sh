#CONSTANTS
date=$(date)

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
git commit -m "TOP STAT" --author "RPI Sukrit <>"
git push -u origin master
