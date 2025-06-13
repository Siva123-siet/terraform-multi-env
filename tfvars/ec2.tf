resource "aws_instance" "roboshop" {
  count = length(var.instances)
  ami           = "ami-09c813fb71547fc4f"
  instance_type = var.instance_type
  # vpc_security_group_ids = [aws_security_group.allow_all.id]
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = merge(
    var.common_tags,
  {
    Name = "${var.project}-${var.instances[count.index]}-${var.environment}"
    Component = var.instances[count.index]
    Environment = var.environment
  })
}

resource "aws_security_group" "allow_all" {
  name        = "${var.project}-${var.sg_name}-${var.environment}"
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
      Name = "${var.sg_name}-${var.environment}"
    }
  )
}