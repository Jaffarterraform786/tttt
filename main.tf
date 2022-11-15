resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}
resource "aws_route_table" "publicroutetable1" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    name = "publicroutetable1"
  }
}

resource "aws_route_table" "publicroutetable2" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    name = "publicroutetable2"
  }
}

resource "aws_route_table" "publicroutetable3" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    name = "publicroutetable3"
  }
}

resource "aws_route_table" "publicroutetable4" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    name = "publicroutetable4"
  }
}

resource "aws_route_table_association" "publicsubetroutetableassociation1" {
  route_table_id = aws_route_table.publicroutetable1.id
  subnet_id      = aws_subnet.publicsubnet.id
}
resource "aws_route_table_association" "publicsubetroutetableassociation2" {
  route_table_id = aws_route_table.publicroutetable2.id
  subnet_id      = aws_subnet.publicsubnet.id
}

resource "aws_route_table_association" "publicsubetroutetableassociation3" {
  route_table_id = aws_route_table.publicroutetable3.id
  subnet_id      = aws_subnet.publicsubnet.id
}
resource "aws_route_table_association" "publicsubetroutetableassociation4" {
  route_table_id = aws_route_table.publicroutetable4.id
  subnet_id      = aws_subnet.publicsubnet.id
}

resource "aws_subnet" "publicsubnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Main1"
  }
}

resource "aws_subnet" "publicsubnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.8.0/21"

  tags = {
    Name = "Main2"
  }
}

resource "aws_subnet" "publicsubnet3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.32.0/19"

  tags = {
    Name = "Main3"
  }
}

resource "aws_subnet" "publicsubnet4" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.192.0/19"

  tags = {
    Name = "Main4"
  }
}


resource "aws_internet_gateway" "internetgateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    name = "prod internetgateway"
  }
}
resource "aws_route" "internetgatewayroute" {
  route_table_id         = aws_route_table.publicroutetable.id
  gateway_id             = aws_internet_gateway.internetgateway.id
  destination_cidr_block = "0.0.0.0/0"
}
