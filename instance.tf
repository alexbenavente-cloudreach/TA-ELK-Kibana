resource "aws_instance" "Kibana" {
  ami                    = data.aws_ami.aws_basic_ami.id
  instance_type          = "t3.medium"
  subnet_id              = data.aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.kibana_sg.id]
  key_name               = var.my_keypair
  count                  = var.number_of_instances
  tags = {
    Name = "Kibana_server_${count.index + 1}"
  }
}

