resource "aws_key_pair" "my-ssh-key" {
  key_name   = "my-ssh-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "kind_sg" {
  name        = "kind-sg"
  description = "Allow SSH and Kubernetes ports"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 30000
    to_port     = 32767
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

resource "aws_instance" "kind_node" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.my-ssh-key.key_name
  security_groups = [aws_security_group.kind_sg.name]

#   user_data = file("scripts/setup-kind.sh")

  tags = {
    Name = "Kind-cluster-1012434"
  }
}
