# Copyright (c) Çetin ARDAL
# SPDX-License-Identifier: MIT

locals {
  formatted_timestamp = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
}

variable "default_tags" {
  type        = map(string)
  description = "a set of tags to watermark the resources you deployed with Terraform."
  default = {
    owner       = "richard" // update me
    terraformed = "Do not edit manually."
  }
}
variable "github_owner" {
  type        = string
  description = "Owner of the Github org"
}

variable "github_token" {
  type        = string
  description = "Github token to pass through to mgmt ws"
}

variable "tfe_token" {
  type        = string
  description = "TFE token to pass through to mgmt ws"
}

variable "oauth_token_id" {
  type        = string
  description = "Oauth token ID used for associating workspace to VCS"
}

variable "mgmt_ws_template_prefix" {
  type        = string
  description = "String to prefix the archetype name to give mgmt template repo name"
  default     = "nocode-lz-mgmt-template"
}

variable "tfc_organization" {
  type        = string
  description = "TFC organization"
}
