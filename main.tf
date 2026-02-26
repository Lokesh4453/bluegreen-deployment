resource "aws_instance" "blue_server" {
  ami           = "ami-0f5ee92e2d63afc18"  # Amazon Linux 2 (Mumbai)
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Blue Environment - Jenkins Deployment</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Blue-Server"
  }
}
