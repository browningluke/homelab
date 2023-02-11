terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "browningluke"

    workspaces {
      name = "tfc-browningluke"
    }
  }
}
