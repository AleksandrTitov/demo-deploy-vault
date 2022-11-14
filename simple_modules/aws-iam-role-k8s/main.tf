resource "aws_iam_role" "main" {
  name = var.name

  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "Federated" : var.aws_iam_openid_connect_provider_arn
          },
          "Action" : "sts:AssumeRoleWithWebIdentity",
          "Condition" : {
            "StringEquals" : {
              format("%s:aud", var.aws_iam_openid_connect_provider_url) : "sts.amazonaws.com",
              format("%s:sub", var.aws_iam_openid_connect_provider_url) : format("system:serviceaccount:%s:%s", var.k8s_namespace, var.k8s_serviceaccount)
            }
          }
        }
      ]
    }
  )
}

resource "aws_iam_policy" "main" {
  for_each = var.polices

  name = each.key

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : each.value.effect,
          "Action" : each.value.actions,
          "Resource" : each.value.resource,
        }
      ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "main" {
  for_each = aws_iam_policy.main

  role       = aws_iam_role.main.name
  policy_arn = each.value.arn
}
