resource "aws_internet_gateway" "us-east-igw" {
  vpc_id = aws_vpc.us-east-vpc.id
  provider = aws

  tags = {
    Name: "us-east-igw"

  }
}