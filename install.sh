#!/bin/bash

#update repo
apt update 
clear
#install figlet
apt install -y figlet 

clear

#install softether requirement
figlet installing requirement
sleep 5
apt install -y build-essential make gcc zlib1g-dev libreadline-dev libncurses-dev libssl-dev
clear


#install softether - start
figlet installing softether
# download softether
wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.38-9760-rtm/softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
#extart file
tar xzf softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
# compiling softether
cd vpnserver/
make
cd ..
clear
# move to new dir 
mv vpnserver /usr/local
cd /usr/local/vpnserver/
# get file permission
chmod 600 *
chmod 700 vpnserver vpncmd
# start server
/usr/local/vpnserver/vpnserver start
# enable ip4 forward
ln -s /usr/local/vpnserver/vpnserver /usr/bin/vpnserver
ln -s /usr/local/vpnserver/vpncmd /usr/bin/vpncmd
echo net.ipv4.ip_forward = 1 | ${SUDO} tee -a /etc/sysctl.conf
# create vpn server service
sudo cat >> /lib/systemd/system/vpnserver.service << EOF
[Unit]

Description=SoftEther VPN Server

After=network.target

[Service]

Type=forking

ExecStart=

ExecStart=/usr/local/vpnserver/vpnserver start

ExecStop=/usr/local/vpnserver/vpnserver stop

[Install]

WantedBy=multi-user.target

EOF
systemctl start vpnserver.service

systemctl enable vpnserver.service

/usr/local/vpnserver/vpncmd

clear
figlet finish
echo "samsesh"
#install softether - end

echo "now run vpncmd and select ro service then for set password on use this command on vpncmd ServerPasswordSet"

