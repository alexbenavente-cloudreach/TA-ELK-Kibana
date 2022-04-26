resource "aws_instance" "kibana" {
  ami                    = data.aws_ami.aws_ubuntu.id
  instance_type          = "t3.medium"
  subnet_id              = data.aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.kibana_sg.id]
  key_name               = var.my_keypair
  tags = {
    Name = "Kibana_server"
  }
}

resource "aws_volume_attachment" "ebs_attch" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_kibana.id
  instance_id = aws_instance.kibana.id
}


resource "aws_ebs_volume" "ebs_kibana" {
  availability_zone = "us-east-1a"
  size              = 50

  tags = {
    Name = "EBSKIBANA"
  }
}
