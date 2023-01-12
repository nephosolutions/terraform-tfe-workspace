# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

## [4.1.0] - 2023-01-12

Add support for optional VCS configuration attributes `branch`, `ingress_submodules` and `tags_regex`.
Terraform `>= 1.3` is required.

## [4.0.0] - 2022-12-27

- Add support for Workload Identity Federation to integrate Terraform Cloud/Enterprise workspaces with GCP
- Drop support for GCP integration using service accounts keys

## [3.1.0] - 2022-12-10

Add submodule which provisions a workspace tailored for the Google Cloud.

## [3.0.1] - 2022-12-10

Only trigger runs when files in specified paths change.

## [3.0.0] - 2022-12-10

Refactor module structure.

## [2.0.0] - 2019-10-17

- do not decode workspace variable values - expect strings
- drop support for workspace Terraform HCL variables

## [1.2.1] - 2019-10-16

- decode Terraform HCL workspace variable values as `JSON`

## [1.2.0] - 2019-09-26

- implement tfe_notification_configuration
- implement tfe_team_access

## [1.1.0] - 2019-09-21

- output the managed workspace's id & external_id

## [1.0.0] - 2019-09-20

- Initial release

[Unreleased]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v4.1.0...HEAD
[4.1.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v4.1.0
[4.0.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v4.0.0
[3.1.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v3.1.0
[3.0.1]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v3.0.1
[3.0.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v3.0.0
[2.0.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v2.0.0
[1.2.1]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v1.2.1
[1.2.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v1.2.0
[1.1.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v1.1.0
[1.0.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v1.0.0
