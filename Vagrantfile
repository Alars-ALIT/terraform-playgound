$bootstrap = <<SCRIPT
apt-get update
apt-get install -y openvpn unzip
cd /tmp
#wget --no-check-certificate https://dl.bintray.com/mitchellh/terraform/terraform_0.3.7_linux_amd64.zip
#unzip terraform_0.3.7_linux_amd64.zip
#mv terra* /usr/local/bin

curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

SCRIPT


Vagrant.configure("2") do |config|
    config.vm.box = 'wheezy2'
	#config.vm.box_url = 'https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vmwarefusion.box'
	#config.vm.box_url = 'https://www.dropbox.com/s/gxouugzbnjlny1k/debian-7.0-amd64-minimal.box'
	#config.vm.box_url = 'https://github.com/kraksoft/vagrant-box-debian/releases/download/7.8.0/debian-7.8.0-amd64.box'
	config.vm.box_url = 'https://dl.dropboxusercontent.com/u/197673519/debian-7.2.0.box'
	
	config.vm.define "ovpn" do |master|
		master.vm.hostname = "ovpn"
		master.vm.network :private_network, ip: "10.1.1.8"
		master.vm.synced_folder ".", "/terraform"
		master.vm.provision :shell, inline: $bootstrap		
	end	
  end