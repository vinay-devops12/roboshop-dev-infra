locals {
    mongodb_sg_id = "data.aws_ssm_parameter.mongodb_sg_id"
    database_subnet_id = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0]
     ami = data.aws_ami.joindevops.id
     common_name = "${var.project}-${var.environment}"

     common_tags ={
        project = var.project
        environment = var.environment
     }
}