resource "aws_instance" "EC2-1" {
  ami           = var.ami-Practice1
  instance_type = var.instance_type
  availability_zone = var.availability_zone-Practice1
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.SG-1.id]
  subnet_id              = aws_subnet.public-subnet-1.id
  tags = {
    Name  = "1"
    
  }
}


resource "aws_instance" "EC2-2" {
  ami           = var.ami-Practice2
  instance_type = var.instance_type
  availability_zone = var.availability_zone-Practice2
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.SG-2.id]
  subnet_id              = aws_subnet.public-subnet-2.id
  tags = {
    Name  = "2"
    
  }
}



