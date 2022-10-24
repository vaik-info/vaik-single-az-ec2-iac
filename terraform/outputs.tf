output "bastion_ec2_key_pair" {
  description = "Bastion EC2 Key Pair"
  value       = aws_instance.ec2.key_name
}

output "bastion_ec2_eip" {
  description = "Bastion EC2 EIP"
  value       = aws_eip.ec2-eip.public_ip
}