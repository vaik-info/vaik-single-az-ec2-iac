variable "target_region" {
  description = "Target Region"
  type        = string
  default = "us-west-2"
}

variable "prefix" {
  description = "Prefix"
  type        = string
  default = "single-az-ec2-iac"
}

variable "key_name" {
  description = "EC2 Key Name"
  type        = string
  default = "vaik.info"
}

variable "ingress_ip" {
  description = "EC2 Ingress IP"
  type        = string
  default = "xxx.xxx.xxx.xxx/32"
}

variable "ami_id" {
  description = "AMI id"
  type        = string
  default = "ami-0f00ffaa05e2bd80e"
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default = "g4dn.xlarge"
}