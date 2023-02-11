module "github_repos" {
  source  = "app.terraform.io/browningluke/repo/github"
  version = "~> 1.0"

  repo_config = file("${path.root}/data/repos.yaml")
}
