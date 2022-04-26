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


resource "aws_instance" "kibana" {
  ami               = "ami-04505e74c0741db8d"
  availability_zone = "us-east-1a"
  instance_type     = "t3.medium"

  tags = {
    Name = "Kibana-instance"
  }
}
