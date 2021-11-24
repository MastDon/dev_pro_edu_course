resource "aws_lb_target_group" "Front" {
  #name        = "front_instances"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.DP-Edu.id


  health_check {
    interval            = 8
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2

  }

  tags = {
    Name = "TG_Front"
  }
}

resource "aws_lb_target_group" "back" {
  #name        = "front_instances"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.DP-Edu.id


  health_check {
    interval            = 8
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2

  }

  tags = {
    Name = "TG_Back"
  }
}

resource "aws_lb_target_group_attachment" "TG_back-A" {
  target_group_arn = aws_lb_target_group.back.arn
  target_id        = aws_instance.Back-A.id
  port             = 80
}


resource "aws_lb_target_group_attachment" "TG_back-B" {
  target_group_arn = aws_lb_target_group.back.arn
  target_id        = aws_instance.Back-B.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "Target-B" {
  target_group_arn = aws_lb_target_group.Front.arn
  target_id        = aws_instance.Private_B.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "Target-A" {
  target_group_arn = aws_lb_target_group.Front.arn
  target_id        = aws_instance.Private_A.id
  port             = 80
}