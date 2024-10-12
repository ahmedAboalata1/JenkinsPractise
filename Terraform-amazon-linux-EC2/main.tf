resource "aws_instance" "default_instance" {
  ami                    = "ami-0866a3c8686eaeeba"
  instance_type          = "t3.medium"
  subnet_id              = "subnet-09a7de5db12212203"
  vpc_security_group_ids = [aws_security_group.default_sg.id]

  root_block_device {
    volume_size = 20
    volume_type = "gp2"   
  }
  key_name = "project"

  tags = {
    Name = "Terraform EC2 Default VPC"
  }
}
