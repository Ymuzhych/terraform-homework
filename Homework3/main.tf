resource "aws_key_pair" "tfhomework" {
  key_name   = "homeworktf"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "instance1" {
  ami = data.aws_ami.linux2.id
  instance_type = "t2.micro"
  key_name = aws_key_pair.tfhomework.key_name
  availability_zone = "us-east-2a"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")
  
tags = {
  Name = "web1"
  }
}
resource "aws_instance" "instance2" {
  ami = data.aws_ami.linux2.id
  instance_type = "t2.micro"
  key_name = aws_key_pair.tfhomework.key_name
  availability_zone = "us-east-2b"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")
  
  tags = {
  Name = "web2"
  }
}

resource "aws_instance" "instance3" {
  ami = data.aws_ami.linux2.id
  instance_type = "t2.micro"
  key_name = aws_key_pair.tfhomework.key_name
  availability_zone = "us-east-2c"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")
  tags = {
  Name = "web3"
  }
}
  
  data "aws_ami" "linux2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
  }