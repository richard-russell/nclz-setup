# Copyright (c) Çetin ARDAL
# SPDX-License-Identifier: MIT

terraform {
  # Terraform cli version
  required_version = ">= 1.5.0"
}

provider "github" {}
provider "tfe" {}

data "github_repositories" "lz_templates" {
  query           = "org:richard-russell template:true ${var.mgmt_ws_template_prefix}- in:name"
  include_repo_id = true
}

locals {
  archetypes = { for template in data.github_repositories.lz_templates.names : trimprefix(template, "${var.mgmt_ws_template_prefix}-") => template }
}

# Project to contain the nocode workspaces
resource "tfe_project" "nclz_nocode" {
  organization = var.tfc_organization
  name         = "nclz-nocode"
}

# core varset to be exposed to nocode and mgmt workspaces
resource "tfe_variable_set" "nclz_core" {
  name         = "nclz_core"
  organization = var.tfc_organization
}

resource "tfe_project_variable_set" "nclz_core" {
  variable_set_id = tfe_variable_set.nclz_core.id
  project_id      = tfe_project.nclz_nocode.id
}

resource "tfe_variable" "github_owner" {
  key             = "github_owner"
  value           = var.github_owner
  category        = "terraform"
  variable_set_id = tfe_variable_set.nclz_core.id
  sensitive       = false
  description     = "Github owner or organization"
}

resource "tfe_variable" "oauth_token_id" {
  key             = "oauth_token_id"
  value           = var.oauth_token_id
  category        = "terraform"
  variable_set_id = tfe_variable_set.nclz_core.id
  sensitive       = true
  description     = "Oauth token ID used for associating workspace to VCS"
}

resource "tfe_variable" "tfc_organization" {
  key             = "tfc_organization"
  value           = var.tfc_organization
  category        = "terraform"
  variable_set_id = tfe_variable_set.nclz_core.id
  sensitive       = false
  description     = "TFC organization"
}

resource "tfe_variable" "TFE_TOKEN" {
  key             = "TFE_TOKEN"
  value           = var.tfe_token
  category        = "env"
  variable_set_id = tfe_variable_set.nclz_core.id
  sensitive       = true
  description     = "TFC token - to pass through to mgmt ws as env variable"
}

resource "tfe_variable" "GITHUB_TOKEN" {
  key             = "GITHUB_TOKEN"
  value           = var.github_token
  category        = "env"
  variable_set_id = tfe_variable_set.nclz_core.id
  sensitive       = true
  description     = "Github token - to pass through to mgmt ws as env variable"
}

# Service Catalog AWS LZ - Basic
resource "tfe_registry_module" "awslz_sc_basic" {
  organization = var.tfc_organization
  vcs_repo {
    display_identifier = "${var.github_owner}/terraform-tfe-nocode-lz-sc-aws-basic"
    identifier         = "${var.github_owner}/terraform-tfe-nocode-lz-sc-aws-basic"
    oauth_token_id     = var.oauth_token_id
    branch             = "main"
  }
  test_config {
    tests_enabled = false
  }
}

resource "tfe_no_code_module" "awslz_sc_basic" {
  organization    = var.tfc_organization
  registry_module = tfe_registry_module.awslz_sc_basic.id

  variable_options {
    name = "envs"
    type = "string"
    options = ["prod",
      "dev,test,prod",
    "dev,test,staging,prod"]
  }
}

# Franchise AWS LZ - Basic
resource "tfe_registry_module" "awslz" {
  organization = var.tfc_organization
  vcs_repo {
    display_identifier = "${var.github_owner}/terraform-tfe-nocode-lz-flexible-aws"
    identifier         = "${var.github_owner}/terraform-tfe-nocode-lz-flexible-aws"
    oauth_token_id     = var.oauth_token_id
    branch             = "main"
  }
  test_config {
    tests_enabled = false
  }
}

resource "tfe_no_code_module" "awslz" {
  organization    = var.tfc_organization
  registry_module = tfe_registry_module.awslz.id

  variable_options {
    name    = "lz_archetype"
    type    = "string"
    options = keys(local.archetypes)
  }
}

output "templates" {
  value = local.archetypes
}