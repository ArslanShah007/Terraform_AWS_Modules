#                                               Created By Syed Muhammad Arslan

###############################################----------Prerequsits----------######################################################
# 1. AWS CLI must be installed if not then follow. (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) #
# 2. You must have aws account with access key.                                                                                    #
# 2. If you do not have one then create from IAM->Users->user_name->Security credential->Create access key.                        #
# 3. In command line type (aws configure) & set credentials but this totally upto you. You can also use provider & cli variables.  #
# 4. Now open this file in code editor & use programs (P1,P2..) from each section like IAM, EC2, S3 etc according your need.       #
####################################################################################################################################

########################################------RUN Program------############################################
# 1. To run each program first uncomment it by removing "#" symbol before each line                       #
# 2. Open CMD/Terminal in project directory (AWS Infrastructure).                                         #
# 3. Now to run code use following commands.                                                              #
#       a. terraform init                       (To initialize project and each module)                   #
#       b. terraform plan                       (To preview actions that will be perform by program)      #
#       c. terraform apply                      (To apply infrastructure to your aws account)             #
#       d. terraform destroy                    (To destroy applied infrastructure on your aws account)   #
#       e. terraform output variable_name       (To get output of sensitive variables)                    #
###########################################################################################################


##############################################
#       ||      //\\      ||\\    //||       #
#       ||     //  \\     || \\  // ||       #
#       ||    //----\\    ||  \\//  ||       #
#       ||   //      \\   ||        ||       #
##############################################

###########################/////////////// Instructions \\\\\\\\\\\\\\\##################################
# 1. To create simple user without any policy use P1. Provide user name & description to module.        #
# 2. To create admmin user login use P2. Provide user name, description & password length to module.    #
# 3. If you want to create admin user then use P3. Provide user name, description to module.            #
# 4. If you want to create admin user with programmatic access use P3 & P4. Provide user name in both.  #
# 5. If you want to create simple user with programmatic access use P1 & P4. Provide user name in both. #
#########################################################################################################

#############################
# P1: To Create Simple User #
#############################

module "user" {
    source = "./Modules/IAM/USER"  
    user_name = "Arslan"
    description = "admin user"
}

########################
# P2: Admin User Login #
########################

# Note: To create user with login no need to create user explicitly

module "user_login" {
    source = "./Modules/IAM/ADMIN_LOGIN_PROFILE" 
    user_name = "Arslan"
    description = "admin user"
    password_length = 20 
}

output "password" {
    sensitive = true
    value = module.user_login.password
}

# output "account_id" {
#     value = module.user_login.account_id
# }

# output "account_arn" {
#     value = module.user_login.caller_arn
# }

################
# Admin Rights #
################

# module "admin_user" {
#     source = "./Modules/IAM/ADMIN_USER" 
#     user_name = "Arslan"
#     description = "Admin User"
# }

#################################
# To Create Programmatic Access #
#################################

# module "programmatic_access" {
#     depends_on = [ module.admin_user ]
#     source = "./Modules/IAM/PROGRAMMATIC_ACCESS" 
#     user_name = "Arslan"
# }

# output "secret_key" {
#     sensitive = true
#     value = module.programmatic_access.secret_key
# }

# output "access_key" {
#     sensitive = true
#     value = module.programmatic_access.access_key
# }
