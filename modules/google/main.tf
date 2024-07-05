/**
 * Copyright 2019-2024 NephoSolutions srl, Sebastian Trebitz
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

module "tfe_workspace" {
  source = "../../"

  name        = var.name
  description = var.description

  agent_pool_id                 = var.agent_pool_id
  allow_destroy_plan            = var.allow_destroy_plan
  auto_apply                    = var.auto_apply
  auto_apply_run_trigger        = var.auto_apply_run_trigger
  execution_mode                = var.execution_mode
  file_triggers_enabled         = var.file_triggers_enabled
  global_remote_state           = var.global_remote_state
  organization                  = var.organization
  project_id                    = var.tfc_project_id
  queue_all_runs                = var.queue_all_runs
  remote_state_consumer_ids     = var.remote_state_consumer_ids
  speculative_enabled           = var.speculative_enabled
  ssh_key_id                    = var.ssh_key_id
  structured_run_output_enabled = var.structured_run_output_enabled
  tag_names                     = var.tag_names
  terraform_version             = var.terraform_version
  trigger_patterns              = var.trigger_patterns
  trigger_prefixes              = var.trigger_prefixes
  vcs_repository                = var.vcs_repository
  working_directory             = var.working_directory

  variables = setunion(var.variables, [{
    key         = "TFC_GCP_RUN_SERVICE_ACCOUNT_EMAIL"
    value       = google_service_account.tfe_workspace.email
    category    = "env"
    description = "The service account email Terraform Cloud will use when authenticating to GCP."
  }])
}

resource "google_service_account" "tfe_workspace" {
  project      = var.gcp_project_id
  account_id   = lower(module.tfe_workspace.id)
  display_name = title(module.tfe_workspace.name)
  description  = "Used by Terraform Cloud to deploy resources."
}

resource "google_service_account_iam_member" "terraform_workload_identity_user" {
  member = format(
    "principalSet://iam.googleapis.com/%s/attribute.terraform_workspace_id/%s",
    var.workload_identity_pool,
    module.tfe_workspace.id
  )

  role               = "roles/iam.workloadIdentityUser"
  service_account_id = google_service_account.tfe_workspace.id
}

// Allows the service account to create tokens for it self; required to authenticate to 3rd party APIs like Kubernetes.
resource "google_service_account_iam_member" "terraform_service_account_token_creator" {
  member = format(
    "serviceAccount:%s",
    google_service_account.tfe_workspace.email
  )

  role               = "roles/iam.serviceAccountTokenCreator"
  service_account_id = google_service_account.tfe_workspace.id
}
