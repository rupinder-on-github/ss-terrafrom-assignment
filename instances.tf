resource "aws_instance" "bastion-instance" {
  ami           = var.instance-ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-subnet.id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  key_name = "terraform"

  tags = {
    Name = "bastion-instance"
  }
}

resource "aws_instance" "private-instance" {
  ami           = var.instance-ami
  instance_type = "t2.micro"

  subnet_id = aws_subnet.private-subnet.id

  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  key_name = "terraform"
  user_data = file("install_tomcat.sh")
  
  tags = {
    Name = "private-instance"
  }
}

#resource "aws_key_pair" "mykeypair" {
#  key_name   = "mykeypair"
#  public_key = file(var.key_path)
#}

output "Private_IP_Tomcat_Host" {
    value = aws_instance.private-instance.private_ip
}
output "Public_IP_Bastion_host" {
    value = aws_instance.private-instance.public_ip
}
output "AMI_USED_in_Bastion_Host" {
    value = aws_instance.private-instance.ami
}
output "AMI_USED_in_Tomcat_Host" {
    value = aws_instance.bastion-instance.ami 
}
