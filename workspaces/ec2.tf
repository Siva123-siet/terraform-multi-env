resource "aws_instance" "roboshop" {
  count = length(var.instances)
  ami           = "ami-09c813fb71547fc4f"
  instance_type = lookup(var.instance_type,terraform.workspace)
  # vpc_security_group_ids = [aws_security_group.allow_all.id]
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = merge(
    var.common_tags,
  {
    Name = "${var.project}-${var.instances[count.index]}-${terraform.workspace}"
    Component = var.instances[count.index]
    Environment = terraform.workspace
  })
}

resource "aws_security_group" "allow_all" {
  name        = "${var.project}-${var.sg_name}-${terraform.workspace}"
  description = "allow all traffic"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project}-${var.sg_name}-${terraform.workspace}"
    }
  )
}