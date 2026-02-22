resource "aws_vpc" "fvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "fastapi-vpc"
  }
}

resource "aws_subnet" "fsubnet1" {
  vpc_id                  = aws_vpc.fvpc.id
  cidr_block              = "10.0.0.1/16"
  availability_zone       = "ap-south-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "fastapi-subnet-1"
  }
}

resource "aws_subnet" "fsubnet2" {
  vpc_id                  = aws_vpc.fvpc.id
  cidr_block              = "10.0.0.2/16"
  availability_zone       = "ap-south-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "fastapi-subnet-2"
  }
}


resource "aws_internet_gateway" "figw" {
  vpc_id = aws_vpc.fvpc.id
  tags = {
    Name = "fastapi-igw"
  }
}

resource "aws_route_table" "frtb" {
  vpc_id = aws_vpc.fvpc.id
  tags = {
    Name = "fastapi-rtb"
  }
}

resource "aws_route_table_association" "frtb_assoc1" {
  subnet_id      = aws_subnet.fsubnet1.id
  route_table_id = aws_route_table.frtb.id
}

resource "aws_route_table_association" "frtb_assoc2" {
  subnet_id      = aws_subnet.fsubnet2.id
  route_table_id = aws_route_table.frtb.id
}
 