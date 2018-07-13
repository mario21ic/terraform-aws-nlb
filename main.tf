resource "aws_lb" "my_nlb" {
  name               = "${var.env}-nlb-${var.name}"
  internal           = "${var.internal}"
  load_balancer_type = "network"
  subnets            = ["${var.subnet_ids}"]

  enable_deletion_protection = false

  tags {
    Env         = "${var.env}"
    Description = "NLB ${var.env} ${var.name}"
  }
}

resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = "${aws_lb.my_nlb.arn}"
  port              = "${var.port}"
  protocol          = "TCP"

  default_action {
    target_group_arn = "${aws_lb_target_group.my_tg.arn}"
    type             = "forward"
  }
}

resource "aws_lb_target_group" "my_tg" {
  name     = "${var.env}-tg-${var.name}"
  target_type = "instance"

  vpc_id   = "${var.vpc_id}"
  protocol = "TCP"
  port     = "${var.port}"

  health_check {
    protocol = "TCP"
    port = "traffic-port"
    healthy_threshold = 3
    unhealthy_threshold = 3
    interval = 30
  }
}
