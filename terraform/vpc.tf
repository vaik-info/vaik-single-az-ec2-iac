module "vpc" {
  source  = "registry.terraform.io/terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name                 ="${var.prefix}instance"
  cidr                 = "10.0.0.0/16"
  azs                  = ["${var.target_region}a"]
  private_subnets      = ["10.0.1.0/24"]
  public_subnets       = ["10.0.4.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}