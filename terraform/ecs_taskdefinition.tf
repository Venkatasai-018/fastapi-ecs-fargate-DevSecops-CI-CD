resource "aws_ecs_task_definition" "ftask" {
  family                   = "fastapi-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name      = "fastapi-container"
      image     = "venkatasai/fastapi-ecs-fargate:latest"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]
    }
  ])

  tags = {
    Name = "fastapi-task"
  }
}


data "aws_ecs_task_definition" "ftask" {
  task_definition = aws_ecs_task_definition.ftask.arn
}