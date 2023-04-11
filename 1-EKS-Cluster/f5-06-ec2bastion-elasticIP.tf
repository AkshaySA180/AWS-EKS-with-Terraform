resource "aws_eip" "bastion_eip" {
  vpc = true
  instance                  = module.ec2_public.id
  #associate_with_private_ip = "10.0.0.12"
  depends_on                = [module.vpc, module.ec2_public]

  tags = local.common_tags
}