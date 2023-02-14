variable "github_oauth_token" {
  type        = string
  sensitive   = true
  description = "PAT with scopes: admin:repo_hook, repo"
}
