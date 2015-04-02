resource "aws_key_pair" "deployer" {
  key_name   = "deployer-${var.project}-key" 
  public_key = "${file(\"ssh/insecure-deployer.pub\")}"
}

