resource "aws_ecr_repository" "migration" {
  name                 = "db-migration"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  lifecycle {
    prevent_destroy = false
  }
}
