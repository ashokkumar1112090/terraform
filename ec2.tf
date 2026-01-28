resource "aws_instance" "terraform" {
  ami           = "ami-0220d79f3f480ecf5"
  vpc_security_group_ids = [aws_security_group.allow-all.id] # we get key by google for arguments then for this ec2-instance....use below sg id
  instance_type = "t3.micro"

  tags = {
    Name = "terraform"
    Terraform = "true"
  }
}

resource "aws_security_group" "allow-all" {
  name   = "allow-all"
  egress {
    from_port        = 0   #from port 0 to port  0 means all ports allowed
    to_port          = 0
    protocol         = "-1"   #all protocols
    cidr_blocks      = ["0.0.0.0/0"]

  }
  egress {
    from_port        = 0   #from port 0 to port  0 means all ports allowed
    to_port          = 0
    protocol         = "-1"   #all protocols
    cidr_blocks      = ["0.0.0.0/0"] #internet

  }
  tags = {    #sec grp tags dont confuse with before resource tages
    Name = "allow-all"
}

}