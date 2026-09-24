# ==========================================
# SSH Key Pair
# ==========================================
resource "aws_key_pair" "deployer" {
  key_name   = "enterprise-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# ==========================================
# Bastion Host (Public Subnet)
# ==========================================
resource "aws_instance" "bastion" {
  ami                    = var.ami_id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_1.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  key_name               = aws_key_pair.deployer.key_name

  tags = {
    Name = "bastion-host"
    Role = "Bastion"
  }
}

# ==========================================
# Private EC2 Instance
# ==========================================
resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_1.id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  key_name               = aws_key_pair.deployer.key_name

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Enterprise App Server - Deployed by Terraform</h1>" > /var/www/html/index.html
  EOF

  tags = {
    Name = "app-server"
    Role = "Application"
  }
}
