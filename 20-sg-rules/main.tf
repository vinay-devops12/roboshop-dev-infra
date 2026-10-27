     ## mongodb
resource "aws_security_group_rule" "mongodb_catalogue" {
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  security_group_id        = local.mongodb_sg_id
  source_security_group_id = local.catalogue_sg_id
  description              = "Allow MongoDB connection from catalogue service"
}

resource "aws_security_group_rule" "mongodb_user" {
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  security_group_id        = local.mongodb_sg_id
  source_security_group_id = local.user_sg_id
  description              = "Allow MongoDB connection from user service"
}

resource "aws_security_group_rule" "mongodb_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = local.mongodb_sg_id
  source_security_group_id = local.bastion_sg_id
  description              = "Allow MongoDB connection from bastion service"
}
  ## redis
resource "aws_security_group_rule" "redis_user" {
  type                     = "ingress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  security_group_id        = local.redis_sg_id
  source_security_group_id = local.user_sg_id
  description              = "Allow redis connection from user service"
}

resource "aws_security_group_rule" "redis_cart" {
  type                     = "ingress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  security_group_id        = local.redis_sg_id
  source_security_group_id = local.cart_sg_id
  description              = "Allow redis connection from cart service"
}

resource "aws_security_group_rule" "redis_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = local.redis_sg_id
  source_security_group_id = local.bastion_sg_id
  description              = "Allow redis connection from bastion service"
}

    ## mysql
resource "aws_security_group_rule" "mysql_shipping" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = local.mysql_sg_id
  source_security_group_id = local.shipping_sg_id
  description              = "Allow mysql connection from shipping service"
}
resource "aws_security_group_rule" "mysql_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = local.mysql_sg_id
  source_security_group_id = local.bastion_sg_id
  description              = "Allow mysql connection from bastion service"
}
     ## rabbitmq
resource "aws_security_group_rule" "rabbitmq_payment" {
  type                     = "ingress"
  from_port                = 5672
  to_port                  = 5672
  protocol                 = "tcp"
  security_group_id        = local.rabbitmq_sg_id
  source_security_group_id = local.payment_sg_id
  description              = "Allow mysql connection from bastion service"
}
resource "aws_security_group_rule" "rabbitmq_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = local.rabbitmq_sg_id
  source_security_group_id = local.bastion_sg_id
  description              = "Allow rabbitmq connection from bastion service"
}
       ## catalogue
resource "aws_security_group_rule" "catalogue_backend_alb" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = local.catalogue_sg_id
  source_security_group_id = local.backend_alb_sg_id
  description              = "Allow catalogue connection from backend_alb_sg_id service"
}

resource "aws_security_group_rule" "catalogue_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = local.catalogue_sg_id
  source_security_group_id = local.bastion_sg_id
  description              = "Allow catalogue connection from bastion service"
}
       ## user
resource "aws_security_group_rule" "user_backend_alb" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = local.user_sg_id
  source_security_group_id = local.backend_alb_sg_id
  description              = "Allow user connection from backend_alb_sg_id service"
}

resource "aws_security_group_rule" "user_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = local.user_sg_id
  source_security_group_id = local.bastion_sg_id
  description              = "Allow user connection frombastion service"
}
         ## cart
resource "aws_security_group_rule" "cart_backend_alb" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = local.cart_sg_id
  source_security_group_id = local.backend_alb_sg_id
  description              = "Allow cart connection from backend_alb_sg_id service"
}
resource "aws_security_group_rule" "cart_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = local.cart_sg_id
  source_security_group_id = local.bastion_sg_id
  description              = "Allow cart connection frombastion service"
}
   ## shipping
resource "aws_security_group_rule" "shipping_backend_alb" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = local.shipping_sg_id
  source_security_group_id = local.backend_alb_sg_id
  description              = "Allow shipping connection from backend_alb_sg_id service"
}

resource "aws_security_group_rule" "shipping_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = local.shipping_sg_id
  source_security_group_id = local.bastion_sg_id
  description              = "Allow shipping connection frombastion service"
}
          ## payment
resource "aws_security_group_rule" "payment_backend_alb" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = local.payment_sg_id
  source_security_group_id = local.backend_alb_sg_id
  description              = "Allow paymentg connection from backend_alb_sg_id service"
}
resource "aws_security_group_rule" "payment_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = local.payment_sg_id
  source_security_group_id = local.bastion_sg_id
  description              = "Allow payment connection from bastion service"
}

       ## backend_alb
resource "aws_security_group_rule" "backend_alb_frontend" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = local.backend_alb_sg_id
  source_security_group_id = local.frontend_sg_id
  description              = "Allow backend connection from frontend_alb service"
}
resource "aws_security_group_rule" "backend_alb_bastion" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = local.backend_alb_sg_id
  source_security_group_id = local.bastion_sg_id
  description              = "Allow backend connection from bastion service"
}

resource "aws_security_group_rule" "backend_alb_catalogue" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = local.backend_alb_sg_id
  source_security_group_id = local.catalogue_sg_id
  description              = "Allow backend connection from catalogue service"
}

resource "aws_security_group_rule" "backend_alb_user" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = local.backend_alb_sg_id
  source_security_group_id = local.user_sg_id
  description              = "Allow backend connection from user service"
}

resource "aws_security_group_rule" "backend_alb_cart" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = local.backend_alb_sg_id
  source_security_group_id = local.cart_sg_id
  description              = "Allow backend connection from cart service"
}
resource "aws_security_group_rule" "backend_alb_shipping" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = local.backend_alb_sg_id
  source_security_group_id = local.shipping_sg_id
  description              = "Allow backend connection from shipping service"
}

resource "aws_security_group_rule" "backend_alb_payment" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = local.backend_alb_sg_id
  source_security_group_id = local.payment_sg_id
  description              = "Allow backend connection from payment service"
}

 ## frontend
resource "aws_security_group_rule" "frontend_frontend_alb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = local.frontend_sg_id
  source_security_group_id = local.frontend_alb_sg_id
  description              = "Allow frontend connection from frontend_alb service"
}
resource "aws_security_group_rule" "frontend_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = local.frontend_sg_id
  source_security_group_id = local.bastion_sg_id
  description              = "Allow frontend connection from bastion service"
}
  ## https
resource "aws_security_group_rule" "frontend_alb_https" {
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  cidr_blocks =               [ "0.0.0.0/0" ]
  security_group_id        = local.frontend_alb_sg_id
  description              = "Allow frontend_alb.sg_id connection from https service"
}
    ## http
 resource "aws_security_group_rule" "frontend_alb_http" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  cidr_blocks =               [ "0.0.0.0/0" ]
  security_group_id        = local.frontend_alb_sg_id
  description              = "Allow frontend_alb_sg_id connection from http service"
}
## generally bastion connect to vpn but present iam using my_public_ip

resource "aws_security_group_rule" "bastion_my_public_ip" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  security_group_id = local.bastion_sg_id
  description       = "Allow SSH inbound from local workstation public IP"
}


