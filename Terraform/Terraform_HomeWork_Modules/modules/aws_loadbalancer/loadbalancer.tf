resource "aws_lb" "Balancer" {

  name               = var.dp-lb-name
  internal           = false
  load_balancer_type = var.dp-lb-type
  security_groups    = [aws_security_group.SG_WEB.id]

  subnets = ["${aws_subnet.Public_subnet_A.id}", "${aws_subnet.Public_subnet_B.id}"]


}



resource "aws_lb_listener" "front" {
  load_balancer_arn = aws_lb.Balancer.arn
  port              = var.dp-lb-listener-port
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Front.arn
  }
}

resource "aws_lb_listener_rule" "phpmyadmin" {
  listener_arn = aws_lb_listener.front.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.back.arn
  }
  condition {
    path_pattern {
      values = ["/phpmyadmin/*"]
    }
  }
}



