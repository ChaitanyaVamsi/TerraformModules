module "vote_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${local.common_name_prefix} - catalogue"
  description = "Security group for catalogue with custom ports open within VPC, egress all traffic "
  vpc_id      = data.aws_ssm_parameter.vpc_id.value //tells AWS which VPC to create the security group in.

}
