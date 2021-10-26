terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.12"
    }
  }
}

resource "azurerm_firewall_policy_rule_collection_group" "fwrcg_hub" {
  name               = format("%s%s%s%s", "fwrcg_hub_", var.orgname, var.enviro, var.prjnum)
  firewall_policy_id = var.fwp_hub_id
  priority           = 100

  application_rule_collection {
    name     = "global_app_rule_collection"
    priority = 500
    action   = "Deny"
    rule {
      name = "global_fqdn_blacklist"
      protocols {
        type = "Http"
        port = 80
      }
      protocols {
        type = "Https"
        port = 443
      }
      source_addresses  = ["*"]
      destination_fqdns = var.fqdnblacklist
    }
    rule {
      name                  = "global_web_category_blacklist"
      protocols {
        type = "Http"
        port = 80
      }
      protocols {
        type = "Https"
        port = 443
      }
      source_addresses      = ["*"]
      terminate_tls         = false
      web_categories        = var.web_categories_blacklist
    }
  }
}