 resource "aws_security_group" "us-east-SG01" {
   name        = "us-east-SG01"
   description = "us-east-SG01"
   vpc_id      = aws_vpc.us-east-vpc.id

   provider = aws

   ingress {
     description = ""
     from_port   = 80
     to_port     = 80
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }

   egress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     cidr_blocks = ["0.0.0.0/0"]
   }

   tags = {
     Name    = "us-east-SG01"
   }

 }