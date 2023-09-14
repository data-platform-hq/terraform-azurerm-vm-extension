variable "extensions" {
  type = object({
    name                 = string,
    virtual_machine_id   = string,
    publisher            = optional(string, "Microsoft.Azure.Extensions"),
    type                 = optional(string, "CustomScript"),
    type_handler_version = optional(string, "2.0"),
    settings             = optional(string),
    protected_settings   = optional(string),
    tags                 = optional(map(any))
  })
  description = "Objects to configure extentions for virtual machine"
}
