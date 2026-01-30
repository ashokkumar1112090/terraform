resource "aws_security_group" "roboshop-instance" {
  name   = "roboshop-strict-sg"
  egress {
    from_port        = 0   #from port 0 to port  0 means all ports allowed
    to_port          = 0
    protocol         = "-1"   #all protocols
    cidr_blocks      = ["0.0.0.0/0"]
  }


   dynamic "ingress" {
    for_each = toset(var.ingress_ports)
    content{
        from_port        = ingress.value # here ingress is special key word
        to_port          = ingress.value
        protocol         = "tcp" # -1 means all protocols
        cidr_blocks      = ["0.0.0.0/0"] # internet
    }
   }
   


  #block no equal....if = then it is called key value pair ..map
#   ingress {
#     from_port        = 22   #from port 0 to port  0 means all ports allowed
#     to_port          = 22
#     protocol         = "-1"   #all protocols
#     cidr_blocks      = ["0.0.0.0/0"] #internet

#   }

#   ingress {
#     from_port        = 8080   #from port 0 to port  0 means all ports allowed
#     to_port          = 8080
#     protocol         = "-1"   #all protocols
#     cidr_blocks      = ["0.0.0.0/0"] #internet

#   }

#   ingress {
#     from_port        = 3306   #from port 0 to port  0 means all ports allowed
#     to_port          = 3306
#     protocol         = "-1"   #all protocols
#     cidr_blocks      = ["0.0.0.0/0"] #internet

#   }

#   ingress {
#     from_port        = 80  #from port 0 to port  0 means all ports allowed
#     to_port          = 80
#     protocol         = "-1"   #all protocols
#     cidr_blocks      = ["0.0.0.0/0"] #internet

#   } 

  tags = {    #sec grp tags dont confuse with before resource tages
    Name = "roboshop-strict-sg"
}

}