output "ec2_key_pair" {
  description = "EC2 Key Pair"
  value       = aws_instance.ec2.key_name
}

output "ec2_eip" {
  description = "EC2 EIP"
  value       = aws_eip.ec2-eip.public_ip
}