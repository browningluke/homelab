# Cloudflare browningluke.dev zone

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.7 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 3.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cf_record"></a> [cf\_record](#module\_cf\_record) | app.terraform.io/browningluke/record/cloudflare | ~> 1.0 |
| <a name="module_cf_rule_firewall"></a> [cf\_rule\_firewall](#module\_cf\_rule\_firewall) | app.terraform.io/browningluke/rule-firewall/cloudflare | ~> 1.0 |
| <a name="module_cf_rule_page"></a> [cf\_rule\_page](#module\_cf\_rule\_page) | app.terraform.io/browningluke/rule-page/cloudflare | ~> 1.0 |
| <a name="module_cf_rule_redirect"></a> [cf\_rule\_redirect](#module\_cf\_rule\_redirect) | app.terraform.io/browningluke/rule-redirect/cloudflare | ~> 1.0 |
| <a name="module_cf_rule_transform"></a> [cf\_rule\_transform](#module\_cf\_rule\_transform) | app.terraform.io/browningluke/rule-transform/cloudflare | ~> 1.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_account_id"></a> [cloudflare\_account\_id](#input\_cloudflare\_account\_id) | n/a | `string` | n/a | yes |
| <a name="input_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#input\_cloudflare\_zone\_id) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
