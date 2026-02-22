resource "aws_ecs_service" "fservice" {
  name            = "fastapi-service"
  cluster         = aws_ecs_cluster.fcluster.id
  task_definition = aws_ecs_task_definition.ftask.arn
  desired_count   = 2
  scheduling_strategy = "REPLICA"
  launch_type     = "FARGATE"
  platform_version = "LATEST"
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent = 200
  load_balancer {
    target_group_arn = aws_lb_target_group.ftargetgroup.arn
    container_name   = "fastapi-container"
    container_port   = 80
  }

  network_configuration {
    subnets         = [aws_subnet.fsubnet1.id, aws_subnet.fsubnet2.id]
    security_groups = [aws_security_group.fsg.id]
    assign_public_ip = true
  }

  tags = {
    Name = "fastapi-service"
  }
}