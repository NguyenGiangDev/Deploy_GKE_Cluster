variable "location" {
  description = "Vị trí (region) để deploy resource"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Tên Resource Group"
  type        = string
  default     = "devops-rg"
}

variable "vnet_name" {
  description = "Tên Virtual Network"
  type        = string
  default     = "devops-vnet"
}

variable "vnet_address_space" {
  description = "CIDR cho VNet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "public_subnet_name" {
  description = "Tên Public Subnet"
  type        = string
  default     = "public-subnet"
}

variable "public_subnet_prefix" {
  description = "CIDR cho Public Subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "private_subnet_name" {
  description = "Tên Private Subnet"
  type        = string
  default     = "private-subnet"
}

variable "private_subnet_prefix" {
  description = "CIDR cho Private Subnet"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "aks_cluster_name" {
  description = "Tên AKS Cluster"
  type        = string
  default     = "devops-aks"
}

variable "aks_dns_prefix" {
  description = "DNS prefix cho AKS"
  type        = string
  default     = "devopsaks"
}

variable "aks_node_count" {
  description = "Số lượng node trong AKS"
  type        = number
  default     = 3
}

variable "aks_vm_size" {
  description = "VM Size cho node"
  type        = string
  default     = "Standard_B2s"
}
