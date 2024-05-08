# main.tf
provider "aws" {
  region = "eu-north-1" # Change this to your desired region
}

resource "aws_instance" "myapp" {
  ami                    = "ami-03c3351e3ce9d04eb" # Change this to your desired AMI
  instance_type          = "t3.micro"
  key_name               = "new"    # Change this to your key pair name
  security_groups        = ["launch-wizard-2"] # Change this to your security group name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y nodejs npm
              git clone https://github.com/dorzz888/myA.git /home/ubuntu/app
              cd /home/ubuntu/app
              npm install
              node app.js &
              EOF
}



