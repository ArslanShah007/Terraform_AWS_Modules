resource "aws_iam_user" "user" {
    name = var.user_name
    tags = {
        type = var.description
    }
}
