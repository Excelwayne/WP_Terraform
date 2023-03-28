
# Create an EC2 instance for Wordpress

resource "aws_instance" "Ec2_Wordpress" {
  ami           = "ami-0df24e148fdb9f1d8"
  instance_type = "t3.micro"
  key_name      = "vockey"
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.allow_http_access.id, aws_security_group.allow_ssh.id, aws_security_group.allow_ssh_aurora.id]
  subnet_id     = "${aws_subnet.public_subnet.id}"
  user_data = "${file("install_wp.sh")}"
  

  tags = {
    Name = "Wordpress"
  }
} 



