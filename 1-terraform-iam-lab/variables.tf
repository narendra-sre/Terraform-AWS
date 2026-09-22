variable "employees" {
  type = map(object({
    employee_id = string
    name        = string
    department  = string
    group       = string
  }))
}

variable "groups" {
  type = map(object({
    policy_arn = string
  }))
}