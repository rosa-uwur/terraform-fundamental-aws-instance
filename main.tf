## Data para obtener el ID del AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] 
}
## Resource que crea una instance en AWS
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
  security_groups = [aws_security_group.allow_http.name]
}
#Recurso que crea un security group en AWS
resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow http inbound traffic"

  ingress {
    description      = "Http from internet"
    to_port          = 80
    from_port        = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }
}