resource "aws_key_pair" "homework" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
  
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  count = var.instance_count

}