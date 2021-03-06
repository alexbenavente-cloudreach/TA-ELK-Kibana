resource "aws_security_group" "kibana_sg" {
  vpc_id = data.aws_vpc.main_vpc.id
  ingress {
    description = "ssh"
    cidr_blocks = ["192.168.0.0/16"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  ingress {
    description = "Allow kibana traffic"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 5601
    protocol    = "tcp"
    to_port     = 5601
  }

  egress {
    description = "egress rules"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
  tags = {
    Name = "kibana_sg"
  }
}




