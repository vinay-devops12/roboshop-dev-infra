# 1. Create the IAM Role for the Bastion Host
resource "aws_iam_role" "bastion" {
  name = "${local.common_name}-bastion"
  # Define the trust relationship allowing EC2 instances to assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
  tags = merge(
    local.common_tags,
    {
        Name = "${local.common_name}-bastion"
    }
  )
}
# 2. Attach the AWS-managed SSM core policy to the IAM Role
resource "aws_iam_role_policy_attachment" "bastion" {
  role       = aws_iam_role.bastion.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# 3. Create the Instance Profile that EC2 references
resource "aws_iam_instance_profile" "bastion" {
  name = "${local.common_name}-bastion"
  role = aws_iam_role.bastion.name
}