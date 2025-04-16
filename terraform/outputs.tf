output "migration_task_definition_arn" {
  value       = aws_ecs_task_definition.db_migration.arn
  description = "ARN of the migration ECS Task"
}

