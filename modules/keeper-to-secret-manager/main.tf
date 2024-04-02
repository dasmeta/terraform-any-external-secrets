//This module reads from Keeper
module "keeper-reader" {
  source = "dasmeta/shared/any//modules/keeper-reader"

  keeper_credentials = var.keeper_credentials
  secrets            = var.secrets
}

//This module writes module.keeper data into GCP secret manager, if var.secret_manager="gcp"
module "secret" {
  count  = var.secret_manager == "gcp" ? 1 : 0
  source = "../gcp-secret"

  secrets = {
    for index, s in var.secrets : s.secret_name => s.secret_type == "login" ? module.keeper-reader.login_secrets[index][s.field] : s.secret_type == "db" ? module.keeper-reader.db_secrets[index][s.field] : module.keeper-reader.ssh_secrets[index][s.field]
  }
}
