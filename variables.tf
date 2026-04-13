variable "region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t3.small"
}

variable "key_name" {
  description = "Existing AWS Key Pair"
}
