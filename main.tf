resource "azurerm_virtual_machine_extension" "this" {
  name                 = var.extentions.name
  virtual_machine_id   = var.extentions.virtual_machine_id
  publisher            = var.extentions.publisher
  type                 = var.extentions.type
  type_handler_version = var.extentions.type_handler_version
  settings             = var.extentions.settings
  tags                 = var.tags
}
