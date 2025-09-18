project           = "Project-UIT-ELK"


machine_type      = "e2-medium"
disk_image        = "ubuntu-2004-focal-v20250408"
disk_size         = 10

public_subnets = {
  "us-central1" = "10.10.0.0/16"
  
}

private_subnets = {
  "asia-southeast1" = "10.20.0.0/16"
}
