
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

/*SSH Key Name*/
variable "key_name" {
  default     = "terraform-key"
  description = "this to access terraform instance with this key"
}



