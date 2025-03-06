
provider "aws" {
  # profile = "AdministratorAccess"
  # profile = "iam-profile"
  # profile = "ssoprofile-with-session-name"
  region  = "us-west-1"
}


resource "aws_instance" "aws_ubuntu" {
  instance_type   = "t2.micro"
  ami             = "ami-07d2649d67dbe8900"
  user_data       = file("commands.tpl")
  key_name        = "UCSC2025"
  security_groups = [aws_security_group.demo_sg.name]
  tags = {
    Name = "aws_ubuntu"
  }
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "demo_sg" {
  name        = "demo_sg"
  description = "allow ssh on 22 & http on port 80"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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