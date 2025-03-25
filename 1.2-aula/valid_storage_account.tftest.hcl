run "resource_group_created" {
  command = plan

  assert {
    condition     = azurerm_resource_group.my_rg.name == var.resource_group_name
    error_message = "Resource Group name does not match the expected value."
  }
}

run "storage_account_created" {
  command = plan

  assert {
    condition     = azurerm_storage_account.my_storage_account.name == var.storage_account_name
    error_message = "Storage Account name does not match expected value."
  }
}

run "storage_container_created" {
  command = plan
  
  assert {
    condition     = azurerm_storage_container.my_container.name == "vinicius"
    error_message = "Storage container was not created correctly."
  }
}
