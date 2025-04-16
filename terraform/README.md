# ECS Migration task

Bootstrap an ECS task definition used as a migration job by Github Actions.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecs_task.run_migration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task) | resource |
| [aws_ecs_task_definition.db_migration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the ECS Cluster where the ECS Task will be scheduled | `string` | n/a | yes |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | Container image used by the ECS Task for the Atlas container (from ECR) | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of security group IDs to attach to the ECS Task | `list(string)` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs to attach to the ECS Task | `list(string)` | n/a | yes |
| <a name="input_task_cpu"></a> [task\_cpu](#input\_task\_cpu) | CPU allocation to the ECS Task | `number` | `512` | no |
| <a name="input_task_execution_role_arn"></a> [task\_execution\_role\_arn](#input\_task\_execution\_role\_arn) | ARN of the IAM Task Execution Role which will be used by the ECS Task | `string` | n/a | yes |
| <a name="input_task_memory"></a> [task\_memory](#input\_task\_memory) | RAM of the ECS Task | `number` | `1024` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_migration_task_definition_arn"></a> [migration\_task\_definition\_arn](#output\_migration\_task\_definition\_arn) | ARN of the migration ECS Task |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
