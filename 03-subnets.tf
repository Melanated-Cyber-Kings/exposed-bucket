/////////////////////////////////////////////////////////////////////////////

#Public Subnet 

resource "aws_subnet" "us-east-public-subnet-1a" {                
    vpc_id = aws_vpc.us-east-vpc.id                     
    cidr_block = "172.19.1.0/24"             
    availability_zone = "us-east-1a"
    provider    = aws       
    tags = {                                           
        Name: "subnet-1a"  
       
    }
}

resource "aws_subnet" "us-east-private-subnet-1a" {                
    vpc_id = aws_vpc.us-east-vpc.id                     
    cidr_block = "172.19.11.0/24"             
    availability_zone = "us-east-1a"
    provider    = aws       
    tags = {                                           
        Name: "subnet-1a"  
       
    }
}