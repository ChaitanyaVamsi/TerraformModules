# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter

resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.environment}/vpc_id"
  type  = "String"
  value = module.samplecheck_vpc.vpc_id_module
}
