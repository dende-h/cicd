resource "aws_lb" "terraform_alb" {
  name               = var.alb_name
  internal           = false //外部のインターネットに向けたロードバランサ
  load_balancer_type = "application"
  security_groups    = [var.alb_sec_group_id]
  subnets            = [var.public_subnet1_id, var.public_subnet2_id]

  enable_deletion_protection = false //ロードバランサの削除保護無効

  tags = {
    Name = var.alb_name
  }
}

resource "aws_lb_target_group" "terraform_target_group" {
  name     = var.alb_target
  port     = var.port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = var.alb_target
  }
}


resource "aws_lb_target_group_attachment" "alb-attach" {
  count            = 2
  target_group_arn = aws_lb_target_group.terraform_target_group.arn
  target_id        = var.target_ec2
  port             = 80
}

resource "aws_lb_listener" "listener_resource" {
  load_balancer_arn = aws_lb.terraform_alb.arn
  port              = var.port
  protocol          = "HTTP"

  default_action { //ロードバランサーが受信したトラフィックをどのように処理するかを指定
    type             = "forward"
    target_group_arn = aws_lb_target_group.terraform_target_group.arn
  }
}