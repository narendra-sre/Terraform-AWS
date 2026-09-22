output "employee_details" {
  value = {
    for username, user in var.employees :
    user.employee_id => {
      Username   = aws_iam_user.employees[username].name
      Name       = user.name
      Department = user.department
      Group      = user.group
    }
  }
}

output "policy_details" {
  value = {
    for group, policy in var.groups :
    group => {
      Policy_ARN = policy.policy_arn
    }
  }
}