resource "aws_instance" "microinstance1" {
  ami           = "${aws_ami_from_instance.image-new-1.id}" 
  #ami           = "${data.terraform_remote_state.aws_ami_from_instance.image-new-1.outputs.id}"
  
  instance_type = var.instance_type
  availability_zone = var.availability_zone-Practice1
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.SG-1.id]
  subnet_id              = aws_subnet.public-subnet-1.id
  tags = {
    Name  = "microinstance1"
    
  }
}

resource "aws_instance" "microinstance2" {
  ami           = "${aws_ami_from_instance.image-new-2.id}"
  #ami           = "${data.terraform_remote_state.aws_ami_from_instance.image-new-1.outputs.id}"
  instance_type = var.instance_type
  availability_zone = var.availability_zone-Practice2
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.SG-2.id]
  subnet_id              = aws_subnet.public-subnet-2.id
  tags = {
    Name  = "microinstance2"
    
  }
}

output "instance_of_image_1" {
  description = "ID of the EC2 instance"
  value       = "${aws_instance.microinstance1.id}"
}
output "instance_of_image_2" {
  description = "ID of the EC2 instance"
  value       = "${aws_instance.microinstance2.id}"
}
