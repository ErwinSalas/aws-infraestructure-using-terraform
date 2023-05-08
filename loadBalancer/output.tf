output "webserver_tg_arn" {
  value = aws_lb_target_group.webserver_tg.arn
}

output "webserver_alb" {
  value = aws_lb.webserver_alb
}