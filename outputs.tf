output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_1_id" {
  value = aws_subnet.public_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_2.id
}

output "private_subnet_1_id" {
  value = aws_subnet.private_1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.private_2.id
}

output "bastion_public_ip" {
  description = "Public IP of bastion host"
  value       = aws_instance.bastion.public_ip
}

output "app_server_private_ip" {
  description = "Private IP of app server"
  value       = aws_instance.app_server.private_ip
}

output "ssh_bastion_command" {
  value = "ssh -i ~/.ssh/id_rsa ec2-user@${aws_instance.bastion.public_ip}"
}
