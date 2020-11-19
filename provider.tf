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
  access_key = "AKIARCDWTTTQEUPBQ67R"
  secret_key = "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"
}
