resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_eip" "nat_elastic_ip" {
  vpc = true
}

resource "aws_nat_gateway" "ngw" {
  depends_on = [aws_internet_gateway.igw]

  allocation_id = aws_eip.nat_elastic_ip.id
  subnet_id     = aws_subnet.public_subnet_a.id
}