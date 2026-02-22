resource "aws_iam_role_policy" "test_policy" {
  name = "ecs-task-execution-policy"
  role = aws_iam_role.iam_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "ecs:List*",
          "ecs:Describe*",
          "ecr:Get*",
          "ecr:List*",
          "iam:List*",
          "iam:Get*",
          "logs:Describe*",
          "logs:Get*",
          "logs:List*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

