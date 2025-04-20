//////VPC RESOURCE////////////////////////////////////////

#US East VPC

resource "aws_vpc" "us-east-vpc" {                    
    cidr_block = "172.19.0.0/24"     
    tags = {                                        
        Name: "vpc"                
    }
}

//////////////////////////////////////////////////////////