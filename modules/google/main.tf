# Copyright 2019-2022 NephoSolutions srl, Sebastian Trebitz
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

module "workspace" {
  source = "../../"

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
  vcs_repo                      = var.vcs_repo
  working_directory             = var.working_directory
}

resource "tfe_variable" "google_credentials" {
  category     = "terraform"
  description  = "The Google Cloud credentials for the TFE workspace service account in JSON format."
  key          = "google_credentials"
  sensitive    = true
  value        = base64decode(google_service_account_key.workspace_sa.private_key)
  workspace_id = module.workspace.id
}
