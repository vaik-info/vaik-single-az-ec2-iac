resource "aws_security_group" "bastion" {
  name = "${var.prefix}bastion-sg"

  description = "EC2 service security group for bastion server"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = [var.ingress_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}