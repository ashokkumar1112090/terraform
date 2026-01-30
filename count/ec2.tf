resource "aws_instance" "terraform" {
  # count = 4                  #total block loop 10 times
  count = length(var.instances)  #length here functions var.instances is input
  ami           = "ami-0220d79f3f480ecf5"
  vpc_security_group_ids = [aws_security_group.allow-all.id] # we get key by google for arguments then for this ec2-instance....use below sg id
  instance_type = "t3.micro"     # in vpc line first create sg then next line inst type this is auto dependency

  tags = {
    Name = var.instances[count.index]  #count.index is a spec varab that starts with 0 and works well in list 
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
  ingress {
    from_port        = 0   #from port 0 to port  0 means all ports allowed
    to_port          = 0
    protocol         = "-1"   #all protocols
    cidr_blocks      = ["0.0.0.0/0"] #internet

  }
  tags = {    #sec grp tags dont confuse with before resource tages
    Name = "allow-all"
}

}