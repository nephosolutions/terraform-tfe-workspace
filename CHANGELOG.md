# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

FEATURES:
* `tfe_workspace`: Add `auto_apply_run_trigger` attribute

## [5.0.1] - 2023-12-23

BUG FIXES:
* make the argument `terraform_version` optional

## [5.0.0] - 2023-12-23

BREAKING CHANGES:
* The submodule `workload_identity` has been removed
* Update the TFE provider to >= 0.51.0

FEATURES:
* Configure an optional set of workspace variables
* **New Resource**: manage execution mode and agent pool settings in `tfe_workspace_settings`

## [4.2.0] - 2023-01-27

FEATURES:
* add support for Terraform Cloud Projects to organize workspaces at scale.

## [4.1.0] - 2023-01-12

BREAKING CHANGES:
* Terraform `>= 1.3` is required.

FEATURES:
*add support for optional VCS configuration attributes `branch`, `ingress_submodules` and `tags_regex`.

## [4.0.0] - 2022-12-27

BREAKING CHANGES:
* drop support for GCP integration using service accounts keys

FEATURES:
* add support for Workload Identity Federation to integrate Terraform Cloud/Enterprise workspaces with GCP

## [3.1.0] - 2022-12-10

FEATURES:
* add submodule which provisions a workspace tailored for the Google Cloud

## [3.0.1] - 2022-12-10

BUG FIXES:
* trigger runs only when files in specified paths change

## [3.0.0] - 2022-12-10

BREAKING CHANGES:
* refactor module structure

## [2.0.0] - 2019-10-17

BREAKING CHANGES:
* do not decode workspace variable values - expect strings
* drop support for workspace Terraform HCL variables

## [1.2.1] - 2019-10-16

BUG FIXES:
* decode Terraform HCL workspace variable values as `JSON`

## [1.2.0] - 2019-09-26

FEATURES:
* **New Resource**: `tfe_notification_configuration`
* **New Resource**: `tfe_team_access`

## [1.1.0] - 2019-09-21

FEATURES:
* output the workspace `id` and `external_id` attributes

## [1.0.0] - 2019-09-20

Initial release

[Unreleased]: https://github.com/nephosolutions/terraform-tfe-workspace/compare/v5.0.1...HEAD
[5.0.1]: https://github.com/nephosolutions/terraform-tfe-workspace/releases/tag/v5.0.1
[5.0.0]: https://github.com/nephosolutions/terraform-tfe-workspace/releases/tag/v5.0.0
[4.2.0]: https://github.com/nephosolutions/terraform-tfe-workspace/releases/tag/v4.2.0
[4.1.0]: https://github.com/nephosolutions/terraform-tfe-workspace/releases/tag/v4.1.0
[4.0.0]: https://github.com/nephosolutions/terraform-tfe-workspace/releases/tag/v4.0.0
[3.1.0]: https://github.com/nephosolutions/terraform-tfe-workspace/releases/tag/v3.1.0
[3.0.1]: https://github.com/nephosolutions/terraform-tfe-workspace/releases/tag/v3.0.1
[3.0.0]: https://github.com/nephosolutions/terraform-tfe-workspace/releases/tag/v3.0.0
[2.0.0]: https://github.com/nephosolutions/terraform-tfe-workspace/releases/tag/v2.0.0
[1.2.1]: https://github.com/nephosolutions/terraform-tfe-workspace/releases/tag/v1.2.1
[1.2.0]: https://github.com/nephosolutions/terraform-tfe-workspace/releases/tag/v1.2.0
[1.1.0]: https://github.com/nephosolutions/terraform-tfe-workspace/releases/tag/v1.1.0
[1.0.0]: https://github.com/nephosolutions/terraform-tfe-workspace/releases/tag/v1.0.0
