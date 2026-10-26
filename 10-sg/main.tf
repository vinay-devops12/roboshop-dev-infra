module "sg" {
  count = length(var.sg_names)
  source = "git::https://github.com/vinay-devops12/terraform-aws-sg.git ?ref=main"
  project = var.project
  environment = var.environment
  vpc_id = local.vpc_id  ## direct vpc_id  cant fetch use parameter store(data source)
   sg_name = replace(var.sg_names[count.index], "_", "-")
}