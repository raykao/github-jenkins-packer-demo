variable "azure_subscription_id" {
  type = "string"
}

variable "azure_tenant_id" {
  type = "string"
}

variable "azure_client_id" {
  type = "string"
}

variable "azure_client_secret" {
  type = "string"
}

provider "azurerm" {
  subscription_id = "${var.azure_subscription_id}"
  tenant_id       = "${var.azure_tenant_id}"
  client_id       = "${var.azure_client_id}"
  client_secret   = "${var.azure_client_secret}"
}

resource "azurerm_resource_group" "test" {
    name     = "terraformtest"
    location = "Canada Central"
}

resource "azurerm_storage_account" "testsa" {
    name = "virtualmachinetestsa"
    resource_group_name = "${azurerm_resource_group.test.name}"

    location = "${azurerm_resource_group.test.location}"
    account_type = "Premium_LRS"

    tags {
        environment = "staging"
    }
}