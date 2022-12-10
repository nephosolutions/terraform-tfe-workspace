# Terraform Cloud Workspace

This module provisions a Terraform Cloud / Terraform Enterprise workspace.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | >= 0.36 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_variable.tfe_workspace](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_workspace.workspace](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agent_pool_id"></a> [agent\_pool\_id](#input\_agent\_pool\_id) | The ID of an agent pool to assign to the workspace. | `string` | `null` | no |
| <a name="input_allow_destroy_plan"></a> [allow\_destroy\_plan](#input\_allow\_destroy\_plan) | Whether destroy plans can be queued on the workspace. | `bool` | `false` | no |
| <a name="input_auto_apply"></a> [auto\_apply](#input\_auto\_apply) | Whether to automatically apply changes when a Terraform plan is successful. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | A description for the workspace. | `string` | n/a | yes |
| <a name="input_execution_mode"></a> [execution\_mode](#input\_execution\_mode) | Which execution mode to use. When set to `local`, the workspace will be used for state storage only. | `string` | `"remote"` | no |
| <a name="input_file_triggers_enabled"></a> [file\_triggers\_enabled](#input\_file\_triggers\_enabled) | Whether to filter runs based on the changed files in a VCS push. If enabled, the working directory and trigger prefixes describe a set of paths which must contain changes for a VCS push to trigger a run. If disabled, any push will trigger a run. | `bool` | `false` | no |
| <a name="input_global_remote_state"></a> [global\_remote\_state](#input\_global\_remote\_state) | Whether the workspace allows all workspaces in the organization to access its state data during runs. If false, then only specifically approved workspaces can access its state (`remote_state_consumer_ids`). | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the workspace. | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | Name of the Terraform Cloud organization. | `string` | n/a | yes |
| <a name="input_queue_all_runs"></a> [queue\_all\_runs](#input\_queue\_all\_runs) | Whether the workspace should start automatically performing runs immediately after its creation. | `bool` | `true` | no |
| <a name="input_remote_state_consumer_ids"></a> [remote\_state\_consumer\_ids](#input\_remote\_state\_consumer\_ids) | The set of workspace IDs set as explicit remote state consumers for the given workspace. | `list(string)` | `[]` | no |
| <a name="input_speculative_enabled"></a> [speculative\_enabled](#input\_speculative\_enabled) | Whether this workspace allows speculative plans.  Setting this to `false` prevents Terraform Cloud or the Terraform Enterprise instance from running plans on pull requests, which can improve security if the VCS repository is public or includes untrusted contributors. | `bool` | `true` | no |
| <a name="input_ssh_key_id"></a> [ssh\_key\_id](#input\_ssh\_key\_id) | The ID of an SSH key to assign to the workspace. | `string` | `null` | no |
| <a name="input_structured_run_output_enabled"></a> [structured\_run\_output\_enabled](#input\_structured\_run\_output\_enabled) | Whether this workspace should show output from Terraform runs using the enhanced UI when available. Setting this to `false` ensures that all runs in this workspace will display their output as text logs. | `bool` | `true` | no |
| <a name="input_tag_names"></a> [tag\_names](#input\_tag\_names) | A list of tag names for this workspace. Note that tags must only contain lowercase letters, numbers, colons, or hyphens. | `list(string)` | `[]` | no |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | The version of Terraform to use for this workspace. This can be either an exact version or a version constraint (like `~> 1.0.0`); if you specify a constraint, the workspace will always use the newest release that meets that constraint. | `string` | n/a | yes |
| <a name="input_trigger_patterns"></a> [trigger\_patterns](#input\_trigger\_patterns) | List of glob patterns that describe the files Terraform Cloud monitors for changes. Trigger patterns are always appended to the root directory of the repository. | `list(string)` | `null` | no |
| <a name="input_trigger_prefixes"></a> [trigger\_prefixes](#input\_trigger\_prefixes) | List of repository-root-relative paths which describe all locations to be tracked for changes. | `list(string)` | `null` | no |
| <a name="input_vcs_repo"></a> [vcs\_repo](#input\_vcs\_repo) | Settings for the workspace's VCS repository, enabling the UI/VCS-driven run workflow. Omit this argument to utilize the CLI-driven and API-driven workflows, where runs are not driven by webhooks on your VCS provider. | <pre>object({<br>    identifier     = string<br>    oauth_token_id = string<br>  })</pre> | `null` | no |
| <a name="input_working_directory"></a> [working\_directory](#input\_working\_directory) | A relative path that Terraform will execute within. Defaults to the root of your repository. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The workspace ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Appendix

### The `notifications` object

```hcl
notifications = {
  "my-test-notification-configuration" = {
    configuration = {
      destination_type = "generic"
      enabled          = true                       # Optional. Defaults to true
      token            = "write-only secure token"  # Optional. Defaults to null
      url              = "https://example.com"
    }
    triggers = [
      "run:created",
      "run:planning",
      "run:errored"
    ]
  }
}
```

### The `team_access` map

```hcl
team_access = {
  "my-tfe-team" = "<permission>"
}
```

Valid values for the _permissions_ are `admin`, `read`, `plan`, or `write`.

### The `variables` map

```hcl
variables = {
  environment = {
    key1 = var.value
    key2 = "value2"
  }
  environment_sensitive = {
    ...
  }
  terraform = {
    ...
  }
  terraform_sensitive = {
    ...
  }
}
```

### The `vcs_repo` block

* `identifier` - (Required) A reference to your VCS repository in the format `:org/:repo` where `:org` and `:repo` refer to the organization and repository in your VCS provider.
* `branch` - (Optional) The repository branch that Terraform will execute from. Default to `master`.
* `ingress_submodules` - (Optional) Whether submodules should be fetched when cloning the VCS repository. Defaults to `false`.
* `oauth_token_id` - (Required) Token ID of the VCS Connection (OAuth Conection Token) to use.
