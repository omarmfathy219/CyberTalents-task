variable "region" {
  description = "The AWS region where the resources will be created."
  default     = "us-east-1"
}

variable "name" {
  description = "The name of the EKS cluster."
  default     = "cybertalents-cluster"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.123.0.0/16"
}

variable "azs" {
  description = "The availability zones to use."
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
  description = "The public subnets in the VPC."
  default     = ["10.123.1.0/24", "10.123.2.0/24"]
}

variable "private_subnets" {
  description = "The private subnets in the VPC."
  default     = ["10.123.3.0/24", "10.123.4.0/24"]
}

variable "intra_subnets" {
  description = "The intra subnets in the VPC."
  default     = ["10.123.5.0/24", "10.123.6.0/24"]
}

variable "tags" {
  description = "Additional tags for resources."
  default = {
    company = "cybertalents"
  }
}

# Node pool variables
variable "node_pool1_name" {
  description = "Name of the first node pool."
  default     = "node-pool-1"
}

variable "node_pool1_type" {
  description = "Instance type for the first node pool."
  default     = "t2.micro"
}

variable "node_pool1_taints" {
  description = "Taints for the first node pool."
  default     = [{ key = "app", value = "release 1", effect = "NO_SCHEDULE" }]
}

variable "node_pool2_name" {
  description = "Name of the second node pool."
  default     = "node-pool-2"
}

variable "node_pool2_type" {
  description = "Instance type for the second node pool."
  default     = "t2.micro"
}

variable "node_pool2_taints" {
  description = "Taints for the second node pool."
  default     = [{ key = "app", value = "release 2", effect = "NO_EXECUTE" }]
}
