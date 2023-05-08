resource "aws_security_group" "private_sg" {
  name        = "private_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc.id

  tags = {
    Name = "Erwin"
  }
}


resource "aws_security_group_rule" "ssh_ingress" {
  type                     = "ingress"
  security_group_id        = aws_security_group.private_sg.id
  protocol                 = "tcp"
  from_port                = 22
  to_port                  = 22
  source_security_group_id = aws_security_group.bastion_sg.id
  description              = "Allow incoming SSH access from Bastion SG"
}

resource "aws_security_group_rule" "private_http_ingress" {
  type                     = "ingress"
  security_group_id        = aws_security_group.private_sg.id
  protocol                 = "tcp"
  from_port                = 80
  to_port                  = 80
  source_security_group_id = aws_security_group.public_sg.id
  description              = "Allow incoming HTTP traffic from prublic SG"
}

resource "aws_security_group_rule" "private_https_ingress" {
  type                     = "ingress"
  security_group_id        = aws_security_group.private_sg.id
  protocol                 = "tcp"
  from_port                = 443
  to_port                  = 443
  source_security_group_id = aws_security_group.public_sg.id
  description              = "Allow incoming HTTPs traffic from prublic SG"
}