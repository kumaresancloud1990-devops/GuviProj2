# ---------------- VPC ----------------
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# ---------------- Subnet ----------------
resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

# ---------------- Internet Gateway (ONLY ONE) ----------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

# ---------------- Route Table ----------------
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id
}

# ---------------- Route ----------------
resource "aws_route" "route" {
  route_table_id         = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# ---------------- Route Table Association ----------------
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.rt.id
}

# ---------------- Security Group ----------------
resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ---------------- IAM Role ----------------
resource "aws_iam_role" "ec2_role" {
  name = "jenkins-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

# ---------------- Instance Profile ----------------
resource "aws_iam_instance_profile" "profile" {
  name = "jenkins-profile"
  role = aws_iam_role.ec2_role.name
}

# ---------------- EC2 Instance ----------------
resource "aws_instance" "jenkins" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnet.id

  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.profile.name

 tags = {
    Name = "Jenkins-Server"
  }
}
