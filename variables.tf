variable "instance_type" {
   description = "Instance type" 
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
variable "ingress_rule" {
   description = "ingress ports"
   default = [
   {
      from_port = 22
      to_port  = 22
},
{
   from_port = 30000
   to_port   = 90090
},
{
   from_port = 3000
   to_port   = 9090
}
]
}

