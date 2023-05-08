resource "aws_lb_target_group" "webserver_tg" {
  name     = "webserverTargetGroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc.id
}

resource "aws_lb" "webserver_alb" {
  name               = "webserverAlb${var.lab_name}"
  load_balancer_type = "application"
  internal           = false
  subnets            = [var.public_subnet_a.id, var.public_subnet_b.id]
  security_groups    = [var.public_sg.id]
}

resource "aws_lb_listener" "listener_80_webserver" {
  load_balancer_arn = aws_lb.webserver_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webserver_tg.arn
  }
}