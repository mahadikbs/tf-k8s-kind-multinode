variable "instance_type" {
  default = "t3.medium"
}

variable "ami_id" {
  description = "Ubuntu 22.04 AMI for ap-south-1"
  default     = "ami-09e6f87a47903347c"
}

variable "public_key_path" {
  description = "Path to your public SSH key"
  default     = "~/.ssh/id_rsa.pub"
}
