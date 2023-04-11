module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"

  ami                         = data.aws_ami.amzlinux2.id
  instance_type               = var.instance_type
  availability_zone           = "us-east-1a"
  key_name                    = var.private_key
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.security-group.security_group_id]

  tags = local.common_tags

}