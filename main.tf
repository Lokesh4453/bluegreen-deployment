resource "aws_instance" "blue_server" {
  ami           = "ami-0f5ee92e2d63afc18"  # Amazon Linux 2 (Mumbai)
  instance_type = "t2.micro"

  tags = {
    Name = "Blue-Server"
  }
}
