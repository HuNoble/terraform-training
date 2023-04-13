terraform {
  cloud {
    organization = "poniform"

    workspaces {
      prefix = "terraform-training-"
    }
  }
  required_version = "~> 1.4.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.26.0, <= 5.0.0"
    }
  }
}

provider "google" {
  credentials = var.GOOGLE_CREDENTIALS
  project = "abels-magical-playground"
}
