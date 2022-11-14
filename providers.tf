provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "vault-demo"
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "vault-demo"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = "vault-demo"
}