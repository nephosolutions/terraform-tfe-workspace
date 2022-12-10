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

output "id" {
  description = "The workspace ID."
  value       = module.workspace.id
}

output "name" {
  description = "The workspace name."
  value       = module.workspace.name
}

output "tfe_workspace_sa" {
  description = "The Google Cloud service account for the TFE workspace."
  value       = google_service_account.workspace.email
}
