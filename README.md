# No-Code Landing Zone Setup

## About

A module to manage nocode LZ modules.

Creates a TFC project for Landing-Zone No-Code Workspaces, with variable set and required variables for No-Code provisioning of TFC and Github resources.

Create registry modules for simple (Service Catalog model) and flexible (Franchise model) landing zones, enables them for nocode provisioning, and populates the drop-down options for each:
- simple LZ module - combinations of environments for the app workspaces
- flexible LZ module - valid archetypes for LZ management workspaces based on matching templates in the Github org


<!-- BEGIN_TF_DOCS -->

### Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.0 |
| github | 5.42.0 |
| tfe | 0.51.1 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [tfe_no_code_module.awslz](https://registry.terraform.io/providers/hashicorp/tfe/0.51.1/docs/resources/no_code_module) | resource |
| [tfe_no_code_module.awslz_sc_basic](https://registry.terraform.io/providers/hashicorp/tfe/0.51.1/docs/resources/no_code_module) | resource |
| [tfe_project.nclz_nocode](https://registry.terraform.io/providers/hashicorp/tfe/0.51.1/docs/resources/project) | resource |
| [tfe_project_variable_set.nclz_core](https://registry.terraform.io/providers/hashicorp/tfe/0.51.1/docs/resources/project_variable_set) | resource |
| [tfe_registry_module.awslz](https://registry.terraform.io/providers/hashicorp/tfe/0.51.1/docs/resources/registry_module) | resource |
| [tfe_registry_module.awslz_sc_basic](https://registry.terraform.io/providers/hashicorp/tfe/0.51.1/docs/resources/registry_module) | resource |
| [tfe_variable.GITHUB_TOKEN](https://registry.terraform.io/providers/hashicorp/tfe/0.51.1/docs/resources/variable) | resource |
| [tfe_variable.TFE_TOKEN](https://registry.terraform.io/providers/hashicorp/tfe/0.51.1/docs/resources/variable) | resource |
| [tfe_variable.github_owner](https://registry.terraform.io/providers/hashicorp/tfe/0.51.1/docs/resources/variable) | resource |
| [tfe_variable.oauth_token_id](https://registry.terraform.io/providers/hashicorp/tfe/0.51.1/docs/resources/variable) | resource |
| [tfe_variable.tfc_organization](https://registry.terraform.io/providers/hashicorp/tfe/0.51.1/docs/resources/variable) | resource |
| [tfe_variable_set.nclz_core](https://registry.terraform.io/providers/hashicorp/tfe/0.51.1/docs/resources/variable_set) | resource |
| [github_repositories.lz_templates](https://registry.terraform.io/providers/integrations/github/5.42.0/docs/data-sources/repositories) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| default\_tags | a set of tags to watermark the resources you deployed with Terraform. | `map(string)` | <pre>{<br>  "owner": "richard",<br>  "terraformed": "Do not edit manually."<br>}</pre> | no |
| github\_owner | Owner of the Github org | `string` | n/a | yes |
| github\_token | Github token to pass through to mgmt ws | `string` | n/a | yes |
| mgmt\_ws\_template\_prefix | String to prefix the archetype name to give mgmt template repo name | `string` | `"nocode-lz-mgmt-template"` | no |
| oauth\_token\_id | Oauth token ID used for associating workspace to VCS | `string` | n/a | yes |
| tfc\_organization | TFC organization | `string` | n/a | yes |
| tfe\_token | TFE token to pass through to mgmt ws | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| templates | n/a |

<!-- END_TF_DOCS -->