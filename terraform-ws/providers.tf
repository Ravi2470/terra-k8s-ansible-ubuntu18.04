
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


provider "aws" {
  region     = "ap-northeast-1"
  access_key = "AKIA4PQ5PXF3PPPFTGUP"
  secret_key = "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"
}
