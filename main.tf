# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

module "aft" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory?ref=1.7.0"
  ct_management_account_id    = var.ct_management_account_id
  log_archive_account_id      = var.log_archive_account_id
  audit_account_id            = var.audit_account_id
  aft_management_account_id   = var.aft_management_account_id
  ct_home_region              = var.ct_home_region
  tf_backend_secondary_region = var.tf_backend_secondary_region

#terraform variables

terraform_version	      = "1.1.9"
terraform_distribution	      = "oss"

  vcs_provider                                  = "github"
  account_request_repo_name                     = "${var.github_username}/learn-terraform-aft-account-request"
  account_provisioning_customizations_repo_name = "${var.github_username}/learn-terraform-aft-account-provisioning-customizations"
  global_customizations_repo_name               = "${var.github_username}/learn-terraform-aft-global-customizations"
  account_customizations_repo_name              = "${var.github_username}/learn-terraform-aft-account-customizations"

#AFT feature flags
  aft_vpc_endpoints				= false
  aft_feature_delete_default_vpcs_enabled 	= true

#AFT VPC Specs
 aft_vpc_cidr					= "10.0.0.0/16"
 aft_vpc_private_subnet_01_cidr			= "10.0.0.0/18"
 aft_vpc_private_subnet_02_cidr 		= "10.0.64.0/18"
 aft_vpc_public_subnet_01_cidr			= "10.0.128.0/18"
 aft_vpc_public_subnet_02_cidr 			= "10.0.192.0/18"
}
