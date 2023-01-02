# Resource: aws_subnet
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

data "aws_availability_zones" "available" {
  state = "available"

}

resource "aws_subnet" "public_1" {
  # The VPC ID.
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = var.public_subnet_a_cidr_block

  # The AZ for the subnet.
  availability_zone = data.aws_availability_zones.available.names[0]

  # Required for EKS. Instances launched into the subnet should be assigned a public IP address.
  map_public_ip_on_launch = true

  # A map of tags to assign to the resource.
  tags = {
    Name                        = "public-${data.aws_availability_zones.available.names[0]}"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "public_2" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = var.public_subnet_b_cidr_block

  # The AZ for the subnet.
  availability_zone = data.aws_availability_zones.available.names[1]

  # Required for EKS. Instances launched into the subnet should be assigned a public IP address.
  map_public_ip_on_launch = true

  # A map of tags to assign to the resource.
  tags = {
    Name                        = "public-${data.aws_availability_zones.available.names[1]}"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}


# resource "aws_subnet" "public_3" {
#   # The VPC ID
#   vpc_id = aws_vpc.main.id

#   # The CIDR block for the subnet.
#   cidr_block = var.public_subnet_c_cidr_block

#   # The AZ for the subnet.
#   availability_zone = "eu-west-3c"

#   # Required for EKS. Instances launched into the subnet should be assigned a public IP address.
#   map_public_ip_on_launch = true

#   # A map of tags to assign to the resource.
#   tags = {
#     Name                        = "public-eu-west-3c"
#     "kubernetes.io/cluster/eks" = "shared"
#     "kubernetes.io/role/elb"    = 1
#   }
# }


resource "aws_subnet" "private_1" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = var.private_subnet_a_cidr_block

  # The AZ for the subnet.
  availability_zone = data.aws_availability_zones.available.names[0]

  # A map of tags to assign to the resource.
  tags = {
    Name                              = "private-${data.aws_availability_zones.available.names[0]}"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "private_2" {
  # The VPC ID
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = var.private_subnet_b_cidr_block

  # The AZ for the subnet.
  availability_zone = data.aws_availability_zones.available.names[1]

  # A map of tags to assign to the resource.
  tags = {
    Name                              = "private-${data.aws_availability_zones.available.names[1]}"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}

# resource "aws_subnet" "private_3" {
#   # The VPC ID
#   vpc_id = aws_vpc.main.id

#   # The CIDR block for the subnet.
#   cidr_block = var.private_subnet_c_cidr_block

#   # The AZ for the subnet.
#   availability_zone = "eu-west-3c"

#   # A map of tags to assign to the resource.
#   tags = {
#     Name                              = "private-eu-west-3c"
#     "kubernetes.io/cluster/eks"       = "shared"
#     "kubernetes.io/role/internal-elb" = 1
#   }