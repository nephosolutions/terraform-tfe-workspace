# Terraform Cloud Workspace

This module provisions a Terraform Cloud / Terraform Enterprise workspace

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| auto\_apply | Whether to automatically apply changes when a Terraform plan is successful. | string | `"false"` | no |
| file\_triggers\_enabled | Whether to filter runs based on the changed files in a VCS push. If enabled, the working directory and trigger prefixes describe a set of paths which must contain changes for a VCS push to trigger a run. If disabled, any push will trigger a run. | string | `"true"` | no |
| name | Name of the workspace | string | n/a | yes |
| notifications | Map of `tfe_notification_configurations` to define in the workspace. | object | `{}` | no |
| organization | Name of the organization. | string | n/a | yes |
| queue\_all\_runs | Whether all runs should be queued. When set to false, runs triggered by a VCS change will not be queued until at least one run is manually queued. | string | `"true"` | no |
| ssh\_key\_id | The ID of an SSH key to assign to the workspace. | string | `"null"` | no |
| team\_access | Associate teams to permissions on the workspace. | map(string) | `{}` | no |
| terraform\_version | The version of Terraform to use for this workspace. | string | `"null"` | no |
| trigger\_prefixes | List of repository-root-relative paths which describe all locations to be tracked for changes. workspace. Defaults to the latest available version. | list | `"null"` | no |
| variables | Map of environment or Terraform variables to define in the workspace. | map(map(string)) | `{}` | no |
| vcs\_repo | The VCS repository to configure. | map(string) | `{}` | no |
| working\_directory | A relative path that Terraform will execute within. Defaults to the root of your repository. | string | `"null"` | no |

## Outputs

| Name | Description |
|------|-------------|
| external\_id | The workspace's opaque external ID, which looks like `ws-<RANDOM STRING>` |
| id | The workspace's human-readable ID, which looks like `<ORGANIZATION>/<WORKSPACE>`. |

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
