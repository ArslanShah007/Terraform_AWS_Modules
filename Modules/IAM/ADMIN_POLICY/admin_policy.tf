data "aws_iam_policy_document" "admin_policy"{
    statement {
        effect = "Allow"
        actions = ["*"]
        resources = ["*"]
    }
}

resource "aws_iam_user_policy" "admin"{
    name = "ADMIN_POLICY"
    user = var.user_name
    policy = data.aws_iam_policy_document.admin_policy.json
}