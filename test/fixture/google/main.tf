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

locals {
  google_project_id = "my-gcp-project"
}

module "workspace" {
  source = "../../../modules/google"

  description       = "Test workspace"
  google_project_id = local.google_project_id
  impersonate_sa    = "projects/${local.google_project_id}/serviceAccounts/my-service-account@${local.google_project_id}.iam.gserviceaccount.com"
  name              = "test-workspace"
  organization      = "my-organization"
  terraform_version = "1.3.5"
}
