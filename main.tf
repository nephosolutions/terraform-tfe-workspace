# Copyright 2019 NephoSolutions SPRL, Sebastian Trebitz
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

resource "tfe_workspace" "managed" {
  name         = var.name
  organization = var.organization

  auto_apply            = var.auto_apply
  file_triggers_enabled = var.file_triggers_enabled
  queue_all_runs        = var.queue_all_runs
  ssh_key_id            = var.ssh_key_id
  terraform_version     = var.terraform_version
  trigger_prefixes      = var.trigger_prefixes

  dynamic "vcs_repo" {
    for_each = lookup(var.vcs_repo, "identifier", "void") == "void" ? [] : [var.vcs_repo]
    content {
      branch             = lookup(var.vcs_repo, "branch", null)
      identifier         = lookup(var.vcs_repo, "identifier", null)
      ingress_submodules = lookup(var.vcs_repo, "ingress_submodules", null)
      oauth_token_id     = lookup(var.vcs_repo, "oauth_token_id", null)
    }
  }

  working_directory = var.working_directory
}

resource "tfe_team_access" "managed" {
  for_each     = var.team_access
  access       = each.value
  team_id      = each.key
  workspace_id = tfe_workspace.managed.id
}

resource "tfe_notification_configuration" "managed" {
  for_each         = var.notifications
  name             = each.key
  destination_type = each.value.configuration["destination_type"]
  enabled          = lookup(each.value.configuration, "enabled", true)
  token            = lookup(each.value.configuration, "token", null)
  triggers         = each.value.triggers
  url              = each.value.configuration["url"]
  workspace_id     = tfe_workspace.managed.external_id
}

resource "tfe_variable" "environment" {
  for_each = lookup(var.variables, "environment", {})

  category  = "env"
  key       = each.key
  value     = each.value
  sensitive = false

  workspace_id = tfe_workspace.managed.id
}

resource "tfe_variable" "environment_sensitive" {
  for_each = lookup(var.variables, "environment_sensitive", {})

  category  = "env"
  key       = each.key
  value     = each.value
  sensitive = true

  workspace_id = tfe_workspace.managed.id
}

resource "tfe_variable" "terraform" {
  for_each = lookup(var.variables, "terraform", {})

  category  = "terraform"
  key       = each.key
  value     = each.value
  sensitive = false

  workspace_id = tfe_workspace.managed.id
}

resource "tfe_variable" "terraform_sensitive" {
  for_each = lookup(var.variables, "terraform_sensitive", {})

  category  = "terraform"
  key       = each.key
  value     = each.value
  sensitive = true

  workspace_id = tfe_workspace.managed.id
}
