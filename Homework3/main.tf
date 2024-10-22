resource "aws_key_pair" "homework" {
  key_name   = "homework"
  public_key = file("~/.ssh/id_rsa.pub")
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
resource "aws_instance" "web" {
  count                  = 3
  ami                    = data.aws_ami.linux2.id
  instance_type          = "t2.micro"
  availability_zone      = var.zones[count.index]
  key_name               = aws_key_pair.homework.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data              = file("apache.sh")
  tags = {
    Name = var.name[count.index]
  }
}
