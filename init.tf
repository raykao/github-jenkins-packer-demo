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
    name     = "customvmimg-${format("%.4x", base64encode(uuid()))}-rg"
    location = "Canada Central"
}

resource "azurerm_storage_account" "test" {
    name = "customvmimgsa${format("%.4x", base64encode(uuid()))}"
    resource_group_name = "${azurerm_resource_group.test.name}"

    location = "${azurerm_resource_group.test.location}"
    account_type = "Premium_LRS"

    tags {
        environment = "staging"
    }
}

output "azure_resource_group_name" {
	value = "${azurerm_resource_group.test.name}"
}

output "azure_storage_account_name" {
	value = "${azurerm_storage_account.test.name}"
}