variable "role_name" {
  description = "Role Name for the IAM role created for this lab"
  type        = string
  default     = "s3-read-role"
}

variable "bucket_name" {
  description = "Bucket name"
  type        = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}