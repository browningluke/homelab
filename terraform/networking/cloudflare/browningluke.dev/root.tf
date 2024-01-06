# DNS Records
module "cf_record" {
  source  = "app.terraform.io/browningluke/record/cloudflare"
  version = "~> 1.0"

  cloudflare_zone_id = var.cloudflare_zone_id

  config = file("${path.root}/data/dns.yaml")
}

# Transform Rules
module "cf_rule_transform" {
  source  = "app.terraform.io/browningluke/rule-transform/cloudflare"
  version = "~> 1.0"

  cloudflare_zone_id = var.cloudflare_zone_id

  config = file("${path.root}/data/rules_transform.yaml")
}

# Page Rules
module "cf_rule_page" {
  source  = "app.terraform.io/browningluke/rule-page/cloudflare"
  version = "~> 1.0"

  cloudflare_zone_id = var.cloudflare_zone_id

  config = file("${path.root}/data/rules_page.yaml")
}

# Bulk Redirects
module "cf_rule_redirect" {
  source  = "app.terraform.io/browningluke/rule-redirect/cloudflare"
  version = "~> 1.0"

  cloudflare_account_id = var.cloudflare_account_id

  config = file("${path.root}/data/rules_redirect.yaml")
}

# Firewall Rules
module "cf_rule_firewall" {
  source  = "app.terraform.io/browningluke/rule-firewall/cloudflare"
  version = "~> 1.0"

  cloudflare_zone_id = var.cloudflare_zone_id

  config = file("${path.root}/data/rules_firewall.yaml")
}
