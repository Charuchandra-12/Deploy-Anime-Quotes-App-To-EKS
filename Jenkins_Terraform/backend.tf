terraform {
  backend "s3" {
    bucket = "jenkins-tfstatefiles"
    key    = "jenkins/terraform.tfsate"
    region = "us-east-1"
  }
}
