resource "aws_codecommit_repository" "code_commit_repo" {
  repository_name = var.repository_name
  description     = var.description
}
