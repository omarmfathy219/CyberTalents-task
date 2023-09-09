# This file is used to create the EKS cluster and the node groups
module "eks" {
  source                         = "terraform-aws-modules/eks/aws"
  version                        = "19.15.1"
  cluster_name                   = var.name
  cluster_endpoint_public_access = true

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  eks_managed_node_group_defaults = {
    ami_type                              = "AL2_x86_64"
    instance_types                        = ["t2.micro"]
    attach_cluster_primary_security_group = true
  }

  eks_managed_node_groups = {
    node-pool-1 = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = [var.node_pool1_type]
      capacity_type  = "ON_DEMAND"
      tags = {
        ExtraTag = "cybertalents-pool1"
      }
      taints = var.node_pool1_taints
    }

    node-pool-2 = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = [var.node_pool2_type]
      capacity_type  = "ON_DEMAND"
      tags = {
        ExtraTag = "cybertalents-pool2"
      }
      taints = var.node_pool2_taints
    }
  }

  tags = var.tags
}
