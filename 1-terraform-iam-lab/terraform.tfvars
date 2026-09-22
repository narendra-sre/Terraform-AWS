employees = {
  "narendra" = {
    employee_id = "2732443"
    name        = "Narendra Sivangula"
    department  = "DevOps"
    group       = "DevOps"
  }

  "prem" = {
    employee_id = "2734567"
    name        = "Prem Chand"
    department  = "DevOps"
    group       = "DevOps"
  }

  "vinay" = {
    employee_id = "2732436"
    name        = "Vinay Kumar"
    department  = "Developers"
    group       = "Developers"
  }

  "ram" = {
    employee_id = "2732445"
    name        = "Ram Kumar"
    department  = "QA"
    group       = "Testing"
  }
}

groups = {
  "DevOps" = {
    policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
  }

  "Developers" = {
    policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
  }

  "Testing" = {
    policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  }
}