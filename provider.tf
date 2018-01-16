# Specifiy that you are using AWS, and your secret and access keys for this 
  # These can be generated through IAM in the AWS console.
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}