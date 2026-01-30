resource "aws_instance" "terraform" {
  ami           = "ami-0220d79f3f480ecf5"
  vpc_security_group_ids = [aws_security_group.allow-all.id] # we get key by google for arguments then for this ec2-instance....use below sg id
  instance_type = "t3.micro"     # in vpc line first create sg then next line inst type this is auto dependency

  tags = {
    Name = "terraform"
    Terraform = "true"

  }

  provisioner "local-exec"{
        command = "echo ${self.private_ip} > inventory"    #self bcz you are inside resource block
        on_failure = continue        #instance ouput can access here
  }

  provisioner "local-exec"{
      command = "echo Instance is destroyed"
      when    = destroy
    }



connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = self.public_ip
    }

    provisioner "remote-exec" {
      inline = [
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx"
      ]
    }

    provisioner "remote-exec" {
      inline = [
        "sudo systemctl stop nginx",
        "echo 'successfully stopped nginx server' "
      ]
      when = destroy
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