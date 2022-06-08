terraform {
backend "s3" {
bucket = "aws-jenkins-terraform-bucket-y"
key = "default/terraform.tfstate"
region = "us-east-1"
}
}
