terraform {
  backend "s3" {
    region = var.region
  }
}

provider "aws" {
  region = var.region
  assume_role {
    role_arn = "arn:aws:iam::${var.account_no}:role/JenkinsRole"
  }
}