variable "enviro" {
  type        = string
  description = "define the environment ex. dev,tst,prd,stg"
}

variable "prjname" {
  type        = string
  description = "define the project name ex. prj02"
}

variable "prjnum" {
  type        = string
  description = "define the project number for TFstate file ex. 4858"
}

variable "location" {
  type        = string
  description = "location of your resource group"
}

variable "rgname" {
  type        = string
  description = "the name of the resource group in which to deploy the resource groups"
}

variable "fwp_hub_id" {
  type =      string
  description = "the ID of the firewall policy that you want to add this rule collection to."
}

variable "web_categories_blacklist" {
  type = list
}

variable "fqdnblacklist" {
  type = list
}