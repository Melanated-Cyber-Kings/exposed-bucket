# Create a NAT Gateway for the US EAST VPC
resource "aws_eip" "us-east-nat" {
  provider = aws
  # vpc = true

  tags = {
    Name = "us-east-nat"
  }
}

resource "aws_nat_gateway" "us-east-nat" {
  allocation_id = aws_eip.us-east-nat.id
  subnet_id     = aws_subnet.us-east-public-subnet-1a.id
  provider = aws

  tags = {
    Name = "us-east-nat"
  }

  depends_on = [aws_internet_gateway.us-east-igw]
}