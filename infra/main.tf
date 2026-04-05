terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "Provided"
    workspaces {
      tags = ["prod"]
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.8.2"
    }
  }
}

removed {
  from = cloudflare_zone.prod_domain

  lifecycle {
    destroy = false
  }
}

resource "cloudflare_workers_kv_namespace" "messages" {
  account_id = var.cloudflare_account_id
  title      = "fmrl-${var.environment}-messages"
}
