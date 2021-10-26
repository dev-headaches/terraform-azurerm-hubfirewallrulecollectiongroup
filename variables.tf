variable "enviro" {
  type        = string
  description = "define the environment ex. dev,tst,prd,stg"
}
variable "prjnum" {
  type        = string
  description = "define the project number for TFstate file ex. 4858"
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