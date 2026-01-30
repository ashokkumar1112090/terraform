resource "aws_instance" "terraform" {
  ami           = var.ami_id
  vpc_security_group_ids = [aws_security_group.allow-all.id] # we get key by google for arguments then for this ec2-instance....use below sg id
  instance_type = var.instance_type     # in vpc line first create sg then next line inst type this is auto dependency

  tags = var.ec2_tags
}

resource "aws_security_group" "allow-all" {
  name   = var.sg_name
  egress {
    from_port        = var.egress_from_port #from port 0 to port  0 means all ports allowed
    to_port          = var.egress_to_port 
    protocol         = var.protocol   #all protocols
    cidr_blocks      = var.cidr

  }
  ingress {
    from_port        = var.ingress_from_port #from port 0 to port  0 means all ports allowed
    to_port          = var.ingress_to_port
    protocol         = var.protocol   #all protocols
    cidr_blocks      = var.cidr #internet

  }
  tags = {    #sec grp tags dont confuse with before resource tages
    Name = "allow-all"
}

}