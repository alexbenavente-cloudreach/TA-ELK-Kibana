resource "aws_security_group" "kibana_sg" {
  vpc_id = data.aws_vpc.main_vpc.id
  ingress {
    description = "ingress rules"
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 5601
    protocol = "tcp"
    to_port = 5601
  }
 tags={
    Name="kibana_sg"
  }
 }