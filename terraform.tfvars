location             = "eastus"
resource_group_name  = "devops-rg"
vnet_name            = "devops-vnet"
vnet_address_space   = ["10.0.0.0/16"]

public_subnet_name   = "public-subnet"
public_subnet_prefix = ["10.0.1.0/24"]

private_subnet_name  = "private-subnet"
private_subnet_prefix = ["10.0.2.0/24"]

aks_cluster_name = "devops-aks"
aks_dns_prefix   = "devopsaks"
aks_node_count   = 3
aks_vm_size      = "Standard_B2s"
