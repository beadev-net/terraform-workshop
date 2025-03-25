variable "env" {
  description = "The environment for the resources"
  type        = string
}

variable "resource_group_name" {
  type    = string
  default = "my-test-rg"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "storage_account" {
  type = object({
    name            = string
    min_tls_version = optional(string)
  })
}