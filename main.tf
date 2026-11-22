
resource "aws_instance" "web_server" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t3.micro"

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y apache2
              systemctl enable apache2
              systemctl start apache2

              echo "<html><head><title>DevOps Project</title></head><body><h1>Welcome to My DevOps Project!</h1><p>Automated Deployment using Terraform and AWS EC2</p></body></html>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "DevOps-Web-Server"
  }
}
