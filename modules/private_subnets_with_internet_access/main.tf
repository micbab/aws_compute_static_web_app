resource "aws_subnet" "private" {

  for_each = var.private_subnets

  vpc_id                  = var.vpc_id
  cidr_block              = each.value
  map_public_ip_on_launch = false
  availability_zone       = var.subnet_zone
  tags = {
    Name = each.key
  }

}

resource "aws_route_table_association" "route_table_association" {

  for_each = var.private_subnets

  subnet_id      = aws_subnet.private[each.key].id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_nat_gateway" "nat_gateway" {
  subnet_id     = var.subnet_id
  allocation_id = aws_eip.elastic_ip.id
  tags = {
    Name = var.nat_gateway_name
  }
}

resource "aws_eip" "elastic_ip" {
  tags = {
    Name = var.eip_name
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = var.route_table_name
  }
}
