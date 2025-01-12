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

output "workspace_id" {
  description = "The workspace identifier."
  value       = module.tfe_workspace.id
}

output "workspace_name" {
  description = "The workspace name."
  value       = module.tfe_workspace.name
}

output "run_triggers_ids" {
  description = "A map run_trigger IDs which link the workspace to the source workspace."
  value       = module.tfe_workspace.run_triggers_ids
}

output "service_account_email" {
  description = "The Terraform Cloud workspace service account."
  value       = google_service_account.tfe_workspace.email
}
