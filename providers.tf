terraform {
  required_version = "1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.55.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "aws-compute-static-web-app-tfstate"
    key            = "aws_compute_static_web_app.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "aws-compute-static-web-app-tfstate"
  }
}

provider "aws" {
  region = "eu-north-1"
  default_tags {
    tags = {
      project = "aws_compute_static_web_app"
    }
  }
}
