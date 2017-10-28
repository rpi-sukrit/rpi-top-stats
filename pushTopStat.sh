(top -n 1 -b | head -n 20) > top.txt
curl http://192.168.0.100/admin/api.php  > piholeAPI.json
git add ./top.txt
git add ./piholeAPI.json
git commit -m "TOP STAT" --author "RPI Sukrit <>"
git push -u origin master
