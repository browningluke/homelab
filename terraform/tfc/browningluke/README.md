# TFC 'browningluke' Projects & Workspaces

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.7 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.42.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tfe_org"></a> [tfe\_org](#module\_tfe\_org) | app.terraform.io/browningluke/organization/tfe | ~> 1.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_oauth_token"></a> [github\_oauth\_token](#input\_github\_oauth\_token) | PAT with scopes: admin:repo\_hook, repo | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
