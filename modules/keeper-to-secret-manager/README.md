## Keeper-to-Secret-Manager Module
The `keeper-to-secret-manager` Terraform module transfers secrets from Keeper Security to Cloud Secret Manager. It automates the retrieval of secrets stored in Keeper and their subsequent storage in Cloud Secret Manager.

## Configuration
The module uses 2 modules.

1. Keeper Reader Module
This submodule is responsible for fetching secrets from Keeper Security. It requires API credentials and a list of secrets to fetch, identified by their UIDs and types.

2. Cloud Secret Module
After secrets are fetched from Keeper, this submodule handles the creation or updating of secrets in Cloud Secret Manager.

Currently, only GCP Secret Manager is supported.
`secret_manager` variable is used to specify the cloud for Secret Manager.

### Usage Example
```
module "keeper_to_gcp" {
  source              = "dasmeta/external-secrets/any//modules/keeper-to-secret-manager"

  keeper_credentials  = "/path/to/keeper/config.json"
  secret_manager     = "gcp"
  secrets = [
    {
      secret_type = "db"
      uid         = "YwIOVhxwBBONenOZ6ZlPkg"
      field       = "db_type"
      secret_name = "my-db-type"
    },
    {
      secret_type = "login"
      uid         = "bBdstZ0jCpoA8tZbg1Q8zQ"
      field       = "login"
      secret_name = "my-username"
    }
  ]
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_keeper-reader"></a> [keeper-reader](#module\_keeper-reader) | dasmeta/shared/any//modules/keeper-reader | n/a |
| <a name="module_secret"></a> [secret](#module\_secret) | ../gcp-secret | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_keeper_credentials"></a> [keeper\_credentials](#input\_keeper\_credentials) | Credentials for accessing Keeper. | `string` | n/a | yes |
| <a name="input_secret_manager"></a> [secret\_manager](#input\_secret\_manager) | The secret manager to use. Currently only `gcp` is supported | `string` | `"gcp"` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | Secrets to fetch from Keeper and create in Cloud Secret Manager | <pre>list(object({<br>    secret_type = string<br>    uid         = string<br>    secret_name = string<br>    field       = string<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
