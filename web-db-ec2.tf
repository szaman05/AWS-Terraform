resource "aws_instance" "web01" {
  #ami               = "ami-047a51fa27710816e"
#CentOS-7 Market Place Image for Web01.
  ami               = "ami-011939b19c6bd1492"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name = "ansible-clients"
  tags = {
    "Name" = "Web01"   
  }
}
resource "aws_network_interface_sg_attachment" "sg_attachment_web01" {
  security_group_id    = aws_security_group.web-db-sg.id
  network_interface_id = aws_instance.web01.primary_network_interface_id
}
resource "aws_instance" "db01" {
  #ami               = "ami-047a51fa27710816e"
#CentOS-7 Market Place Image for Db01.
  ami               = "ami-011939b19c6bd1492"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name = "ansible-clients"
  tags = {
    "Name" = "DB01"   
  }
}
resource "aws_network_interface_sg_attachment" "sg_attachment_db01" {
  security_group_id    = aws_security_group.web-db-sg.id
  network_interface_id = aws_instance.db01.primary_network_interface_id
}
