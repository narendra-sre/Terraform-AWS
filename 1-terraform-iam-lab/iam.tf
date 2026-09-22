resource "aws_iam_user" "employees" {
  for_each = var.employees
  name     = each.key

  tags = {
    EmployeeID = each.value.employee_id
    Name       = each.value.name
    Department = each.value.department
  }
}

resource "aws_iam_group" "groups" {
  for_each = var.groups
  name     = each.key
}

resource "aws_iam_user_group_membership" "employees" {
  for_each = var.employees
  user     = aws_iam_user.employees[each.key].name
  groups = [
    aws_iam_group.groups[each.value.group].name
  ]
}

resource "aws_iam_policy_attachment" "group_policy" {
  for_each = var.groups
  name     = each.key
  groups = [
    aws_iam_group.groups[each.key].name
  ]
  policy_arn = each.value.policy_arn
}