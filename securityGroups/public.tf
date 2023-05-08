resource "aws_security_group" "public_sg" {
  name        = "load_balancer_public"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc.id

  tags = {
    Name = "Erwin"
  }
}

resource "aws_security_group_rule" "http_ingress" {
  type              = "ingress"
  security_group_id = aws_security_group.public_sg.id
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_blocks       = [var.cidr_block]
  description       = "Allow incoming HTTP traffic"
}

resource "aws_security_group_rule" "https_ingress" {
  type              = "ingress"
  security_group_id = aws_security_group.public_sg.id
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_blocks       = [var.cidr_block]
  description       = "Allow incoming HTTP traffic"
}