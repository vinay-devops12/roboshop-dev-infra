resource "aws_ssm_parameter" "vpc_id" {
  name        = "/${var.project}/${var.environment}/vpc_id"
  description = "The ID of the primary development VPC"
  type        = "String"
  value       = module.vpc.vpc_id
  overwrite   = true
}

resource "aws_ssm_parameter" "public_subnet-ids" {
  name        = "/${var.project}/${var.environment}/public_subnet-ids"
  description = "Comma-separated public subnet IDs"
  type        = "StringList"
  value       = join(",", module.vpc.public_subnet_ids)
  overwrite   = true
}

resource "aws_ssm_parameter" "private_subnets-ids" {
  name        = "/${var.project}/${var.environment}/private_subnets-ids"
  description = "Comma-separated private subnet IDs"
  type        = "String"
   value = join(",", module.vpc.private_subnet_ids)
  overwrite   = true
}

resource "aws_ssm_parameter" "database_subnets-ids" {
  name        = "/${var.project}/${var.environment}/database_subnets-ids"
  description = "Comma-separated database subnet IDs"
  type        = "String"
  value = join(",", module.vpc.database_subnet_ids)
  overwrite   = true
}

