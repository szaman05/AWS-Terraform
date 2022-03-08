# Create EC2 Instance
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

resource "aws_instance" "Ansible-Control" {
  #ami               = "ami-047a51fa27710816e"
#Ubuntu Market Place Image for Ansible.
  ami               = "ami-0056dae7008bc574b"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "Ansible-Control"   
  }
}
resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.ansible-sg.id
  network_interface_id = aws_instance.Ansible-Control.primary_network_interface_id
}
