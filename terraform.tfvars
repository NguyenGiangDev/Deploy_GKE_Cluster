project           = "devops-group22"
credentials_file  = "~/.ssh/devops-group22-f7026c17c139.json"
ssh_pub_key_path  = "~/.ssh/my_gcp_key.pub"


machine_type      = "e2-medium"
disk_image        = "ubuntu-2004-focal-v20250408"
disk_size         = 10

public_subnets = {
  "us-central1" = "10.10.0.0/16"
  
}

private_subnets = {
  "asia-southeast1" = "10.20.0.0/16"
}
