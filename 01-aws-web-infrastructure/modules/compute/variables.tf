variable "name_prefix" {
  description = "Prefix name for resources"
  type        = string
}

variable "common_tags" {
  description = "Common tags for resources"
  type        = map(string)
}

variable "instance_type" {
  description = "EC2 instance type for web server"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet where the EC2 is created"
  type        = string
}

variable "security_group_id" {
  description = "Security group attached to ec2 instance"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM instance profile"
  type        = string
}