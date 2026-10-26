resource "aws_ssm_parameter" "sg_id" {
  name  ="/${var.project}/${var.environment}/sg_id"
  type  = "String"
    value = module.sg[count.index].sg_id
  overwrite = true
}
