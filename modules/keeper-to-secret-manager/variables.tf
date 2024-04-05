variable "secrets" {
  description = "Secrets to fetch from Keeper and create in Cloud Secret Manager"
  type = list(object({
    secret_type = string
    uid         = string
    secret_name = string
    field       = string
  }))
}

variable "keeper_credentials" {
  description = "Credentials for accessing Keeper."
  type        = string
}

variable "secret_manager" {
  description = "The secret manager to use. Currently only `gcp` is supported"
  type        = string
  default     = "gcp"
}
