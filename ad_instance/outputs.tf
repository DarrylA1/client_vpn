output "private_subnet_id_b" {
  value       = aws_subnet.privatebad.id
  description = "The ID of the private subnet."
}

output "private_subnet_id_final" {
  value       = aws_subnet.privatefinal.id
  description = "The ID of the private subnet."
}