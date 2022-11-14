module "hashicorp_vault" {
  source = "./hashicorp-vault"

  aws_region                          = var.aws_region
  aws_iam_openid_connect_provider_arn = var.aws_iam_openid_connect_provider_arn
  aws_iam_openid_connect_provider_url = var.aws_iam_openid_connect_provider_url
}
