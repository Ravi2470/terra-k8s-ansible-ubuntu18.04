
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
  access_key = "your-access-key"
  secret_key = "your-secret-key"
}
