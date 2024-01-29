# Copyright (c) Çetin ARDAL
# SPDX-License-Identifier: MIT

terraform {
  # Uncomment and adjust providers version according to your needs
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.42.0"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.51.1"
    }

    # hcp = {
    #   source  = "hashicorp/hcp"
    #   version = "0.67.0"
    # }
    # aws = {
    #   source  = "hashicorp/aws"
    #   version = "5.10.0"
    # }
    # azurerm = {
    #   source  = "hashicorp/azurerm"
    #   version = "3.43.0"
    # }
    # google = {
    #   source  = "hashicorp/google"
    #   version = "4.75.1"
    # }
    # oci = {
    #   source = "oracle/oci"
    #   version = "5.6.0"
    # }
    # alicloud = {
    #   source = "aliyun/alicloud"
    #   version = "1.208.0"
    # }
    # kubernetes = {
    #   source = "hashicorp/kubernetes"
    #   version = "2.22.0"
    # }
  }
}
