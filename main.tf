terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.39.0"
    }
  }

  backend "s3" {
    bucket = "rocketseat-iac-bw3sley"
    key    = "state/terraform.tfstate"
    region = "us-east-2"
  }
}

variable "aws_profile" {
  default = ""
}

provider "aws" {
  region  = "us-east-2"
  profile = var.aws_profile != "" ? var.aws_profile : null
}

resource "aws_s3_bucket" "terraform-state" {
  bucket        = "rocketseat-iac-bw3sley"
  force_destroy = true

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    IAC = "True"
  }
}

resource "aws_s3_bucket_versioning" "terraform-state" {
  bucket = "rocketseat-iac-bw3sley"
  versioning_configuration {
    status = "Enabled"
  }
}