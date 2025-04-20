  //US East Public Route Table 

resource "aws_route_table" "us-east-public" {
  vpc_id = aws_vpc.us-east-vpc.id
  provider = aws

  route {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.us-east-igw.id
      nat_gateway_id             = null
      carrier_gateway_id         = null
      destination_prefix_list_id = null
      egress_only_gateway_id     = null
      #instance_id                = null
      ipv6_cidr_block            = null
      local_gateway_id           = null
      network_interface_id       = null
      transit_gateway_id         = null
      vpc_endpoint_id            = null
      vpc_peering_connection_id  = null
      core_network_arn           = null
    }
 
  tags = {
    Name: "subnet-1a-public-rtb"
  }

}


//US East Private Route Table 

resource "aws_route_table" "us-east-private" {
  vpc_id = aws_vpc.us-east-vpc.id
  provider = aws

  route {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.us-east-igw.id
      nat_gateway_id             = null
      carrier_gateway_id         = null
      destination_prefix_list_id = null
      egress_only_gateway_id     = null
      #instance_id                = null
      ipv6_cidr_block            = null
      local_gateway_id           = null
      network_interface_id       = null
      transit_gateway_id         = null
      vpc_endpoint_id            = null
      vpc_peering_connection_id  = null
      core_network_arn           = null
    }
  
 #route {
 #cidr_block = "172.0.0.0/8"
 #transit_gateway_id  = aws_ec2_transit_gateway.tokyo_tgw.id
 #}

  tags = {
    Name: "subnet-1a-private-rtb"
  }

}

//US East Private Route Table Associations

resource "aws_route_table_association" "us-east-private-1a" {
  provider = aws
  subnet_id      = aws_subnet.us-east-private-subnet-1a.id
  route_table_id = aws_route_table.us-east-private.id
}


//US East Private Route Table Associations

resource "aws_route_table_association" "us-east-public-1a" {
  provider = aws
  subnet_id      = aws_subnet.us-east-public-subnet-1a.id
  route_table_id = aws_route_table.us-east-public.id
}