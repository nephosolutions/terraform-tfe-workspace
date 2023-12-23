# Terraform Cloud/Enterprise OIDC Credential Helper

This is a helper module to prepare GCP Credentials from Terraform Cloud/Enterprise workload identity token.

## Usage
```hcl
module "tfe_oidc" {
  source  = "nephosolutions/workspace/tfe//modules/oidc_token"
  version = "~> 4.0.0"

  impersonate_service_account = "tfe-test@tfe-test-wif.iam.gserviceaccount.com"
}

provider "google" {
  credentials = module.tfe_oidc.credentials
}

provider "google-beta" {
  credentials = module.tfe_oidc.credentials
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.1 |
| <a name="requirement_external"></a> [external](#requirement\_external) | >= 2.2.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_external"></a> [external](#provider\_external) | 2.3.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [external_external.oidc_token_file](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [external_external.workload_identity_pool](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_impersonate_service_account"></a> [impersonate\_service\_account](#input\_impersonate\_service\_account) | Service account to be impersonated by workload identity federation. | `string` | n/a | yes |
| <a name="input_tmp_oidc_token_path"></a> [tmp\_oidc\_token\_path](#input\_tmp\_oidc\_token\_path) | Name of the temporary file where TFC OIDC token will be stored to authenticate terraform provider google. | `string` | `".oidc_token"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_google_credentials"></a> [google\_credentials](#output\_google\_credentials) | Credentials in format to pass the to GCP provider. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
