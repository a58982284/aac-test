terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">= 2.1.0"
    }
    utils = {
      source  = "cloudposse/utils"
      version = ">= 0.15.0"
    }
  }
}

provider "aci" {
  username = var.apic_user
  password = var.apic_pwd
  url      = var.apic_url
  insecure = true
  retries  = 3
}

module "aci" {
  source  = "netascode/nac-aci/aci"
  version = "0.7.0"

  yaml_directories = ["data"]

  manage_access_policies    = false
  manage_fabric_policies    = false
  manage_pod_policies       = false
  manage_node_policies      = false
  manage_interface_policies = false
  manage_tenants            = true

  write_default_values_file = "defaults.yaml"
}
