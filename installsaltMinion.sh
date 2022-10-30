curl -L https://bootstrap.saltstack.com -o install_salt.sh

sh install_salt.sh -P

cat <<EOF > /etc/salt/minion_id
$HOSTNAME
EOF

systemctl start salt-minion.service

systemctl enable salt-minion.service