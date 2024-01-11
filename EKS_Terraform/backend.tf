terraform {
  backend "s3" {
    bucket = "eks-state-files"
    key    = "eks/terraform.tfsate"
    region = "us-east-1"
  }
}