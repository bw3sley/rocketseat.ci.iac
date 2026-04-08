resource "aws_ecr_repository" "rocketseat-ci-api" {
  name                 = "rocketseat-ci-api"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Iac = "True"
  }
}