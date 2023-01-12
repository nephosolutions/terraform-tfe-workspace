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

resource "tfe_workspace" "workspace" {
  agent_pool_id                 = var.agent_pool_id
  allow_destroy_plan            = var.allow_destroy_plan
  auto_apply                    = var.auto_apply
  description                   = var.description
  execution_mode                = var.execution_mode
  file_triggers_enabled         = var.file_triggers_enabled
  global_remote_state           = var.global_remote_state
  name                          = var.name
  organization                  = var.organization
  queue_all_runs                = var.queue_all_runs
  remote_state_consumer_ids     = var.remote_state_consumer_ids
  speculative_enabled           = var.speculative_enabled
  ssh_key_id                    = var.ssh_key_id
  structured_run_output_enabled = var.structured_run_output_enabled
  tag_names                     = var.tag_names
  terraform_version             = var.terraform_version
  trigger_patterns              = var.trigger_patterns
  trigger_prefixes              = var.trigger_prefixes

  dynamic "vcs_repo" {
    for_each = var.vcs_repo == null ? [] : [1]

    content {
      branch             = var.vcs_repo.branch
      identifier         = var.vcs_repo.identifier
      ingress_submodules = var.vcs_repo.ingress_submodules
      oauth_token_id     = var.vcs_repo.oauth_token_id
      tags_regex         = var.vcs_repo.tags_regex
    }
  }

  working_directory = var.working_directory
}

resource "tfe_variable" "tfe_workspace" {
  category     = "env"
  description  = "The name of the Terraform Cloud workspace."
  key          = "TF_VAR_tfe_workspace"
  value        = tfe_workspace.workspace.name
  workspace_id = tfe_workspace.workspace.id
}
