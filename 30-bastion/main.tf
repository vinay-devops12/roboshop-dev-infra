# Launch the Bastion Host Instance
resource "aws_instance" "bastion" {
  ami                    = data.aws_ami.joindevops.id
  instance_type          = "t3.micro"
  subnet_id              = local.public_subnet_id
  vpc_security_group_ids = [local.bastion_sg_id]
   user_data = templatefile("${path.module}/bastion.sh.tftpl", {
    partition_number = 4
    extend_size = 30
  })

  # Increase root volume to 30GB
  root_block_device {
    volume_size = 30
    volume_type = "gp3"
    encrypted   = true
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${local.common_name}-bastion"
    }
  )
}