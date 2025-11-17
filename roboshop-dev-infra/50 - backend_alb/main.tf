# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb

resource "aws_lb" "backend_alb" {
  name = "${local.common_name_prefix}-backend-alb" # roboshop-dev-backen-alb
  # internal load balancer
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id]
  # should be created in private subnet because it is internal
  subnets = local.private_subnet_ids

  enable_deletion_protection = true # prevent accidental deletion



  tags = merge(local.common_tags, {
    Name = "${local.common_name_prefix}-backend_alb"
  })
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener

# backend alb listening on port 80
resource "aws_lb_listener" "backend_alb" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "check backend alb hhtp"
      status_code  = "200"
    }
  }
}
