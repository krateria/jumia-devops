variable "key_name" {}

resource "tls_private_key" "jumia" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.jumia.public_key_openssh
}

output "key_name" {
  value     = tls_private_key.jumia.private_key_openssh
  sensitive = true
}

# Launch template for the worker nodes
resource "aws_launch_template" "eks-nodes-launch" {
  name = "prod"

  instance_type = var.eks_instance_type
  key_name = aws_key_pair.generated_key.key_name
  
  vpc_security_group_ids = [aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id]


  user_data = filebase64("./scripts/launch-template-script.sh")
}