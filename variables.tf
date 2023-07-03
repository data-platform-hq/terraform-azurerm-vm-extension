variable "extentions" {
  type = object({
    name                 = optional(string),
    virtual_machine_id   = optional(string),
    publisher            = optional(string, "Microsoft.Azure.Extensions"),
    type                 = optional(string, "CustomScript"),
    type_handler_version = optional(string, "2.0"),
    settings             = optional(string)
  })
  description = "Objects to configure extentions for virtual machine"
}

variable "tags" {
  type        = map(any)
  description = "Resource tags"
  default     = {}
}
