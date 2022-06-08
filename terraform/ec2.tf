data "aws_ami" "ubuntu1" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
resource "aws_instance" "ec2" {
  ami = data.aws_ami.ubuntu1.id #ubuntu
  instance_type = "t2.micro"
  key_name = aws_key_pair.public_key.key_name

  network_interface {
    network_interface_id = aws_network_interface.nic-ec2.id
    device_index         = 0
  }

  tags = {
    Name = "private-instance"
  }

}

resource "aws_network_interface" "nic-ec2" {
  subnet_id       = module.network.private-subnet-01-id
  private_ips     = ["10.0.1.20"]
  security_groups = [aws_security_group.sgr-ssh-8000.id]

}

