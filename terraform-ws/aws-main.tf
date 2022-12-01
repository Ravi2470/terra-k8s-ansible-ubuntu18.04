locals {
  vpc_id           = "vpc-0fd064b5f57a23ae1"
  subnet_id        = "subnet-023f667fa7a50d0d9"
  ssh_user         = "ubuntu"
  key_name         = "devops"
  private_key_file = "../devops.pem"
}


resource "aws_security_group" "nginx" {
  name   = "nginx_access"
  vpc_id = local.vpc_id

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

  ingress {
    from_port   = 6443
    to_port     = 6443
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

resource "aws_instance" "aws_k8s_master" {
  ami                         = "ami-01ebac1e76247c6f2"
  subnet_id                   = "subnet-023f667fa7a50d0d9"
  instance_type               = "t2.medium"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.nginx.id]
  key_name                    = local.key_name
  tags = {
    Name = "aws_k8s_master"
  }
}

resource "aws_instance" "aws_k8s_worker" {
  ami                         = "ami-01ebac1e76247c6f2"
  subnet_id                   = "subnet-023f667fa7a50d0d9"
  instance_type               = "t2.medium"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.nginx.id]
  key_name                    = local.key_name
  tags = {
    Name = "aws_k8s_worker"
  }
}
