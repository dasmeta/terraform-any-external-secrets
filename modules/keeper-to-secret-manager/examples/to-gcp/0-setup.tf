terraform {
  required_providers {
    secretsmanager = {
      source  = "Keeper-Security/secretsmanager"
      version = "1.1.3"
    }
  }
}

provider "google" {
  project     = "my-project"
  region      = "us-east1"
  credentials = file("/path/to/gcp/config.json")
}

provider "secretsmanager" {
  credential = file("/path/to/keeper/config.json")
}
