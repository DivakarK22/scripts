

curl -L https://bootstrap.saltstack.com -o install_salt.sh

sh install_salt.sh -P -M

cat <<EOF > /etc/salt/master
interface: 192.168.0.161
EOF

systemctl start salt-master.service
systemctl enable salt-master.service

firewall-cmd --get-active-zones

firewall-cmd --permanent --zone=public --add-port=4505-4506/tcp

firewall-cmd --reload



