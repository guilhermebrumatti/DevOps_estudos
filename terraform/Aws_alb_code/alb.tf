# Aws Load Balance
# Cria um recurso de balanceamento de carga
resource "aws_alb" "service-name" {
  name            = "service-name"
  security_groups = ["sg-name"]
  subnets         = ["subnet-name"]
}

# Cria um recurso de grupo de destino para usar com balanceamento de carga
resource "aws_alb_target_group" "service-name" {
  name        = "service-name"
  port        = 8082
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.VPC_ID
    
    health_check {
    path              = "/"
    interval          = 60
    port              = 8082
    protocol          = "HTTP"
    timeout           = 3
    healthy_threshold = 3
    unhealthy_threshold = 3
    matcher = "200-404"
  }
}

# Cria um listener necessário para balanceamento de carga
resource "aws_alb_listener" "ecs-cluster-listener" {
  load_balancer_arn = aws_alb.service-name.id
  port              = 8082
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn"
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.service-name.id
  }
}
