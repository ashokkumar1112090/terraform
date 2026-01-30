resource "aws_route53_record" "roboshop" {
    count = 4
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}" #mongodb.ashokking.sbs #interpolation concept here . is string
  type    = "A"                                   # above iin doublequotes used varb so use dolllar
  ttl     = 1
  records = [aws_instance.terraform[count.index].private_ip]
  allow_overwrite = true
}