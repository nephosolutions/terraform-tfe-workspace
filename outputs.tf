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

output "id" {
  description = "The workspace identifier."
  value       = tfe_workspace.workspace.id
}

output "name" {
  description = "The workspace name."
  value       = tfe_workspace.workspace.name
}

output "run_triggers_ids" {
  description = "A map run_trigger IDs which link the workspace to the source workspace."
  value       = { for rt_key, rt in tfe_run_trigger.upstream_workspace : rt.id => rt.sourceable_id }
}
