resource "aws_security_group" "mysql" {
  name        = "mysql"
  description = "Security group for MySQL database"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DB_SG"
  }
}
