output "repo_url" {
  value       = github_repository.this.http_clone_url
  description = "HTML url of the repo"
}
