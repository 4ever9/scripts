sudo iptables -I INPUT -p tcp -m tcp --dport $1 -j ACCEPT
sudo service iptables save
sudo service iptables start
