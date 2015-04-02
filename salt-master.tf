/* App servers */
resource "aws_instance" "master" {
  count = 1
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.private.id}"
  private_ip = "${var.salt_master}"
  security_groups = ["${aws_security_group.default.id}"]
  key_name = "${aws_key_pair.deployer.key_name}"
  #source_dest_check = false
  user_data = "${file(\"cloud-config/salt-master.yml\")}"
  tags = { 
    Name = "${var.project}-master-${count.index}"    
  }
  /*
  provisioner "remote-exec" {
    inline = [
      "sudo sh -c \"echo 'master' > /etc/hostname\"",
      "sudo hostname `cat /etc/hostname`",
      "sudo sh -c  \"echo '${aws_instance.master.0.private_ip} master' >> /etc/hosts\""
    ]
  }
  */
}

/* Load balancer 
resource "aws_elb" "consul" {
  name = "${var.project}-consul-elb"
  subnets = ["${aws_subnet.public.id}"]
  security_groups = ["${aws_security_group.default.id}", "${aws_security_group.web.id}"]
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  instances = ["${aws_instance.app.*.id}"]
}
*/
