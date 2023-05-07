module "admin_policy"{
  source = "../ADMIN_USER"
  user_name = var.user_name
  description = var.description
}


resource "aws_iam_user_login_profile" "user_login" {
  depends_on = [module.admin_policy]
  user = module.admin_policy.user_name
  password_length = var.password_length < 8 ? 8 : var.password_length
  password_reset_required = true
}

data "aws_caller_identity" "current" {
  
}
