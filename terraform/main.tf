resource "aws_ecs_task_definition" "db_migration" {
  family                   = "db-migration"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = var.task_execution_role_arn
  task_role_arn            = var.task_execution_role_arn

  container_definitions = jsonencode([
    {
      name      = "atlas-migrate"
      image     = var.container_image
      essential = true
      command   = ["atlas", "migrate", "apply", "--env", "local"]
      environment = [
        {
          name  = "ATLAS_LOG_LEVEL"
          value = "debug"
        }
      ]
    }
  ])
}

resource "aws_ecs_task" "run_migration" {
  cluster         = var.cluster_name
  task_definition = aws_ecs_task_definition.db_migration.arn
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = var.security_group_ids
    assign_public_ip = true
  }

  lifecycle {
    ignore_changes = [desired_count] # One-shot
  }
}
