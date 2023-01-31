# ECS - Elastic Container Service
# Criando um recurso de definição de tarefa, este recurso define detalhes para o serviço e as definições de contêiner definem detalhes para o contêiner
resource "aws_ecs_task_definition" "name" {
  family                   = "name"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  execution_role_arn       = var.ROLE
  task_role_arn 	         = var.ROLE
  container_definitions = jsonencode([
    {
      name             = "name"
      image            = var.IMAGEM
      essential        = true
      cpu              = 1024
      memory           = 2048
      executionRoleArn = var.ROLE
      #environment = [
      #  {name = "var-name", value = var.name}
      #],

      logConfiguration = {
          "logDriver": "awslogs",
          "options": {
            #"awslogs-group": "${group-name}",
            "awslogs-region": "us-east-1",
            "awslogs-stream-prefix": "ecs"
          }
        }

      portMappings = [
        {
          containerPort = var.CONTAINER_PORT
          hostPort      = var.HOST_PORT
        }
      ]
    }
  ])
}

# Criando serviço que se conecta ao balanceamento de carga
resource "aws_ecs_service" "balance" {
  name                 = "name"
  cluster              = "cluster-name"
  task_definition      = aws_ecs_task_definition.task-balance.arn
  #launch_type          = "FARGATE"
  desired_count        = 1
  force_new_deployment = true
  enable_execute_command = true

  network_configuration {
    subnets         = ["subnet-name"]
    security_groups = ["sg-name"]
    assign_public_ip = true

  }
  load_balancer {
    #target_group_arn = aws_alb_target_group.balance.arn
    container_name   = "balance"
    container_port   = var.CONTAINER_PORT
  }

  depends_on = [aws_alb_listener.ecs-cluster-listener]

}
