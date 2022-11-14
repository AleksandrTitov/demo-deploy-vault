module "namespace" {
  source = "../simple_modules/k8s-namespace"

  name = var.namespace
}

module "kms_key" {
  source = "../simple_modules/aws-kms-key"

  name = var.release_name
}

module "aws_iam_role_vault" {
  source = "../simple_modules/aws-iam-role-k8s"

  name                                = var.release_name
  k8s_serviceaccount                  = var.release_name
  k8s_namespace                       = module.namespace.name
  aws_iam_openid_connect_provider_arn = var.aws_iam_openid_connect_provider_arn
  aws_iam_openid_connect_provider_url = var.aws_iam_openid_connect_provider_url
  polices = {
    "vault" = {
      actions = [
        "kms:Encrypt",
        "kms:Decrypt",
        "kms:DescribeKey",
      ]
      effect   = "Allow"
      resource = module.kms_key.arn
    }
  }
}

module "helm_release_vault" {
  source = "../simple_modules/helm-release"

  name          = var.release_name
  repository    = "https://helm.releases.hashicorp.com"
  chart         = "vault"
  chart_version = var.chart_version
  namespace     = module.namespace.name

  values = [
    templatefile("${path.module}/templates/hashicorp-vault.yaml.tftpl", {
      release_name           = var.release_name
      high_availability_mode = var.high_availability_mode
      standalone_mode        = var.high_availability_mode ? false : true
      namespace              = module.namespace.name
      ui_enabled             = var.ui_enabled
      disable_mlock          = var.disable_mlock
      kms_key_id             = module.kms_key.key_id
      iam_role_arn           = module.aws_iam_role_vault.arn
      region                 = var.aws_region
    })
  ]
}
