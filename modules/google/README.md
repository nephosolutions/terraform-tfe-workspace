# Terraform Cloud workspace with Dynamic Credentials for the GCP Provider

A Google service account is provisioned and the Terraform Cloud workspace is granted permission to impersonate it.
The service account must be granted permissions to access Google Cloud Platform resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Copyright 2019-2024 NephoSolutions srl, Sebastian Trebitz

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.50 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | >= 0.51.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.36.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tfe_workspace"></a> [tfe\_workspace](#module\_tfe\_workspace) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [google_service_account.tfe_workspace](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_member.terraform_service_account_token_creator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |
| [google_service_account_iam_member.terraform_workload_identity_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agent_pool_id"></a> [agent\_pool\_id](#input\_agent\_pool\_id) | The ID of an agent pool to assign to the workspace. | `string` | `null` | no |
| <a name="input_allow_destroy_plan"></a> [allow\_destroy\_plan](#input\_allow\_destroy\_plan) | Whether destroy plans can be queued on the workspace. | `bool` | `false` | no |
| <a name="input_auto_apply"></a> [auto\_apply](#input\_auto\_apply) | Whether to automatically apply changes when a Terraform plan is successful. | `bool` | `false` | no |
| <a name="input_auto_apply_run_trigger"></a> [auto\_apply\_run\_trigger](#input\_auto\_apply\_run\_trigger) | Whether to automatically apply changes for runs that were created by run triggers from another workspace. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | A description for the workspace. | `string` | n/a | yes |
| <a name="input_execution_mode"></a> [execution\_mode](#input\_execution\_mode) | Which execution mode to use. When set to `local`, the workspace will be used for state storage only. | `string` | `null` | no |
| <a name="input_file_triggers_enabled"></a> [file\_triggers\_enabled](#input\_file\_triggers\_enabled) | Whether to filter runs based on the changed files in a VCS push. If enabled, the working directory and trigger prefixes describe a set of paths which must contain changes for a VCS push to trigger a run. If disabled, any push will trigger a run. Workspaces with no Terraform working directory will always trigger runs. | `bool` | `true` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The Google Cloud project ID where the service accounts for Terraform Cloud should be created. | `string` | n/a | yes |
| <a name="input_global_remote_state"></a> [global\_remote\_state](#input\_global\_remote\_state) | Whether the workspace allows all workspaces in the organization to access its state data during runs. If false, then only specifically approved workspaces can access its state (`remote_state_consumer_ids`). | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the workspace. | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | Name of the Terraform Cloud organization. | `string` | `null` | no |
| <a name="input_queue_all_runs"></a> [queue\_all\_runs](#input\_queue\_all\_runs) | Whether the workspace should start automatically performing runs immediately after its creation. | `bool` | `true` | no |
| <a name="input_remote_state_consumer_ids"></a> [remote\_state\_consumer\_ids](#input\_remote\_state\_consumer\_ids) | The set of workspace IDs set as explicit remote state consumers for the given workspace. | `list(string)` | `[]` | no |
| <a name="input_speculative_enabled"></a> [speculative\_enabled](#input\_speculative\_enabled) | Whether this workspace allows speculative plans.  Setting this to `false` prevents Terraform Cloud or the Terraform Enterprise instance from running plans on pull requests, which can improve security if the VCS repository is public or includes untrusted contributors. | `bool` | `true` | no |
| <a name="input_ssh_key_id"></a> [ssh\_key\_id](#input\_ssh\_key\_id) | The ID of an SSH key to assign to the workspace. | `string` | `null` | no |
| <a name="input_structured_run_output_enabled"></a> [structured\_run\_output\_enabled](#input\_structured\_run\_output\_enabled) | Whether this workspace should show output from Terraform runs using the enhanced UI when available. Setting this to `false` ensures that all runs in this workspace will display their output as text logs. | `bool` | `true` | no |
| <a name="input_tag_names"></a> [tag\_names](#input\_tag\_names) | A list of tag names for this workspace. Note that tags must only contain lowercase letters, numbers, colons, or hyphens. | `list(string)` | `[]` | no |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | The version of Terraform to use for this workspace. This can be either an exact version or a version constraint (like `~> 1.0.0`); if you specify a constraint, the workspace will always use the newest release that meets that constraint. | `string` | `null` | no |
| <a name="input_tfc_project_id"></a> [tfc\_project\_id](#input\_tfc\_project\_id) | The ID of the Terraform Cloud project where the workspace should be created. | `string` | `null` | no |
| <a name="input_trigger_patterns"></a> [trigger\_patterns](#input\_trigger\_patterns) | List of glob patterns that describe the files Terraform Cloud monitors for changes. Trigger patterns are always appended to the root directory of the repository. | `list(string)` | `null` | no |
| <a name="input_trigger_prefixes"></a> [trigger\_prefixes](#input\_trigger\_prefixes) | List of repository-root-relative paths which describe all locations to be tracked for changes. | `list(string)` | `null` | no |
| <a name="input_variables"></a> [variables](#input\_variables) | Set of variables to configure. | <pre>set(object({<br>    category    = string<br>    description = optional(string)<br>    hcl         = optional(bool)<br>    key         = string<br>    sensitive   = optional(bool)<br>    value       = string<br>  }))</pre> | `[]` | no |
| <a name="input_vcs_repository"></a> [vcs\_repository](#input\_vcs\_repository) | Settings for the workspace's VCS repository, enabling the UI/VCS-driven run workflow. Omit this argument to utilize the CLI-driven and API-driven workflows, where runs are not driven by webhooks on your VCS provider. | <pre>object({<br>    branch             = optional(string)<br>    identifier         = string<br>    ingress_submodules = optional(bool)<br>    oauth_token_id     = string<br>    tags_regex         = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_working_directory"></a> [working\_directory](#input\_working\_directory) | A relative path that Terraform will execute within. | `string` | `null` | no |
| <a name="input_workload_identity_pool"></a> [workload\_identity\_pool](#input\_workload\_identity\_pool) | Terraform Cloud workload identity pool. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | The Terraform Cloud workspace service account. |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | The workspace identifier. |
| <a name="output_workspace_name"></a> [workspace\_name](#output\_workspace\_name) | The workspace name. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
