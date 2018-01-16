# Define the region which the infrastructure should be created inside
variable "region" {
  default = "us-west-2"
}

# Define the AMI ID to create the instance (below is Ubuntu)
variable "ami" { default = "ami-6df1e514" }

# Key pair name created on the AWS EC2 page 
  # note .pem/.ppk is not needed here
variable "key_pair" { default = "lukecahill" }