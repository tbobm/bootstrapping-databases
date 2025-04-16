variable "cluster_name" {
  description = "Name of the ECS Cluster where the ECS Task will be scheduled"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to attach to the ECS Task"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to the ECS Task"
  type        = list(string)
}

variable "container_image" {
  description = "Container image used by the ECS Task for the Atlas container (from ECR)"
  type        = string
}

variable "task_execution_role_arn" {
  description = "ARN of the IAM Task Execution Role which will be used by the ECS Task"
  type        = string
}

variable "task_cpu" {
  description = "CPU allocation to the ECS Task"
  default     = 512
}

variable "task_memory" {
  description = "RAM of the ECS Task"
  default     = 1024
}
