locals {
    instance_type = "t3.micro"
    common-name = "${var.project}-${var.environment}"  #roboshop-dev
    ami_id = data.aws_ami.joindevops.id
    ec2_tags = merge(
    var.common-tags,
    {
      Name = "${local.common-name}-local-demo"
    }
  )
}
