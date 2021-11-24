provider "aws" {
  region = var.region
}

resource "aws_lb" "lb-dp" {


  internal           = false
  load_balancer_type = var.lb-type
  dynamic "subnet_mapping" {
    for_each = var.subnet_mapping
    content {
      subnet_id = subnet_mapping.value


    }
  }


}


resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = aws_lb.lb-dp.arn

  port = var.lb-listener-port
  default_action {
    type             = var.listener-default-action
    target_group_arn = aws_lb_target_group.back.arn

  }
}

resource "aws_lb_listener_rule" "phpmyadmin" {
  listener_arn = aws_lb_listener.lb-listener.arn

  priority = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Front.arn
  }
  condition {
    path_pattern {
      values = ["/phpmyadmin/*"]
    }
  }
}


################# TARGET GROUP #################

resource "aws_lb_target_group" "Front" {

  port        = var.target-group-port
  protocol    = var.target-protocol
  target_type = var.target-type
  vpc_id      = var.lb-vpc-id


  health_check {
    interval            = 8
    path                = "/"
    protocol            = var.target-protocol
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2

  }

  tags = {
    Name = "${var.env} target group"
  }
}

resource "aws_lb_target_group" "back" {

  port        = var.target-group-port
  protocol    = var.target-protocol
  target_type = var.target-type
  vpc_id      = var.lb-vpc-id


  health_check {
    interval            = 8
    path                = "/"
    protocol            = var.target-protocol
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2

  }

  tags = {
    Name = "${var.env} target group"
  }
}

resource "aws_lb_target_group_attachment" "TG_back-A" {
  target_group_arn = aws_lb_target_group.back.arn
  target_id        = var.target_id
  port             = var.target-group-attachment-port

}


resource "aws_lb_target_group_attachment" "TG_back-B" {
  target_group_arn = aws_lb_target_group.back.arn
  target_id        = var.target_id
  port             = var.target-group-attachment-port
}

resource "aws_lb_target_group_attachment" "Target-B" {
  target_group_arn = aws_lb_target_group.Front.arn
  target_id        = var.target_id
  port             = var.target-group-attachment-port
}

resource "aws_lb_target_group_attachment" "Target-A" {
  target_group_arn = aws_lb_target_group.Front.arn
  target_id        = var.target_id
  port             = var.target-group-attachment-port
}


