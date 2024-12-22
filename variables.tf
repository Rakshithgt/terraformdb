# variable "aws_access_key" {}
# variable "aws_secret_key" {}
variable "aws_region" {}
variable "amis" {
  description = "AMIs by region"
  default = {
    ap-south-1a    = "ami-053b12d3152c0cc71"
    ap-south-1b    = "ami-053b12d3152c0cc71"
    ap-norteast-3a = "ami-0b40dea19b4538863"
    ap-norteast-3b = "ami-0b40dea19b4538863"
  }
}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "IGW_name" {}
variable "key_name" {}
variable "public_subnet1_cidr" {}
variable "public_subnet2_cidr" {}
variable "public_subnet3_cidr" {}
# variable "private_subnet_cidr" {}
variable "public_subnet1_name" {}
variable "public_subnet2_name" {}
variable "public_subnet3_name" {}
# variable "private_subnet_name" {}
variable "Main_Routing_Table" {}
variable "azs" {
  description = "Run the EC2 Instances in these Availability Zones"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}
variable "environment" { default = "dev" }
variable "env" {}
variable "instance_type" {
  type = map(string)
  default = {
    dev  = "t2.nano"
    test = "t2.micro"
    prod = "t2.medium"
  }
}


