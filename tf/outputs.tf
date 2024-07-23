# Output the endpoint of your cluster
output "ecr_repository_url_service1" {
  value = aws_ecr_repository.service1.repository_url
}

output "ecr_repository_url_service2" {
  value = aws_ecr_repository.service2.repository_url
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}

# Create a local file with Helm values
resource "local_file" "helm_values" {
  content = yamlencode({
    service1 = {
      image = {
        repository = aws_ecr_repository.service1.repository_url
        tag        = "latest"
      }
    }
    service2 = {
      image = {
        repository = aws_ecr_repository.service2.repository_url
        tag        = "latest"
      }
    }
  })
  filename = "${path.module}/helm/helm_values.yaml"
}