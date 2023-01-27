# Copyright 2019-2023 NephoSolution srl, Sebastian Trebitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

variable "agent_pool_id" {
  description = "The ID of an agent pool to assign to the workspace."
  type        = string
  default     = null
}

variable "allow_destroy_plan" {
  description = "Whether destroy plans can be queued on the workspace."
  type        = bool
  default     = false
}

variable "auto_apply" {
  description = "Whether to automatically apply changes when a Terraform plan is successful."
  type        = bool
  default     = false
}

variable "description" {
  description = "A description for the workspace."
  type        = string
}

variable "execution_mode" {
  description = "Which execution mode to use. When set to `local`, the workspace will be used for state storage only."
  type        = string
  nullable    = false
  default     = "remote"

  validation {
    condition     = contains(["agent", "local", "remote"], var.execution_mode)
    error_message = "Using Terraform Cloud, valid values are `remote`, `local` or `agent`. Using Terraform Enterprise, only `remote` and `local` execution modes are valid."
  }
}

variable "file_triggers_enabled" {
  description = "Whether to filter runs based on the changed files in a VCS push. If enabled, the working directory and trigger prefixes describe a set of paths which must contain changes for a VCS push to trigger a run. If disabled, any push will trigger a run. Workspaces with no Terraform working directory will always trigger runs."
  type        = bool
  default     = true
}

variable "global_remote_state" {
  description = "Whether the workspace allows all workspaces in the organization to access its state data during runs. If false, then only specifically approved workspaces can access its state (`remote_state_consumer_ids`)."
  type        = bool
  default     = false
}

variable "name" {
  description = "Name of the workspace."
  type        = string
}

variable "organization" {
  description = "Name of the Terraform Cloud organization."
  type        = string
}

variable "project_id" {
  description = "ID of the project where the workspace should be created."
  type        = string
  default     = null
}

variable "queue_all_runs" {
  description = "Whether the workspace should start automatically performing runs immediately after its creation."
  type        = bool
  default     = true
}

variable "remote_state_consumer_ids" {
  description = "The set of workspace IDs set as explicit remote state consumers for the given workspace."
  type        = list(string)
  default     = []
}

variable "speculative_enabled" {
  description = "Whether this workspace allows speculative plans.  Setting this to `false` prevents Terraform Cloud or the Terraform Enterprise instance from running plans on pull requests, which can improve security if the VCS repository is public or includes untrusted contributors."
  type        = bool
  default     = true
}

variable "ssh_key_id" {
  description = "The ID of an SSH key to assign to the workspace."
  type        = string
  default     = null
}

variable "structured_run_output_enabled" {
  description = "Whether this workspace should show output from Terraform runs using the enhanced UI when available. Setting this to `false` ensures that all runs in this workspace will display their output as text logs."
  type        = bool
  default     = true
}

variable "tag_names" {
  description = "A list of tag names for this workspace. Note that tags must only contain lowercase letters, numbers, colons, or hyphens."
  type        = list(string)
  default     = []
}

variable "terraform_version" {
  description = "The version of Terraform to use for this workspace. This can be either an exact version or a version constraint (like `~> 1.0.0`); if you specify a constraint, the workspace will always use the newest release that meets that constraint."
  type        = string
  nullable    = false
}

variable "trigger_patterns" {
  description = "List of glob patterns that describe the files Terraform Cloud monitors for changes. Trigger patterns are always appended to the root directory of the repository."
  type        = list(string)
  default     = null
}

variable "trigger_prefixes" {
  description = "List of repository-root-relative paths which describe all locations to be tracked for changes."
  type        = list(string)
  default     = null
}

variable "vcs_repo" {
  description = "Settings for the workspace's VCS repository, enabling the UI/VCS-driven run workflow. Omit this argument to utilize the CLI-driven and API-driven workflows, where runs are not driven by webhooks on your VCS provider."

  type = object({
    branch             = optional(string)
    identifier         = string
    ingress_submodules = optional(bool)
    oauth_token_id     = string
    tags_regex         = optional(string)
  })

  default = null
}

variable "working_directory" {
  description = "A relative path that Terraform will execute within. Defaults to the root of your repository."
  type        = string
  default     = null
}
