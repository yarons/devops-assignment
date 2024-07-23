# Configure the AWS Provider
provider "aws" {
  region = var.region
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

resource "local_file" "kubeconfig" {
  content  = templatefile("${path.module}/templates/kubeconfig.tpl", {
    cluster_name    = module.eks.cluster_name
    cluster_endpoint = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    aws_region      = var.region
  })
  filename = "${path.module}/kubeconfig_${module.eks.cluster_name}.yaml"
}

data "local_file" "kubeconfig" {
  depends_on = [local_file.kubeconfig]
  filename   = local_file.kubeconfig.filename
}

provider "kubernetes" {
  config_path = data.local_file.kubeconfig.filename
}