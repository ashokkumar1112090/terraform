resource "aws_instance" "terraform" {
  ami           = local.ami_id
  vpc_security_group_ids = [aws_security_group.allow-all.id] # we get key by google for arguments then for this ec2-instance....use below sg id
  instance_type = local.instance_type    # in vpc line first create sg then next line inst type this is auto dependency
  tags = local.ec2_tags
   
}

resource "aws_security_group" "allow-all" {
  name   = "${local.common-name}-allow-all"
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
   
tags = merge(
    var.common-tags,
    {
      Name = "${local.common-name}-allow-all"
    }
  )
}