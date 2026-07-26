resource "aws_instance" "web_server" {
  ami                         = "ami-0c101f26f147fa7fd" # Amazon Linux 2023 (or your AMI var)
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y nginx
              echo "<h1>Deployed by antr-bell via HCP Terraform & Sentinel</h1>" > /usr/share/nginx/html/index.html
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "dev-web-server"
  }
}