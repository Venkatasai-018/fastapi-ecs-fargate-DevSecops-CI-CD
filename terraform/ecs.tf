resource "aws_ecs_cluster" "fcluster" {
  name = "fastapi-cluster"
  tags = {
    Name = "fastapi-cluster"
  }
}