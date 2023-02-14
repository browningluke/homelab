module "tfe_org" {
  source  = "app.terraform.io/browningluke/organization/tfe"
  version = "~> 1.0"

  github_oauth_token = var.github_oauth_token

  project_config   = file("${path.root}/data/projects.yaml")
  workspace_config = file("${path.root}/data/workspaces.yaml")
}
