terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.23"
    }
  }
  required_version = ">=1.5"
}
provider "aws" {
  region = "us-east-1"
}