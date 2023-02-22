cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-eth0
TYPE=Ethernet
BOOTPROTO=none
#Server IP #
IPADDR=192.168.1.58
# Subnet #
PREFIX=24
# Set default gateway IP #
GATEWAY=192.168.1.1
# Set dns servers #
DNS1=192.168.1.1
DNS2=8.8.8.8
DNS3=8.8.4.4
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
# Disable ipv6 #
IPV6INIT=no
NAME=eth0
# This is system specific and can be created using 'uuidgen eth0' command #
DEVICE=eth0
ONBOOT=yes
UUID="436bd03f-284e-484e-aadc-3ebe9d60ac10"
EOF
cat <<EOF > /etc/hostname
testing
EOF
cat <<EOF > /etc/hosts
testing
192.168.1.55 salt
EOF
echo "updated all files"
sudo yum install git -y
cd $HOME
mkdir git
cd git
git clone https://github.com/DivakarK22/scripts.git
cd scripts/setups/
sudo bash installsaltMinion.sh
echo "Installed Salt-minion"
sudo systemctl restart salt-minion
cat <<EOF > /etc/ssh/sshd_config
HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key
SyslogFacility AUTHPRIV
PasswordAuthentication yes
ChallengeResponseAuthentication no
GSSAPIAuthentication yes
GSSAPICleanupCredentials no
UsePAM yes
X11Forwarding yes
UseDNS no
AcceptEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES
AcceptEnv LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT
AcceptEnv LC_IDENTIFICATION LC_ALL LANGUAGE
AcceptEnv XMODIFIERS
Subsystem       sftp    /usr/libexec/openssh/sftp-server
EOF
echo "all good"
sudo reboot