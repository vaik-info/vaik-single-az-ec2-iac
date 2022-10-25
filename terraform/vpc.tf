module "vpc" {
  source  = "registry.terraform.io/terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name                 ="${var.prefix}instance"
  cidr                 = "10.0.0.0/16"
  azs                  = ["${data.aws_availability_zones.azs.names[0]}"]
  public_subnets       = ["10.0.4.0/24"]
  enable_nat_gateway   = false
  single_nat_gateway   = false
  enable_dns_hostnames = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}