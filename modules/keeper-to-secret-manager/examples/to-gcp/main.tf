module "this" {
  source = "../../"

  keeper_credentials = "/path/to/keeper/config.json"
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
    },
    {
      secret_type = "login"
      uid         = "bBdstZ0jCpoA8tZbg1Q8zQ"
      field       = "password"
      secret_name = "my-password"
    },
    {
      secret_type = "db"
      uid         = "YwIOVhxwBBONenOZ6ZlPkg"
      field       = "password"
      secret_name = "my-db-password"
    },
  ]
}
