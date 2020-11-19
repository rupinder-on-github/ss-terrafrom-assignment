terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
  access_key = "AKIARCDWTTTQKWFNRLGO"
  secret_key = "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"
}
