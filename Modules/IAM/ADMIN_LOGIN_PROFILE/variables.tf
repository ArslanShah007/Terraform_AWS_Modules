variable "password_length"{
    type = number
}

variable "user_name"{
    type = string
}

variable "description"{
    type = string
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}