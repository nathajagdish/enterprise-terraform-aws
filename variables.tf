variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI ID for Sydney region"
  type        = string
  default     = "ami-0b64008f51a461dfa"
}
