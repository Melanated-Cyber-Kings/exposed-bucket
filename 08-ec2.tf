#creating ec2 instance
resource "aws_instance" "ec2" {
    provider = aws
    ami = "ami-0c765d44cf1f25d26"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.us-east-public-subnet-1a.id
    associate_public_ip_address = true
    key_name = "my-first-instance"
    tags = {
        Name = "EC2-for-RDS"
    }
    security_groups = [ aws_security_group.us-east-SG01.id ]
}
