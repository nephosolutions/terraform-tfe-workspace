/**
 * Copyright 2019-2025 NephoSolutions srl, Sebastian Trebitz
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

resource "tfe_workspace" "workspace" {
  name        = var.name
  description = var.description

  allow_destroy_plan            = var.allow_destroy_plan
  auto_apply                    = var.auto_apply
  auto_apply_run_trigger        = var.auto_apply_run_trigger
  file_triggers_enabled         = var.file_triggers_enabled
  organization                  = var.organization
  project_id                    = var.project_id
  queue_all_runs                = var.queue_all_runs
  speculative_enabled           = var.speculative_enabled
  ssh_key_id                    = var.ssh_key_id
  structured_run_output_enabled = var.structured_run_output_enabled
  tag_names                     = var.tag_names
  terraform_version             = var.terraform_version
  trigger_patterns              = var.trigger_patterns
  trigger_prefixes              = var.trigger_prefixes
  working_directory             = var.working_directory

  dynamic "vcs_repo" {
    for_each = var.vcs_repository == null ? [] : [0]

    content {
      branch             = var.vcs_repository.branch
      identifier         = var.vcs_repository.identifier
      ingress_submodules = var.vcs_repository.ingress_submodules
      oauth_token_id     = var.vcs_repository.oauth_token_id
      tags_regex         = var.vcs_repository.tags_regex
    }
  }
}

resource "tfe_workspace_settings" "workspace" {
  workspace_id = tfe_workspace.workspace.id

  agent_pool_id             = var.agent_pool_id
  execution_mode            = var.execution_mode
  global_remote_state       = var.global_remote_state
  remote_state_consumer_ids = var.remote_state_consumer_ids
}

resource "tfe_variable" "workspace" {
  for_each = { for k, v in var.variables : format("%s/%s", v.key, v.category) => v }

  category     = each.value.category
  description  = each.value.description
  hcl          = each.value.hcl
  key          = each.value.key
  sensitive    = each.value.sensitive
  value        = each.value.value
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_run_trigger" "upstream_workspace" {
  for_each = var.run_trigger_ids

  sourceable_id = each.key
  workspace_id  = tfe_workspace.workspace.id
}
