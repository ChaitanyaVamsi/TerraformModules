# Outputs in Terraform are used to display important values after a Terraform run (like apply or output commands). Outputs can be used for various purposes:

# Display Information: To show important information (like IP addresses, URLs, or instance IDs) that you might want to see after applying a Terraform configuration.

# Use in Other Modules: Outputs from one module can be used as inputs to another module. This is useful when building a modular infrastructure, as one module can expose necessary information to other parts of your setup.

output "vpc_id_module" {
  value = aws_vpc.main.id

}

output "pubic_subnet_id" {
  value = aws_subnet.public[*].id
}

output "private_subnet_id" {
  value = aws_subnet.private[*].id
}

output "database_subnet_id" {
  value = aws_subnet.database[*].id
}
