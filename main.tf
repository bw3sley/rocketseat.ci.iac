terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.39.0"
    }
  }
}

variable "aws_profile" {
  default = ""
}

provider "aws" {
  region  = "us-east-2"
  profile = var.aws_profile != "" ? var.aws_profile : null
}