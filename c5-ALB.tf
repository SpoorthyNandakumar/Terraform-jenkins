module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "my-alb-1"

  load_balancer_type = "application"

  vpc_id             = aws_vpc.vpc.id
  subnets            = [aws_subnet.public-subnet-1.id,aws_subnet.public-subnet-2.id]  
  security_groups    = [aws_security_group.SG-1.id,aws_security_group.SG-2.id]

 
  target_groups = [
    {
      name_prefix      = "us-tg"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = [
        {
          target_id = "${aws_instance.EC2-1.id}"
          #target_id ="${data.terraform_remote_state.instance_1_ID.outputs.instance_id}"
          port = 80
        },
        {
          target_id = "${aws_instance.EC2-2.id}"
          #target_id ="${data.terraform_remote_state.instance_2_ID.outputs.instance_id}"
          port = 80
        }
      ]
    }
  ]

  
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Test"
  }
}
