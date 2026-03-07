output "map_service_access_key" {
  value     = aws_iam_access_key.map_service.id
  sensitive = true
}

output "map_service_secret_key" {
  value     = aws_iam_access_key.map_service.secret
  sensitive = true
}
