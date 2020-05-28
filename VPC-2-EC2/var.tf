
# AWS ACCESS AND REGION
variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "eu-west-1"
}


# AWS AMIs

variable "AMIs" {
  type = "map"
  default = {
    us-east-1 = "ami-03e33c1cefd1d3d74"
    us-west-1 = "ami-0ee1a20d6b0c6a347"
    eu-west-1 = "ami-0a4fbfab82b4aee91"
  }
}










/*VPC Information*/
variable "terraform-vpc" {
  default     = "10.0.0.0/16"
  description = "Terraform-Vpc"
}

/*Private Subnets*/
/*******************/
variable "main-private-1" {
  default     = "10.0.4.0/24"
  description = "main-private-1"
}
variable "main-private-2" {
  default     = "10.0.5.0/24"
  description = "main-private-3"
}
variable "main-private-3" {
  default     = "10.0.6.0/24"
  description = "main-private-3"
}