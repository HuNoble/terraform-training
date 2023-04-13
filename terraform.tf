terraform {
#  cloud {
#    organization = "poniform"
#
#    workspaces {
#      name = "academo"
#    }
#  }
  backend "gcs" {
    bucket  = "abels-terraform-state"
  }
  required_version = "~> 1.2.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.26.0, <= 5.0.0"
    }
  }
}

provider "google" {
  credentials = file("abels-magical-playground.json")
  project = "abels-magical-playground"
}
