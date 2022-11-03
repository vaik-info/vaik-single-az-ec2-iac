resource "aws_instance" "ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = "true"
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.bastion.id]
  root_block_device {
    volume_type = "gp2"
    volume_size = 100
  }
  tags = {
    Name = "${var.prefix}-ec2"
  }
}

resource "aws_eip" "ec2-eip" {
  vpc      = true
  instance = aws_instance.ec2.id
  tags = {
    Name = "${var.prefix}-eip"
  }
}
