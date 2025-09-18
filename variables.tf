variable "project" {
  type        = string
  description = "Tên project trên GCP"
}


variable "machine_type" {
  type        = string
  description = "Loại VM"
}

variable "disk_image" {
  type        = string
  description = "Ảnh OS cho VM"
}

variable "disk_size" {
  type        = number
  description = "Dung lượng ổ đĩa VM (GB)"
}

variable "public_subnets" {
  type        = map(string)
  description = "Danh sách public subnet theo region"
}

variable "private_subnets" {
  type        = map(string)
  description = "Danh sách private subnet theo region"
}
