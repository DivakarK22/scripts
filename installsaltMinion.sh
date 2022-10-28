curl -L https://bootstrap.saltstack.com -o install_salt.sh

sh install_salt.sh -P

cat <<EOF > /etc/salt/minion_id
master: 192.168.1.61
EOF

systemctl start salt-minion.service

systemctl enable salt-minion.service