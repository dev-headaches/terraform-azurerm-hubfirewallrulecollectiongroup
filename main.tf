terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.12"
    }
  }
}

resource "azurerm_firewall_policy_rule_collection_group" "fwrcg_hub" {
  name               = format("%s%s%s%s", "fwrcg_hub_", var.prjname, var.enviro, var.prjnum)
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

  /*nat_rule_collection {
    name     = "nat_rule_collection1"
    priority = 300
    action   = "Dnat"
    rule {
      name                = "nat_rule_collection1_rule1"
      protocols           = ["TCP", "UDP"]
      source_addresses    = ["10.0.0.1", "10.0.0.2"]
      destination_address = "192.168.1.1"
      destination_ports   = ["80", "1000-2000"]
      translated_address  = "192.168.0.1"
      translated_port     = "8080"
    }
  }

  
   network_rule_collection {
    name     = "Network_Collection_Deny"
    priority = 401
    action   = "Deny"
    rule {
      name                  = "default_outbound_deny_all"
      protocols             = ["TCP", "UDP"]
      source_addresses      = ["*"]
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }
  }

  */

  
  
  /*resource "azurerm_firewall_policy" "fwp_parent" {
  name                = format("%s%s%s%s", "fwp_parent_", var.prjname, var.enviro, var.prjnum)
  resource_group_name = var.rgname
  location            = var.location
  sku                 = "Standard"
  dns {
    proxy_enabled = "true"
    servers        = ["8.8.8.8"]
  }

  threat_intelligence_mode = "Alert"

  threat_intelligence_allowlist {
    ip_addresses = ["8.8.8.8", "1.1.1.1"]
    fqdns        = ["www.google.com", "kiloroot.com"]
  }
  
  tags = {
    environment = var.enviro
  }
}*/