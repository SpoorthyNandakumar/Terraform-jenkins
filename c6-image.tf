resource "aws_ami_from_instance" "image-new-1" {
  name               = "terraform-img1"
  source_instance_id = "${aws_instance.EC2-1.id}"
  #source_instance_id = "${data.terraform_remote_state.instance_1_ID.outputs.instance_id}" 
  tags = {
    Name  = "IMAGE-1"
    
  }
}


resource "aws_ami_from_instance" "image-new-2" {
  name               = "terraform-img2"
  source_instance_id = "${aws_instance.EC2-2.id}"
  #source_instance_id = "${data.terraform_remote_state.instance_2_ID.outputs.instance_id}" 
  tags = {
    Name  = "IMAGE-2"
    
  }
}

output "image_id_1" {
  description = "image ID of EC2-1"
  value = "${aws_ami_from_instance.image-new-1.id}"
}


output "image_id_2" {
  description = "image ID of EC2-2"
  value = "${aws_ami_from_instance.image-new-2.id}"
}

