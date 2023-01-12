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

module "workspace" {
  source = "../../../"


  description       = "Test workspace"
  name              = "test-workspace"
  organization      = "my-organization"
  terraform_version = "1.3.5"

  vcs_repo = {
    branch         = "test"
    identifier     = "nephosolutions/terraform-tfe-workspace"
    oauth_token_id = "foobar"
  }
}
