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

resource "google_service_account" "workspace" {
  account_id   = "terraform-${lower(module.workspace.id)}"
  description  = "Impersonates service accounts but has no permission on any other resource."
  display_name = "Terraform Cloud workspace ${module.workspace.name}"
  project      = var.google_project_id
}

/* Rotate service account key. */
resource "time_rotating" "workspace_sa_key" {
  rotation_days = var.key_rotation_days

  triggers = {
    tfe_workspace_id = module.workspace.id
  }
}

resource "google_service_account_key" "workspace_sa" {
  service_account_id = google_service_account.workspace.id

  keepers = {
    rotation_time = time_rotating.workspace_sa_key.rotation_rfc3339
  }

  lifecycle {
    create_before_destroy = true
  }
}

/* Impersonate service accounts (create OAuth2 access tokens, sign blobs or JWTs, etc). */
resource "google_service_account_iam_member" "serviceAccountTokenCreator" {
  member             = "serviceAccount:${google_service_account.workspace.email}"
  role               = "roles/iam.serviceAccountTokenCreator"
  service_account_id = var.impersonate_sa
}

/* Run operations as the service account. */
resource "google_service_account_iam_member" "serviceAccountUser" {
  member             = "serviceAccount:${google_service_account.workspace.email}"
  role               = "roles/iam.serviceAccountUser"
  service_account_id = var.impersonate_sa
}
