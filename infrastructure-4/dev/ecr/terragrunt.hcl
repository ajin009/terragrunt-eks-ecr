include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../infrastructure-modules/dev/ecr"
}

inputs = {
  repository_name      = "my-app-repo"
  image_tag_mutability = "IMMUTABLE"
  scan_on_push         = true
  lifecycle_policy     = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Expire images older than 30 days"
        selection    = {
          tagStatus      = "untagged"
          countType      = "sinceImagePushed"
          countUnit      = "days"
          countNumber    = 30
        }
        action       = {
          type = "expire"
        }
      }
    ]
  })
}