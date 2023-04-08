## softehter installer on ubuntu

- one command installer
``` bash
git clone https://github.com/samsesh/softether-install && cd softether-install &&  bash install.sh
```
- install use tmux on one command 
``` bash
tmux new -s softetherInstaller "git clone https://github.com/samsesh/softether-install && cd softether-install &&  bash install.sh"
```
# fisrt run
- start service 
``` bash
service vpnserver start
```
-now run
``` bash
/usr/local/vpnserver/vpncmd
```
- and select ro service then for set password on use this command on 
``` bash
/usr/local/vpnserver/vpncmd ServerPasswordSet
```
