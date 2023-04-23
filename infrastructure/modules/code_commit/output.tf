output "repository_url" {
  description = "The URL of the CodeCommit repository."
  value       = aws_codecommit_repository.code_commit_repo.clone_url_http
}
