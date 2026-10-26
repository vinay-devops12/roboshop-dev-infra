resource "aws_ssm_parameter" "sg_id" {
  count     = length(var.sg_names)
  name = "/${var.project}/${var.environment}/${replace(var.sg_names[count.index], "_", "-")}_sg_id"
  type  = "String"
    value = module.sg[count.index].sg_id
  overwrite = true
}
