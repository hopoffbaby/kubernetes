# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# find free addresses that arent in the dhcp range
nmap -v -sn -n 192.168.1.0/24 -oG - | awk '/Status: Down/{print $2}'
