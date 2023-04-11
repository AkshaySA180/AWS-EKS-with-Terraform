module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  name = "${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr_block

  azs                 = ["us-east-1a", "us-east-1b"]
  private_subnets     = var.vpc_private_subnets
  public_subnets      = var.vpc_public_subnets

  create_database_subnet_group = true
  create_database_subnet_route_table = true
  database_subnets    = var.vpc_database_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  
  tags = local.common_tags
  vpc_tags = local.common_tags

  public_subnet_tags = {
    Type = "Public Subnets"
    "kubernetes.io/role/elb" = 1    
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"        
  }
  private_subnet_tags = {
    Type = "private-subnets"
    "kubernetes.io/role/internal-elb" = 1    
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"    
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

}