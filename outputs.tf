#output "app.0.ip" {
#  value = "${aws_instance.app.0.private_ip}"
#}

#output "app.1.ip" {
#  value = "${aws_instance.app.1.private_ip}"
#}

#output "consul.0.ip" {
#  value = "${aws_instance.consul.0.private_ip}"
#}

#output "master.0.ip" {
#  value = "${aws_instance.master.0.private_ip}"
#}

output "app-address" {
  #value = "${element(aws_instance.app.*.tags.Name, 0)} : ${element(aws_instance.app.*.private_ip, 0)}"
  value = "${join(",", aws_instance.app.*.private_ip)}"
}

output "nat.ip" {
  value = "${aws_instance.nat.public_ip}"
}

output "elb.hostname" {
  value = "${aws_elb.app.dns_name}"
}
