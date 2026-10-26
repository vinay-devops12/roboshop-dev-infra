module "vpc" {
 source = "git::https://github.com/vinay-devops12/terraform-aws-vpc.git?ref=main"
 project = var.project
 environment = var.environment
 is_peering_required = false
}