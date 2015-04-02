#!/bin/bash

USER=$1

cat > bin/ovpn-init <<EOF
ssh -t -i ssh/insecure-deployer \
"ubuntu@\$(terraform output nat.ip)" \
sudo docker run --volumes-from ovpn-data --rm -it gosuri/openvpn ovpn_initpki
EOF

chmod +x bin/ovpn-init 
bin/ovpn-init

cat > bin/ovpn-start <<EOF
ssh -t -i ssh/insecure-deployer \
"ubuntu@\$(terraform output nat.ip)" \
sudo docker run --volumes-from ovpn-data -d -p 1194:1194/udp --cap-add=NET_ADMIN gosuri/openvpn
EOF

chmod +x bin/ovpn-start
bin/ovpn-start

cat > bin/ovpn-new-client <<EOF
ssh -t -i ssh/insecure-deployer \
"ubuntu@\$(terraform output nat.ip)" \
sudo docker run --volumes-from ovpn-data --rm -it gosuri/openvpn easyrsa build-client-full "\${1}" nopass
EOF

chmod +x bin/ovpn-new-client
# generate a configuration for your user
bin/ovpn-new-client $USER

cat > bin/ovpn-client-config <<EOF
ssh -t -i ssh/insecure-deployer \
"ubuntu@\$(terraform output nat.ip)" \
sudo docker run --volumes-from ovpn-data --rm gosuri/openvpn ovpn_getclient "\${1}" > "\${1}-airpair-example.ovpn"
EOF

chmod +x bin/ovpn-client-config
bin/ovpn-client-config $USER