# Azure Vm Extension Terraform module
Terraform module for creation Azure Vm Extension


## Usage
```hcl
# Prerequisite resources

data "azurerm_virtual_machine" "example" {
  name                = "production"
  resource_group_name = "networking"
}

locals {
  extentions = {
    name               = "example"
    virtual_machine_id = data.azurerm_virtual_machine.example.id
    settings = jsonencode({
      "script" : (base64encode(templatefile("./script.sh", {
        var  = "example"
      })))
    })
  }
}

module "virtual_machine_extension" {
  source   = "data-platform-hq/vm-extension/azurerm"
  version  = "~> 1.0"

  extentions = local.extentions
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 4.0.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_machine_extension.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_extensions"></a> [extensions](#input\_extensions) | Objects to configure extentions for virtual machine | <pre>object({<br/>    name                 = string,<br/>    virtual_machine_id   = string,<br/>    publisher            = optional(string, "Microsoft.Azure.Extensions"),<br/>    type                 = optional(string, "CustomScript"),<br/>    type_handler_version = optional(string, "2.0"),<br/>    settings             = optional(string),<br/>    protected_settings   = optional(string),<br/>    tags                 = optional(map(any))<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Virtual Machine Extension. |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azurerm-vm-extension/blob/main/LICENSE)
