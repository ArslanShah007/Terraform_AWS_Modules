
module "user"{
    source = "../USER"
    user_name = var.user_name
    description = var.description
}

module "admin"{
    depends_on = [ module.user ]
    source = "../ADMIN_POLICY"
    user_name = module.user.user_name
}
